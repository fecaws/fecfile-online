import { SchedHServiceService } from './../../sched-h-service/sched-h-service.service';
import { SchedHMessageServiceService } from './../../sched-h-service/sched-h-message-service.service';
import { ScheduleActions } from './../individual-receipt/schedule-actions.enum';
import { NgForm } from '@angular/forms';
import { Component, OnInit, Output, EventEmitter, ViewChild } from '@angular/core';
import { Observable, Subscription } from 'rxjs';
import 'rxjs/add/observable/of';
import { environment } from '../../../../environments/environment';
import { CookieService } from 'ngx-cookie-service';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-sched-h1',
  templateUrl: './sched-h1.component.html',
  styleUrls: ['./sched-h1.component.scss']
})


export class SchedH1Component implements OnInit {
  @Output() status: EventEmitter<any> = new EventEmitter<any>();
  @ViewChild('f') form: NgForm;

  public formType = '';
  private scheduleAction: ScheduleActions = ScheduleActions.add;
  populateFormForEdit: Subscription;
  transaction_id: any;

  constructor(
    private _http: HttpClient,
    private _activatedRoute: ActivatedRoute,
    private _cookieService: CookieService,
    private _schedHMessageServiceService: SchedHMessageServiceService,
    private _schedHService: SchedHServiceService
  ) {
    console.log('h1 constructor ...');
    this.populateFormForEdit = this._schedHMessageServiceService.
      getpopulateHFormForEditMessage()
      .subscribe(
        p => {
          if (p.scheduleType === 'Schedule H1') {
            let res = this._schedHService.getSchedule(p.transactionDetail.transactionModel).subscribe(res => {
              if (res && res.length === 1) {
                this.editH1(res[0]);
              }
            });
          }
        })
  }


  ngOnInit() {
    // localStorage.setItem('cmte_type_category', 'PAC')
    //console.log(localStorage.getItem('cmte_type_category'));
    this.formType = this._activatedRoute.snapshot.paramMap.get('form_id');

  }

  public ngOnDestroy(): void {
    this.populateFormForEdit.unsubscribe();
  }

  isPac() {
    //console.log(localStorage.getItem('cmte_type_category'));
    // return true;

    let ispac = false;
    if (localStorage.getItem('committee_details') !== null) {
      let cmteDetails: any = JSON.parse(localStorage.getItem(`committee_details`));
      if (cmteDetails.cmte_type_category === 'PAC') {
        ispac = true;
      }
    }
    //return localStorage.getItem('cmte_type_category') === 'PAC';

    return ispac;
  }

  saveH1(f: NgForm) {
    const token: string = JSON.parse(this._cookieService.get('user'));
    const url: string = `${environment.apiUrl}/sh1/schedH1`;
    // const data: any = JSON.stringify(receipt);
    let httpOptions = new HttpHeaders();

    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);
    httpOptions = httpOptions.append('Content-Type', 'application/json');
    console.log('post h1 url:' + url);

    // build form data and adding report_id
    const formData: FormData = new FormData();
    // formData = new FormData() 
    let h1_obj = { "transaction_type_identifier": "ALLOC_H1" };
    // set report_id
    h1_obj['report_id'] = '0'

    let reportType: any = JSON.parse(localStorage.getItem(`form_${this.formType}_report_type`));
    if (reportType === null || typeof reportType === 'undefined') {
      reportType = JSON.parse(localStorage.getItem(`form_${this.formType}_report_type_backup`));
    }
    console.log(reportType);
    if (reportType.hasOwnProperty('reportId')) {
      h1_obj['report_id'] = reportType.reportId;
      // formData.append('report_id', reportType.reportId);
    } else if (reportType.hasOwnProperty('reportid')) {
      // formData.append('report_id', reportType.reportid);
      h1_obj['report_id'] = reportType.reportid;
    }
    console.log(reportType.reportid)
    // formData.append('federal_percent', '0.45');
    // formData.append('non_federal_percent', '0.55');
    // h1_obj['report_id'] = '121';

