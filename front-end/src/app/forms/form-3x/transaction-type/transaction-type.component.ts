import {
  Component,
  EventEmitter,
  Input,
  OnInit,
  Output,
  ViewEncapsulation,
  SimpleChanges,
  ViewChild
} from '@angular/core';
import { FormBuilder, FormGroup, NgForm, Validators } from '@angular/forms';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { NgbPanelChangeEvent, NgbAccordion } from '@ng-bootstrap/ng-bootstrap';
import { NgbTooltipConfig } from '@ng-bootstrap/ng-bootstrap';
import { form3x_data } from '../../../shared/interfaces/FormsService/FormsService';
import { FormsService } from '../../../shared/services/FormsService/forms.service';
import { MessageService } from '../../../shared/services/MessageService/message.service';
import { TransactionTypeService } from './transaction-type.service';
import { ReportTypeService } from '../../../forms/form-3x/report-type/report-type.service';
import { F3xMessageService } from '../service/f3x-message.service';
import { ScheduleActions } from '../individual-receipt/schedule-actions.enum';
import {
  ConfirmModalComponent,
  ModalHeaderClassEnum
} from 'src/app/shared/partials/confirm-modal/confirm-modal.component';
import { DialogService } from 'src/app/shared/services/DialogService/dialog.service';

@Component({
  selector: 'f3x-transaction-type',
  templateUrl: './transaction-type.component.html',
  styleUrls: ['./transaction-type.component.scss'],
  providers: [NgbTooltipConfig],
  encapsulation: ViewEncapsulation.None
})
export class TransactionTypeComponent implements OnInit {
  @ViewChild('acc') accordion: NgbAccordion;
  @Output() status: EventEmitter<any> = new EventEmitter<any>();
  @Input() selectedOptions: any = {};
  @Input() transactionCategory: string = null;
  @Input() formOptionsVisible: boolean = false;
  @Input() transactionCategories: any = [];

  public editMode: boolean;
  public frmOption: FormGroup;
  public frmSubmitted: boolean = false;
  public showForm: boolean = false;
  public searchField: any = {};
  public secondaryOptions: any = [];
  public transactionType: string = null;
  public transactionTypeText: string = null;
  public transactionTypeFailed: boolean = false;
  public transactionCategorySelected: boolean = false;
  public tranasctionCategoryVal: string = '';
  public scheduleType: string = null;

  private _formType: string = '';
  private _mainTransactionCategory: any = [];
  private _transactionCategory: string = '';
  private _transactionCategories: any = [];

  constructor(
    private _fb: FormBuilder,
    private _router: Router,
    private _config: NgbTooltipConfig,
    private _activatedRoute: ActivatedRoute,
    private _formService: FormsService,
    private _messageService: MessageService,
    private _dialogService: DialogService,
    private _transactionTypeService: TransactionTypeService,
    private _reportTypeService: ReportTypeService,
    private _f3xMessageService: F3xMessageService
  ) {
    this._config.placement = 'right';
    this._config.triggers = 'click';
    // _activatedRoute.queryParams.subscribe(p => {
    //   const setTargetVal = { target: { value: null, placeholder: null } };
    //   this.frmOption = this._fb.group({
    //     secondaryOption: ['', Validators.required]
    //   });
    //   if (this._activatedRoute.snapshot.queryParams.transactionSubCategory) {
    //     setTargetVal.target.value = this._activatedRoute.snapshot.queryParams.transactionSubCategory;
    //     setTargetVal.target.placeholder = this._activatedRoute.snapshot.queryParams.transactionSubCategoryText;
    //     this._toggle(this._activatedRoute.snapshot.queryParams.transactionSubCategoryType);
    //     // this.updateTypeSelected(setTargetVal);
    //     // this.childOptionsListClick(setTargetVal.target.value);
    //     // this.doValidateOption();
    //   }
    // });

    _activatedRoute.queryParams.subscribe(p => {
      const setTargetVal = { value: null, placeholder: null, text: null };
      this.frmOption = this._fb.group({
        secondaryOption: ['', Validators.required]
      });
      if (this._activatedRoute.snapshot.queryParams.transactionSubCategory) {
        setTargetVal.value = this._activatedRoute.snapshot.queryParams.transactionSubCategory;
        setTargetVal.placeholder = this._activatedRoute.snapshot.queryParams.transactionSubCategoryText;
        setTargetVal.text = this._activatedRoute.snapshot.queryParams.transactionSubCategoryText;
        this._toggle(this._activatedRoute.snapshot.queryParams.transactionSubCategoryType);
        this.updateTypeSelected(setTargetVal);
        this.childOptionsListClick(setTargetVal.value);
        this.doValidateOption();
      }
      this._transactionCategory = p.transactionCategory ? p.transactionCategory : '';
    });
  }

