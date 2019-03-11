import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, NgForm, Validators } from '@angular/forms';
import { NgbTooltipConfig } from '@ng-bootstrap/ng-bootstrap';
import { FormsService } from '../../../shared/services/FormsService/forms.service';
import { MessageService } from '../../../shared/services/MessageService/message.service';
import { selectedElectionState, selectedElectionDate, selectedReportType } from '../../../shared/interfaces/FormsService/FormsService';

@Component({
  selector: 'report-type-sidebar',
  templateUrl: './report-type-sidebar.component.html',
  styleUrls: ['./report-type-sidebar.component.scss'],
  providers: [NgbTooltipConfig]
})
export class ReportTypeSidebarComponent implements OnInit {

  @Output() status: EventEmitter<any> = new EventEmitter<any>();
  @Input() specialReports: boolean = false;
  @Input() regularReports: boolean = false;
  @Input() selectedReport: any = null;
  @Input() selectedreporttype:  selectedReportType;

  public electionStates: any = null;
  public electionDates: any = null;
  public frmReportSidebar: FormGroup;
  public fromDate: string = null;
  public toDate: string = null;

  private _selectedElectionDates: any = null;
  private _selectedState: string = null;
  private _selectedElectionDate: string = null;

  constructor(
    private _fb: FormBuilder,
    private _config: NgbTooltipConfig,
    private _formService: FormsService,
    private _messageService: MessageService
  ) {
    this._config.placement = 'right';
    this._config.triggers = 'click';
  }

  ngOnInit(): void {
    this.frmReportSidebar = this._fb.group({
      // txtToDate: ['', Validators.required],
      // txtFromDate: ['', Validators.required]
    });
  }

  ngDoCheck(): void {
    if (this.selectedReport !== null) {
      if (this.selectedReport.hasOwnProperty('election_state')) {
        if (Array.isArray(this.selectedReport.election_state)) {
          if (this.selectedReport.election_state.length === 1) {
            this.fromDate = '';
            this.toDate = '';
            this._selectedElectionDates = null;
            if (this.selectedReport.election_state[0]['dates']) {
              if (Array.isArray(this.selectedReport.election_state[0].dates)) {
                let dates: any = this.selectedReport.election_state[0].dates;

                if (Array.isArray(dates)) {
                  this.fromDate = dates[0].cvg_start_date;
                  this.toDate = dates[0].cvg_end_date;
                }
              }
            }
          } else {
            this.fromDate = '';
            this.toDate = '';
            if (this.selectedReport.hasOwnProperty('election_state')) {
              this.electionStates =  this.selectedReport.election_state;
            }

            if (this._selectedElectionDates !== null) {
              this.fromDate = this._selectedElectionDates.fromDate;
              this.toDate = this._selectedElectionDates.toDate;
            }
          }
        } // isArray(this.selectedReport.election_state)
        if (this.fromDate && this.toDate) {
          let message: any = null;

          if (this._selectedState && this.specialReports) {
            message = {
              'form': '3x',
              'selectedState': this._selectedState,
              'selectedElectionDate': this._selectedElectionDate,
              'toDate': this.toDate,
              'fromDate': this.fromDate
            }
          } else {
            message = {
              'form': '3x',
              'toDate': this.toDate,
              'fromDate': this.fromDate
            }
          }
          this._messageService
            .sendMessage(message);
        } else {
          this._messageService
            .sendMessage({
              'form': '3x',
              'toDate': '',
              'fromDate': ''
            });
        }
      } // hasOwnProperty('election_state')
    } // selectedReport !== null
  }


  public selectStateChange(e): void {
    let selectedVal: string = e.target.value;
    let selectedState: any = null;

    this._selectedState = selectedVal;

    if (selectedVal !== '0') {
      if (this.selectedReport.hasOwnProperty('election_state')) {
        selectedState = this.selectedReport.election_state.find(el => {
          return el.state === selectedVal;
        });

        if (selectedState.hasOwnProperty('dates')) {
          if (Array.isArray(selectedState.dates)) {
            this.electionDates = selectedState.dates;
          }
        }
      }
    }
  }

  public electionDateChange(e): void {
    let selectedIndex: number = e.target.selectedIndex;
    let selectedOption: any = e.target[e.target.selectedIndex];

    this._selectedElectionDate =  e.target.value;

    this._selectedElectionDates = {
      'fromDate': selectedOption.getAttribute('data-startdate'),
      'toDate': selectedOption.getAttribute('data-enddate')
    };
  }

  public fromDateChange(e): void {
    console.log('fromDateChange: ');
    console.log('value: ', e.target.getAttribute('value'));
  }

  public toDateChange(e): void {
    console.log('toDateChange: ');
    console.log('value: ', e.target.getAttribute('value'));
  }
}
