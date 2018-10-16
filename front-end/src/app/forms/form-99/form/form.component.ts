import { Component, Input, NgZone, OnInit, ViewEncapsulation, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, NgForm, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Observable, of } from 'rxjs';
import { environment } from '../../../../environments/environment';
import { ApiService } from '../../../shared/services/APIService/api.service';
import { MessageService } from '../../../shared/services/MessageService/message.service';
import { TypeComponent } from '../type/type.component';
import { ReasonComponent } from '../reason/reason.component';

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class FormComponent implements OnInit {

  @Input() status: any;

  public frm: any;
  public direction: string;
  public step: string = 'step_1';
  public currentStep: string = 'step_1';
  public previousStep: string = '';
  public isLoading: boolean = true;

  private _committee_details: any = {};
  private _step: string = '';

  constructor(
    private _fb: FormBuilder,
    private _router: Router,
    private _route: ActivatedRoute,
    private _apiService: ApiService,
    private _messageService: MessageService
  ) { }

  ngOnInit(): void {
    this._committee_details = JSON.parse(localStorage.getItem('committee_details'));

    if(this._committee_details) {
      if(this._committee_details.committeeid) {
        if(!this._committee_details.is_submitted) {
            this._apiService
              .getForm99(
                this._committee_details.committeeid,
                this._committee_details.is_submitted
              )
              .subscribe(res => {
                if(res) {
                  localStorage.setItem('form_99_details', JSON.stringify(res));
                  this.isLoading = false;
                  if(this._route.snapshot.queryParams.step) {
                    this.currentStep = this._route.snapshot.queryParams.step;
                    this.step = this.currentStep;
                  }
                }
              });
        } else {
          this.isLoading = false;
        }
      }
    }

    this._router
      .events
      .subscribe(val => {
        if(val) {
          if(this._route.snapshot.queryParams.step !== this.currentStep) {
            this.currentStep = this._route.snapshot.queryParams.step;
            this.step = this._route.snapshot.queryParams.step;
          }
        }
      });
  }

  public canContinue() {
    if(this.frm && this.direction) {
      if(this.direction === 'next') {
        if(this.frm.valid) {
          this.step = this._step;

          this._router.navigate(['/forms/form/99'], { queryParams: { step: this.step } });
        }
      } else if(this.direction === 'previous') {
        this.step = this._step;

        this._router.navigate(['/forms/form/99'], { queryParams: { step: this.step } });
      }
    }
  }

  public onNotify(e) {
    this.frm = e.form;

    this.direction = e.direction;

    this.previousStep = e.previousStep;

    this._step = e.step;

    this.currentStep = e.step;

    this.canContinue();
  }

  /**
   * Cancels the form 99 entry.
   *
   */
  public cancel(): void {
    this._router.navigate(['./dashboard', ]);
  }
}