  ngOnInit(): void {
    this._formType = this._activatedRoute.snapshot.paramMap.get('form_id');
    this.editMode = this._activatedRoute.snapshot.queryParams.edit === 'false' ? false : true;

    this.frmOption = this._fb.group({
      secondaryOption: ['', Validators.required]
    });
  }

  ngDoCheck(): void {
    if (this.transactionCategory) {
      this.transactionCategorySelected = false;
    }

    if (this.transactionType) {
      this.transactionTypeFailed = false;
    }

    if (this.transactionCategory && localStorage.getItem(`form_${this._formType}_temp_transaction_type`) === null) {
      this._setSecondaryTransactionCategories();
    } else if (
      this.transactionCategory &&
      localStorage.getItem(`form_${this._formType}_temp_transaction_type`) !== null
    ) {
      const transactionObj: any = JSON.parse(localStorage.getItem(`form_${this._formType}_temp_transaction_type`));

      if (transactionObj.mainTransactionTypeText !== this.transactionCategory) {
        this._setSecondaryTransactionCategories();
      }
    }
  }

  private _toggle(sec_option) {
    setTimeout(() => {
      if (this.accordion) {
        this.accordion.toggle(sec_option), 0;
      }
    });
  }

  /**
   * Validates the form on submit.
   */
  public doValidateOption() {
    this.frmSubmitted = true;

    if (this.frmOption.valid) {
      if (localStorage.getItem(`form_${this._formType}_temp_transaction_type`) !== null) {
        const transObj: any = JSON.parse(localStorage.getItem(`form_${this._formType}_temp_transaction_type`));

        window.localStorage.setItem(`form_${this._formType}_transaction_type`, JSON.stringify(transObj));

        window.localStorage.removeItem(`form_${this._formType}_temp_transaction_type`);
      }

      if (this.transactionType !== 'LOAN_FROM_IND_BANK' && this.transactionType !== 'LOAN_SUMMARY') {
        // Send message to form (indv-receipt) to clear form field vals if they are still populated.
        this._f3xMessageService.sendInitFormMessage('');
      }

      // if (this.transactionType === 'LOAN_FROM_IND_BANK' && this.scheduleType === 'sched_c'){
      //   console.log("Accessing sched_c loans...");
      //   let reportId = this._reportTypeService.getReportIdFromStorage(this._formType);
      //   this._router.navigate([`/forms/form/${this._formType}`], {
      //     queryParams: { step: 'loan', reportId: reportId, edit: this.editMode, transactionCategory: this._transactionCategory, transactionTypeIdentifier: 'LOANS_OWED_BY_CMTE'}
      //   });
      // }else if (this.transactionType === 'LOAN_SUMMARY' ){
      //   console.log("Accessing sched_c loans summary...");
      //   let reportId = this._reportTypeService.getReportIdFromStorage(this._formType);
      //   this._router.navigate([`/forms/form/${this._formType}`], {
      //     queryParams: { step: 'loansummary', reportId: reportId, edit: this.editMode, transactionCategory: this._transactionCategory,  transactionTypeIdentifier: 'LOANS_OWED_BY_CMTE'}
      //   });
      // }  else {
      //   this.status.emit({
      //     form: this.frmOption,
      //     direction: 'next',
      //     step: 'step_3',
      //     previousStep: 'step_2',
      //     action: ScheduleActions.add,
      //     transactionTypeText: this.transactionTypeText,
      //     transactionType: this.transactionType,
      //     transactionCategory: this._transactionCategory,
      //     scheduleType: this.scheduleType
      //   });
      // }

      this.status.emit({
        form: this.frmOption,
        direction: 'next',
        step: 'step_3',
        previousStep: 'step_2',
        action: ScheduleActions.add,
        transactionTypeText: this.transactionTypeText,
        transactionType: this.transactionType,
        transactionCategory: this._transactionCategory,
        scheduleType: this.scheduleType
      });

      return 1;
    } else {
      if (!this.tranasctionCategoryVal) {
        this.transactionCategorySelected = false;
      } else {
        this.transactionCategorySelected = true;
      }

      if (!this.transactionType && this.tranasctionCategoryVal) {
        this.transactionTypeFailed = true;
      } else {
        this.transactionTypeFailed = false;
      }

      window.scrollTo(0, 0);

      return 0;
    }
  }

  /**
   * Resets transaction type selected on panel close.
   *
   * @param      {Boolean}  opened  The opened
   */
  public pannelChange(opened: boolean): void {
    if (opened) {
      // panel is closed
      this.transactionType = '';
      this.transactionTypeText = '';
      this.frmOption.controls['secondaryOption'].setValue('');
      this.transactionCategorySelected = true;
      this.transactionTypeFailed = true;
    }
  }