    if (this.isPac()) {
      h1_obj['federal_percent'] = f.value.federal_share / 100;
      h1_obj['non_federal_percent'] = f.value.nonfederal_share / 100;
      if (f.value.applied_activity1) {
        h1_obj['administrative'] = true;
      }
      if (f.value.applied_activity2) {
        h1_obj['generic_voter_drive'] = true;
      }
      if (f.value.applied_activity3) {
        h1_obj['public_communications'] = true;
      }
    } else {
      if (f.value.h1_election_year_options === '1') {
        h1_obj['federal_percent'] = '0.28';
        h1_obj['non_federal_percent'] = '0.72';
        h1_obj['presidential_only'] = true;
      } else if (f.value.h1_election_year_options === '2') {
        h1_obj['federal_percent'] = '0.36';
        h1_obj['non_federal_percent'] = '0.64';
        h1_obj['presidential_and_senate'] = true;
      } else if (f.value.h1_election_year_options === '3') {
        h1_obj['federal_percent'] = '0.21';
        h1_obj['non_federal_percent'] = '0.79';
        h1_obj['senate_only'] = true;
      } else if (f.value.h1_election_year_options === '4') {
        h1_obj['federal_percent'] = '0.15';
        h1_obj['non_federal_percent'] = '0.85';
        h1_obj['non_pres_and_non_senate'] = true;
      }
    }

    if (this.scheduleAction === ScheduleActions.add) {
      this._http.post(url, JSON.stringify(h1_obj), {
        headers: httpOptions
      }).subscribe(
        res => {
          console.log(res);
          f.value.message = 'h1 saved.'
          f.reset();
          this.previousStep();
        });
    }
    else if (this.scheduleAction === ScheduleActions.edit) {
      h1_obj['transaction_id'] = this.transaction_id;
      this._http.put(url, JSON.stringify(h1_obj), {
        headers: httpOptions
      }).subscribe(
        res => {
          console.log(res);
          f.value.message = 'h1 saved.'
          f.reset();
          //also reset this.transaction_id so future transactions dont accidentally use it.
          this.transaction_id = null;
          this.previousStep();
        });
    }
  }

  public editH1(item: any) {
    this.scheduleAction = ScheduleActions.edit;
    this.transaction_id = item.transaction_id;

    if (this.isPac()) {
      this.form.control.patchValue({ federal_share: item.federal_percent * 100 }, { onlySelf: true });
      this.form.control.patchValue({ nonfederal_share: item.non_federal_percent * 100 }, { onlySelf: true });
      this.form.control.patchValue({ applied_activity1: item.administrative }, { onlySelf: true });
      this.form.control.patchValue({ applied_activity2: item.generic_voter_drive }, { onlySelf: true });
      this.form.control.patchValue({ applied_activity3: item.public_communications }, { onlySelf: true });
    } else {
      if (item.presidential_only) {
        this.form.control.patchValue({ h1_election_year_options: '1' }, { onlySelf: true });
      }
      else if (item.presidential_and_senate) {
        this.form.control.patchValue({ h1_election_year_options: '2' }, { onlySelf: true });
      }
      else if (item.senate_only) {
        this.form.control.patchValue({ h1_election_year_options: '3' }, { onlySelf: true });
      }
      else if (item.non_pres_and_non_senate) {
        this.form.control.patchValue({ h1_election_year_options: '4' }, { onlySelf: true });
      }
    }
  }

  public handleFedShareFieldKeyup(e, f: NgForm) {
    if (e.target.value <= 100) {
      f.controls.nonfederal_share.setValue(100 - e.target.value);
    } else {
      f.controls.nonfederal_share.setValue(0);
    }
  }

  public handleNonFedShareFieldKeyup(e, f: NgForm) {
    if (e.target.value <= 100) {
      f.controls.federal_share.setValue(100 - e.target.value);
    } else {
      f.controls.federal_share.setValue(0);
    }
  }

  public previousStep(): void {
    this.status.emit({
      form: {},
      direction: 'previous',
      step: 'step_2'
    });
  }

}