  /**
   * Updates the type selected when radio button clicked.
   *
   * @param      {Object}  e            The event object.
   */
  // public updateTypeSelected(e, selectedOption: any): void {
  //   const val: string = e.target.value;
  //   this.transactionType = val;
  //   this.transactionTypeText = e.target.placeholder;
  //   this.frmOption.controls['secondaryOption'].setValue(val);
  //   this.transactionTypeFailed = false;
  //   this.scheduleType = selectedOption ? selectedOption.scheduleType : null;
  //   this.doValidateOption();
  // }

  public updateTypeSelected(selectedOption: any): void {
    const val: string = selectedOption.value;
    this.transactionType = val;
    this.transactionTypeText = selectedOption.text;
    this.frmOption.controls['secondaryOption'].setValue(val);
    this.transactionTypeFailed = false;
    this.scheduleType = selectedOption ? selectedOption.scheduleType : null;
    this.doValidateOption();
  }

  /**
   * Sets the secondary transaction categories.
   */
  private _setSecondaryTransactionCategories(): void {
    this._mainTransactionCategory = this.transactionCategories.filter(el => el.value === this.transactionCategory);
    const mainTransactionTypeText: string = this._mainTransactionCategory[0].text;
    const mainTransactionTypeValue: string = this._mainTransactionCategory[0].value;
    const transactionObj: any = {
      mainTransactionTypeText,
      mainTransactionTypeValue,
      transactionType: '',
      childTransactionType: ''
    };

    localStorage.setItem(`form_${this._formType}_temp_transaction_type`, JSON.stringify(transactionObj));

    this.secondaryOptions = this._mainTransactionCategory[0].options;
    if (this._mainTransactionCategory[0].options[0].value === 'schedule-h1') {
      this.secondaryOptions[0].options = [
        {
          info: "Funds received from the committee's non-federal bank account",
          infoIcon: 'TRUE',
          name: 'schedule-h1',
          scheduleType: 'sched_h1',
          text: 'Allocation Ratios',
          type: 'radio',
          // value: ""
          value: 'ALLOC_H1'
        }
        // {
        //   info: "Funds received from the committee's non-federal bank account",
        //   infoIcon: "TRUE",
        //   name: "schedule-h3",
        //   scheduleType: "sched_h2",
        //   text: "Allocation Ratios Summary",
        //   type: "radio",
        //   value: "ALLOC_H2_SUM"
        // }
      ];
    }
    if (this._mainTransactionCategory[0].options[1].value === 'schedule-h2') {
      this.secondaryOptions[1].options = [
        {
          info: "Funds received from the committee's non-federal bank account",
          infoIcon: 'TRUE',
          name: 'schedule-h3',
          scheduleType: 'sched_h2',
          text: 'Allocation Ratios',
          type: 'radio',
          value: 'ALLOC_H2_RATIO'
        },
        {
          info: "Funds received from the committee's non-federal bank account",
          infoIcon: 'TRUE',
          name: 'schedule-h3',
          scheduleType: 'sched_h2',
          text: 'Allocation Ratios Summary',
          type: 'radio',
          value: 'ALLOC_H2_SUM'
        }
      ];
    }

    //for h3
    if (this._mainTransactionCategory[0].options[2].value === 'schedule-h3') {
      this.secondaryOptions[2].options = [
        {
          info: 'Transfers from Nonfederal Accounts for Allocated Federal-Nonfederal Activity',
          infoIcon: 'TRUE',
          name: 'schedule-h3',
          scheduleType: 'sched_h3',
          text: 'Transfers from Nonfederal Accounts for Allocated Federal-Nonfederal Activity',
          type: 'radio',
          value: 'ALLOC_H3_RATIO'
        },
        {
          info: 'Transfers from Nonfederal Accounts for Allocated Federal-Nonfederal - Summary',
          infoIcon: 'TRUE',
          name: 'schedule-h3',
          scheduleType: 'sched_h3',
          text: 'Transfers from Nonfederal Accounts for Allocated Federal-Nonfederal - Summary',
          type: 'radio',
          value: 'ALLOC_H3_SUM'
        },
        {
          info: 'Transfers from Nonfederal Accounts for Allocated Federal-Nonfederal - Period Totals',
          infoIcon: 'TRUE',
          name: 'schedule-h3',
          scheduleType: 'sched_h3',
          text: 'Transfers from Nonfederal Accounts for Allocated Federal-Nonfederal - Period Totals',
          type: 'radio',
          value: 'ALLOC_H3_SUM_P'
        }
      ];
    }

    //for h4
    if (this._mainTransactionCategory[0].options[3].value === 'schedule-h4') {
      this.secondaryOptions[3].options = [
        {
          info: 'Disbursements Types',
          infoIcon: 'TRUE',
          name: 'schedule-h4',
          scheduleType: 'sched_h4',
          text: 'Disbursements Types',
          type: 'radio',
          value: 'ALLOC_H4_TYPES'
        },
        {
          info: 'Disbursements from Allocated Federal / Nonfederal Activity',
          infoIcon: 'TRUE',
          name: 'schedule-h4',
          scheduleType: 'sched_h4',
          text: 'Disbursements from Allocated Federal / Nonfederal Activity',
          type: 'radio',
          value: 'ALLOC_EXP_DEBT'
        },
        {
          info: 'Disbursements for Allocated Federal/Nonfederal Activity Summary',
          infoIcon: 'TRUE',
          name: 'schedule-h4',
          scheduleType: 'sched_h4',
          text: 'Disbursements for Allocated Federal/Nonfederal Activity Summary',
          type: 'radio',
          value: 'ALLOC_H4_SUM'
        }
      ];
    }

    if (this._mainTransactionCategory[0].options[4].value === 'schedule-h5') {
      this.secondaryOptions[4].options = [
        {
          info: 'Transfers of Levin Funds Received for Allocated Federal Election Activity',
          infoIcon: 'TRUE',
          name: 'schedule-h5',
          scheduleType: 'sched_h5',
          text: 'Transfers of Levin Funds Received for Allocated Federal Election Activity',
          type: 'radio',
          value: 'ALLOC_H5_RATIO'
        },
        {
          info: 'Transfers from Levin Funds for Allocated Federal Election Activity',
          infoIcon: 'TRUE',
          name: 'schedule-h5',
          scheduleType: 'sched_h5',
          text: 'Transfers from Levin Funds for Allocated Federal Election Activity',
          type: 'radio',
          value: 'ALLOC_H5_SUM'
        },
        {
          info: 'Total For Breakdown of Transfers Received - Levin Funds',
          infoIcon: 'TRUE',
          name: 'schedule-h5',
          scheduleType: 'sched_h5',
          text: 'Total For Breakdown of Transfers Received - Levin Funds',
          type: 'radio',
          value: 'ALLOC_H5_SUM_P'
        }
      ];
    }

    /*if (this._mainTransactionCategory[0].options[5].value === 'schedule-h6') {
        this.secondaryOptions[5].options = [
          {
            info: "Disbursements from Allocated Federal/Levin Activity",
            infoIcon: "TRUE",
            name: "schedule-h6",
            scheduleType: "sched_h6",
            text: "Disbursements from Allocated Federal/Levin Activity",
            type: "radio",
            value: "ALLOC_EXP_DEBT"
          },
          {
            info: "Disbursements for Allocated Federal/Levin Activity Summary",
            infoIcon: "TRUE",
            name: "schedule-h6",
            scheduleType: "sched_h6",
            text: "Disbursements for Allocated Federal/Levin Activity Summary",
            type: "radio",
            value: "ALLOC_H4_SUM"
          }];
      }*/

    this.transactionCategorySelected = true;

    this.transactionTypeFailed = false;

    if (this.transactionCategory) {
      this.tranasctionCategoryVal = this.transactionCategory;

      this.transactionCategory = '';
    }
  }

  /**
   * Goes to the previous step.
   */
  public previousStep(): void {
    this.status.emit({
      form: {},
      direction: 'previous',
      step: 'step_1'
    });
  }

  public printPreview(): void {
    this._reportTypeService.printPreview('transaction_category_screen', this._formType);
    this.status.emit({
      form: {},
      direction: '',
      step: 'step_2'
    });
  }

  /*
    This function is called while selecting a list from transaction screen
  */
  public childOptionsListClick(id): void {
    if (this.editMode) {
      console.log('transaction type selected: ', id);
      if (document.getElementById(id) != null) {
        const obj = <HTMLInputElement>document.getElementById('option_' + id);
        if (obj) {
          obj.click();
          obj.checked = true;
        }
      }
    } else {
      this._dialogService
        .confirm(
          'This report has been filed with the FEC. If you want to change, you must Amend the report',
          ConfirmModalComponent,
          'Warning',
          true,
          ModalHeaderClassEnum.warningHeader,
          null,
          'Return to Reports'
        )
        .then(res => {
          if (res === 'okay') {
            this.ngOnInit();
          } else if (res === 'cancel') {
            this._router.navigate(['/reports']);
          }
        });
    }
  }
}
