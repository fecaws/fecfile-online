import {
  Component,
  EventEmitter,
  ElementRef,
  Input,
  OnInit,
  Output,
  ViewEncapsulation,
  ViewChild,
  OnDestroy,
  HostListener,
  OnChanges,
  SimpleChanges
} from '@angular/core';
import { CurrencyPipe, DecimalPipe } from '@angular/common';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { FormBuilder, FormGroup, FormControl, NgForm, Validators, AbstractControl, ValidatorFn } from '@angular/forms';
import { NgbTooltipConfig, NgbTypeaheadSelectItemEvent, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { environment } from '../../../../environments/environment';
import { FormsService } from '../../../shared/services/FormsService/forms.service';
import { UtilService } from '../../../shared/utils/util.service';
import { MessageService } from '../../../shared/services/MessageService/message.service';
import { IndividualReceiptService } from './individual-receipt.service';
import { f3xTransactionTypes } from '../../../shared/interfaces/FormsService/FormsService';
import { alphaNumeric } from '../../../shared/utils/forms/validation/alpha-numeric.validator';
import { floatingPoint } from '../../../shared/utils/forms/validation/floating-point.validator';
import { validatePurposeInKindRequired, IN_KIND } from '../../../shared/utils/forms/validation/purpose.validator';
import { ReportTypeService } from '../report-type/report-type.service';
import { Observable, Subscription, interval, timer } from 'rxjs';
import { debounceTime, distinctUntilChanged, switchMap, delay, pairwise } from 'rxjs/operators';
import { TypeaheadService } from 'src/app/shared/partials/typeahead/typeahead.service';
import { DialogService } from 'src/app/shared/services/DialogService/dialog.service';
import {
  ConfirmModalComponent,
  ModalHeaderClassEnum
} from 'src/app/shared/partials/confirm-modal/confirm-modal.component';
import { TransactionModel } from '../../transactions/model/transaction.model';
import { F3xMessageService } from '../service/f3x-message.service';

import { hasOwnProp } from 'ngx-bootstrap/chronos/utils/type-checks';
import { TransactionsMessageService } from '../../transactions/service/transactions-message.service';
import { ActiveView } from '../../transactions/transactions.component';
import { validateAggregate } from 'src/app/shared/utils/forms/validation/aggregate.validator';
import { validateAmount } from 'src/app/shared/utils/forms/validation/amount.validator';
import { ContributionDateValidator } from 'src/app/shared/utils/forms/validation/contribution-date.validator';
import { ContactsService } from 'src/app/contacts/service/contacts.service';
import { trigger, transition, style, animate, state } from '@angular/animations';
import { heLocale } from 'ngx-bootstrap';
import { TransactionsService, GetTransactionsResponse } from '../../transactions/service/transactions.service';
import { ReportsService } from 'src/app/reports/service/report.service';
import { reportModel } from 'src/app/reports/model/report.model';
import { entityTypes, committeeEventTypes } from './entity-types-json';
import { ScheduleActions } from './schedule-actions.enum';
import { AbstractScheduleParentEnum } from './abstract-schedule-parent.enum';

export enum SaveActions {
  saveOnly = 'saveOnly',
  saveForReturnToParent = 'saveForReturnToParent',
  saveForReturnToNewParent = 'saveForReturnToNewParent',
  saveForAddSub = 'saveForAddSub',
  saveForEditSub = 'saveForEditSub',
  updateOnly = 'updateOnly'
}

export abstract class AbstractSchedule implements OnInit, OnDestroy, OnChanges {
  transactionTypeText = '';
  transactionType = '';
  scheduleAction: ScheduleActions = null;
  scheduleType = '';
  forceChangeSwitch = 0;
  status: EventEmitter<any> = new EventEmitter<any>();

  /**
   * Subscription for pre-populating the form for view or edit.
   */
  private _populateFormSubscription: Subscription;
  private _clearFormSubscription: Subscription;
  private _loadFormFieldsSubscription: Subscription;
  private _storeParentModelSubscription: Subscription;

  public editMode = true;
  public checkBoxVal = false;
  public cvgStartDate: string = null;
  public cvgEndDate: string = null;
  public frmIndividualReceipt: FormGroup;
  public formFields: any = [];
  public hiddenFields: any = [];
  public memoCode = false;
  public memoCodeChild = false;
  public testForm: FormGroup;
  public titles: any = [];
  public states: any = [];
  public levinAccounts: any = [];
  public electionTypes: any = [];
  public candidateOfficeTypes: any = [];
  public entityTypes: any = [];
  public activityEventTypes: any = [];
  public activityEventNames: any = null;
  public subTransactionInfo: any;
  public multipleSubTransactionInfo: any[] = [];
  public selectedEntityType: any;
  public subTransactions: any[];
  public subTransactionsTableType: string;
  public formType = '';
  public editScheduleAction: ScheduleActions = ScheduleActions.edit;
  public addScheduleAction: ScheduleActions = ScheduleActions.add;
  public addSubScheduleAction: ScheduleActions = ScheduleActions.addSubTransaction;
  public memoDropdownSize = null;
  public totalAmountReadOnly: boolean;

  protected abstractScheduleComponent: AbstractScheduleParentEnum;
  protected isInit = false;
  protected formFieldsPrePopulated = false;
  protected staticFormFields = null;
  protected _prePopulateFromSchedDData: any;
  protected _parentTransactionModel: TransactionModel;

  /**
   * Indicates the Form Group is loaded.  Used by "hybrid" parent classes of this base class
   * having both "static" and "dynamic" form fields as found in Sched F Debt Payment.
   */
  public loaded = false;

  private _reportType: any = null;
  private _cloned = false;
  private _types: any = [];
  private _transaction: any = {};
  private _transactionType: string = null;
  private _transactionTypePrevious: string = null;
  private _transactionCategory = '';
  private _formSubmitted = false;
  private _contributionAggregateValue = 0.0;
  private _contributionAggregateValueChild = 0.0;
  private _contributionAmount = '';
  private _contributionAmountChlid = '';
  private readonly _memoCodeValue: string = 'X';
  private _selectedEntity: any;
  private _selectedEntityChild: any;
  private _selectedCandidate: any;
  private _selectedCandidateChild: any;
  private _selectedChangeWarn: any;
  private _selectedChangeWarnChild: any;
  private _selectedCandidateChangeWarn: any;
  private _selectedCandidateChangeWarnChild: any;
  private _contributionAmountMax: number;
  private _transactionToEdit: TransactionModel;
  private readonly _childFieldNamePrefix = 'child*';
  private _readOnlyMemoCode: boolean;
  private _readOnlyMemoCodeChild: boolean;
  private _entityTypeDefault: any;
  private _employerOccupationRequired: boolean;
  private _prePopulateFieldArray: Array<any>;
  private _committeeDetails: any;
  private _cmteTypeCategory: string;
  private _completedCloning: boolean = false;

  constructor(
    private _http: HttpClient,
    protected _fb: FormBuilder,
    private _formService: FormsService,
    private _receiptService: IndividualReceiptService,
    private _contactsService: ContactsService,
    private _activatedRoute: ActivatedRoute,
    private _config: NgbTooltipConfig,
    private _router: Router,
    private _utilService: UtilService,
    private _messageService: MessageService,
    private _currencyPipe: CurrencyPipe,
    private _decimalPipe: DecimalPipe,
    private _reportTypeService: ReportTypeService,
    protected _typeaheadService: TypeaheadService,
    private _dialogService: DialogService,
    private _f3xMessageService: F3xMessageService,
    private _transactionsMessageService: TransactionsMessageService,
    private _contributionDateValidator: ContributionDateValidator,
    private _transactionsService: TransactionsService,
    private _reportsService: ReportsService
  ) {
    this._config.placement = 'right';
    this._config.triggers = 'click';

    this._populateFormSubscription = this._f3xMessageService.getPopulateFormMessage().subscribe(message => {
      if (message.hasOwnProperty('key')) {
        // See message sender for mesage properties
        switch (message.key) {
          case 'fullForm':
            // only load form for the AbstractSchudule parent in the view
            if (this.abstractScheduleComponent === message.abstractScheduleComponent) {
              this._prePopulateFormForEditOrView(message.transactionModel);
            }
            break;
          case 'field':
            // set the field array to class variable to be referenced once the formGroup
            // has been loaded by the get dynamic fields API call.
            if (message) {
              if (message.fieldArray) {
                this._prePopulateFieldArray = message.fieldArray;
              }
            }
            break;
          case 'prePopulateFromSchedD':
            // set class variable '_prePopulateFromSchedDData' to be referenced once the formGroup
            // has been loaded by the get dynamic fields API call.
            if (message) {
              if (message.prePopulateFromSchedD) {
                // only load form for the AbstractSchudule parent in the view
                if (this.abstractScheduleComponent === message.abstractScheduleComponent) {
                  // Patch fix for sched F payment - It does not have the subTransactionInfo
                  // when determining action so force it here.
                  this.scheduleAction = ScheduleActions.addSubTransaction;
                  this._prePopulateFromSchedDData = message.prePopulateFromSchedD;
                }
              }
            }
            break;
          default:
            console.log('message key not supported: ' + message.key);
        }
      }
    });

    this._storeParentModelSubscription = this._f3xMessageService.getParentModelMessage().subscribe(message => {
      this._parentTransactionModel = message;
    });

    this._clearFormSubscription = this._f3xMessageService.getInitFormMessage().subscribe(message => {
      this.clearFormValues();
    });

    this._loadFormFieldsSubscription = this._f3xMessageService.getLoadFormFieldsMessage().subscribe(message => {
      if (this.abstractScheduleComponent === message.abstractScheduleComponent) {
        this._getFormFields();
        this._validateTransactionDate();
      }
    });

    _activatedRoute.queryParams.subscribe(p => {
      this._transactionCategory = p.transactionCategory;
      this._cloned = p.cloned || p.cloned === 'true' ? true : false;
    });
  }

  public ngOnInit(): void {
    this._selectedEntity = null;
    this._selectedChangeWarn = null;
    this._selectedEntityChild = null;
    this._selectedChangeWarnChild = null;
    this._selectedCandidate = null;
    this._selectedCandidateChangeWarn = null;
    this._selectedCandidateChild = null;
    this._selectedCandidateChangeWarnChild = null;
    this._readOnlyMemoCode = false;
    this._readOnlyMemoCodeChild = false;
    this._transactionToEdit = null;
    this._contributionAggregateValue = 0.0;
    this._contributionAggregateValueChild = 0.0;
    this._contributionAmount = '';
    this._contributionAmountChlid = '';
    this._employerOccupationRequired = false;
    this.memoDropdownSize = null;
    this.totalAmountReadOnly = true;
    this._completedCloning = false;

    if (localStorage.getItem('committee_details') !== null) {
      this._committeeDetails = JSON.parse(localStorage.getItem('committee_details'));
      if (this._committeeDetails.cmte_type_category !== null) {
        this._cmteTypeCategory = this._committeeDetails.cmte_type_category;
      }
    }

    if (localStorage.getItem('committee_details') !== null) {
      this._committeeDetails = JSON.parse(localStorage.getItem('committee_details'));
      if (this._committeeDetails.cmte_type_category !== null) {
        this._cmteTypeCategory = this._committeeDetails.cmte_type_category;
      }
    }

    this._getCandidateOfficeTypes();

    this.formType = this._activatedRoute.snapshot.paramMap.get('form_id');
    this.editMode = this._activatedRoute.snapshot.queryParams.edit
      ? this._activatedRoute.snapshot.queryParams.edit
      : true;
    localStorage.setItem(`form_${this.formType}_saved`, JSON.stringify({ saved: true }));
    localStorage.setItem('Receipts_Entry_Screen', 'Yes');

    this._messageService.clearMessage();

    this._reportType = JSON.parse(localStorage.getItem(`form_${this.formType}_report_type`));

    if (this._reportType === null || typeof this._reportType === 'undefined') {
      this._reportType = JSON.parse(localStorage.getItem(`form_${this.formType}_report_type_backup`));
    }

    this.frmIndividualReceipt = this._fb.group({});
    // added check to avoid script error
    if (this.frmIndividualReceipt && this.frmIndividualReceipt.controls['contribution_date']) {
      this.frmIndividualReceipt.controls['contribution_date'].setValidators([
        this._contributionDateValidator.contributionDate(this.cvgStartDate, this.cvgEndDate),
        Validators.required
      ]);
    }

    this.isInit = true;
  }

  public ngOnChanges(changes: SimpleChanges) {
    if (this.editMode) {
      this._prepareForm();
      // added check to avoid script error
      if (this.frmIndividualReceipt && this.frmIndividualReceipt.controls['contribution_date']) {
        this.frmIndividualReceipt.controls['contribution_date'].setValidators([
          this._contributionDateValidator.contributionDate(this.cvgStartDate, this.cvgEndDate),
          Validators.required
        ]);
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

  public ngOnDestroy(): void {
    this._messageService.clearMessage();
    this._populateFormSubscription.unsubscribe();
    this._clearFormSubscription.unsubscribe();
    this._loadFormFieldsSubscription.unsubscribe();
    this._storeParentModelSubscription.unsubscribe();
    localStorage.removeItem('form_3X_saved');
  }

  private _prepareForm() {
    this._getTransactionType();

    this._validateTransactionDate();

    if (localStorage.getItem(`form_${this.formType}_report_type`) !== null) {
      this._reportType = JSON.parse(localStorage.getItem(`form_${this.formType}_report_type`));

      if (typeof this._reportType === 'object') {
        if (this._reportType.hasOwnProperty('cvgEndDate') && this._reportType.hasOwnProperty('cvgStartDate')) {
          if (typeof this._reportType.cvgStartDate === 'string' && typeof this._reportType.cvgEndDate === 'string') {
            this.cvgStartDate = this._reportType.cvgStartDate;
            this.cvgEndDate = this._reportType.cvgEndDate;
          }
        }
      }
    }

    if (this.frmIndividualReceipt) {
      if (Array.isArray(this.frmIndividualReceipt.controls)) {
        if (this.frmIndividualReceipt.controls['contribution_date']) {
          if (this.cvgStartDate === null && this.cvgEndDate === null && this._reportType === null) {
            if (localStorage.getItem(`form_${this.formType}_report_type`) !== null) {
              this._reportType = JSON.parse(localStorage.getItem(`form_${this.formType}_report_type`));
              if (this._reportType.hasOwnProperty('cvgEndDate') && this._reportType.hasOwnProperty('cvgStartDate')) {
                if (
                  typeof this._reportType.cvgStartDate === 'string' &&
                  typeof this._reportType.cvgEndDate === 'string'
                ) {
                  this.cvgStartDate = this._reportType.cvgStartDate;
                  this.cvgEndDate = this._reportType.cvgEndDate;

                  this.frmIndividualReceipt.controls['contribution_date'].setValidators([
                    this._contributionDateValidator.contributionDate(this.cvgStartDate, this.cvgEndDate),
                    Validators.required
                  ]);

                  this.frmIndividualReceipt.controls['contribution_date'].updateValueAndValidity();
                }
              }
            }
          }
        }
      }
    }


  }

  /**
   * Generates the dynamic form after all the form fields are retrived.
   *
   * @param      {Array}  fields  The fields
   */
  private _setForm(fields: any): void {
    const formGroup: any = [];
    let memoCodeValue = null;
    this._readOnlyMemoCode = false;
    this._readOnlyMemoCodeChild = false;
    this._employerOccupationRequired = false;

    fields.forEach(el => {
      if (el.hasOwnProperty('cols') && el.cols) {
        el.cols.forEach(e => {
          formGroup[e.name] = new FormControl(e.value || null, this._mapValidators(e.validation, e.name, e.value));
          if (
            this.isFieldName(e.name, 'contribution_amount') ||
            this.isFieldName(e.name, 'expenditure_amount') ||
            this.isFieldName(e.name, 'total_amount') ||
            this.isFieldName(e.name, 'incurred_amount')
          ) {
            if (e.validation) {
              this._contributionAmountMax = e.validation.max ? e.validation.max : 0;
            }
          }
          if (this.isFieldName(e.name, 'memo_code')) {
            const isChildForm = e.name.startsWith(this._childFieldNamePrefix) ? true : false;
            memoCodeValue = e.value;
            if (memoCodeValue === this._memoCodeValue) {
              if (isChildForm) {
                this.memoCodeChild = true;
              } else {
                this.memoCode = true;
              }
            }
            if (isChildForm) {
              this._readOnlyMemoCodeChild = e.isReadonly;
            } else {
              this._readOnlyMemoCode = e.isReadonly;
            }
          }
        });
      }
    });

    this.frmIndividualReceipt = new FormGroup(formGroup);
    if (this.abstractScheduleComponent === AbstractScheduleParentEnum.schedFComponent) {
      this.loaded = true;
    }

    // When coming from Reports where this component is not a child
    // as it is in F3X component, the form data must be set in this way
    // to avoid race condition
    if (this._transactionToEdit) {
      this._setFormDataValues(this._transactionToEdit.transactionId, this._transactionToEdit.apiCall);
    }

    // get form data API is passing X for memo code value.
    // Set it to value from dynamic forms as some should be checked and disabled by default.
    this._setMemoCodeForForm();

    if (this.frmIndividualReceipt.get('election_code')) {
      this.frmIndividualReceipt.patchValue({ election_code: null }, { onlySelf: true });
    }
    // selects are defaulting to value = "Select" - set to null.
    if (this.frmIndividualReceipt.contains('activity_event_type')) {
      this.frmIndividualReceipt.patchValue({ activity_event_type: null }, { onlySelf: true });
    }
    if (this.frmIndividualReceipt.contains('activity_event_identifier')) {
      this.frmIndividualReceipt.patchValue({ activity_event_identifier: null }, { onlySelf: true });
    }
    const childElectCodeName = this._childFieldNamePrefix + 'election_code';
    if (this.frmIndividualReceipt.contains(childElectCodeName)) {
      const vo = {};
      vo[childElectCodeName] = null;
      this.frmIndividualReceipt.patchValue(vo, { onlySelf: true });
    }
    if (this._employerOccupationRequired) {
      this._listenForAggregateChanges();
    }

    if (this.scheduleAction === ScheduleActions.add) {
      this.frmIndividualReceipt.patchValue(
        { beginning_balance: this._decimalPipe.transform(0, '.2-2') },
        { onlySelf: true }
      );
      this.frmIndividualReceipt.patchValue(
        { payment_amount: this._decimalPipe.transform(0, '.2-2') },
        { onlySelf: true }
      );
      this.frmIndividualReceipt.patchValue(
        { balance_at_close: this._decimalPipe.transform(0, '.2-2') },
        { onlySelf: true }
      );
    }

    // // Rather than set a flag as a check for setting up a change listener
    // // on the formGroup control field for purpose as done with the employerOccupation,
    // // iterate over the dynamic api form fields for the purpose.  The flag option
    // // can be fragile with forgetting to init the flag.  And with purpose, the value
    // // from the API is needed.
    // fields.forEach(el => {
    //   if (el.hasOwnProperty('cols') && el.cols) {
    //     el.cols.forEach((e:any) => {
    //     });
    //   }
    // });
  }

  /**
   * Check if the name of a field in the form matches the nameString for
   * child and non-child forms.
   *
   * @param fieldName name of the field from te dynamic form API
   * @param nameString string of the name field to check against the fieldName
   */
  public isFieldName(fieldName: string, nameString: string): boolean {
    return fieldName === nameString || fieldName === this._childFieldNamePrefix + nameString;
  }

  /**
   * Sets the form field valition requirements.
   *
   * @param      {Object} validators  The validators.
   * @param      {String} fieldName The name of the field.
   * @return     {Array}  The validations in an Array.
   */
  private _mapValidators(validators: any, fieldName: string, fieldValue: string): Array<any> {
    const formValidators = [];

    /**
     * For adding field specific validation that's custom.
     * This block adds zip code, and contribution date validation.
     * Required for occupation and employer will be dependent on aggregate.
     */

    if (this.isFieldName(fieldName, 'zip_code') ||
      this.isFieldName(fieldName, 'subordinate_cmte_zip')) {
      formValidators.push(alphaNumeric());
    } else if (this.isFieldName(fieldName, 'contribution_date') || this.isFieldName(fieldName, 'expenditure_date')) {
      this._reportType = JSON.parse(localStorage.getItem(`form_${this.formType}_report_type`));
      if (this._reportType !== null) {
        const cvgStartDate: string = this._reportType.cvgStartDate;
        const cvgEndDate: string = this._reportType.cvgEndDate;

        formValidators.push(this._contributionDateValidator.contributionDate(cvgStartDate, cvgEndDate));
      }
    }
    // else if (this.isFieldName(fieldName, 'purpose_description')) {
    //   // Purpose description is required when prefix with In-kind #
    //   if (fieldValue) {
    //     if (fieldValue.trim().length > 0) {
    //       formValidators.push(validatePurposeInKindRequired(fieldName, fieldValue));
    //     }
    //   }
    // }

    if (validators) {
      for (const validation of Object.keys(validators)) {
        if (validation === 'required') {
          if (validators[validation]) {
            // occuaption and employer will be required dpending on aggregate
            if (fieldName !== 'employer' && fieldName !== 'occupation') {
              if (fieldName === 'incurred_amount' && this.scheduleAction === ScheduleActions.edit) {
                // not required but not optinal when editing
              } else {
                formValidators.push(Validators.required);
              }
            } else {
              this._employerOccupationRequired = true;
            }
          }
        } else if (validation === 'min') {
          if (validators[validation] !== null) {
            formValidators.push(Validators.minLength(validators[validation]));
          }
        } else if (validation === 'max') {
          if (validators[validation] !== null) {
            if (
              fieldName !== 'contribution_amount' &&
              fieldName !== 'expenditure_amount' &&
              fieldName !== 'contribution_aggregate'
            ) {
              formValidators.push(Validators.maxLength(validators[validation]));
            } else {
              formValidators.push(validateAmount());
            }
          }
        } else if (validation === 'dollarAmount' || validation === 'dollarAmountNegative') {
          if (validators[validation] !== null) {
            formValidators.push(floatingPoint());
          }
        }
      }
    }
    return formValidators;
  }

  /**
   * Validates the transaction date selected.
   */
  private _validateTransactionDate(): void {
    let dateField: string;
    let amountField: string;
    // checking for expenditure_date in form parameter
    // If expenditure_date is not found setting contribution_date and contribution_amount
    if (this.frmIndividualReceipt) {
      if (this.frmIndividualReceipt.controls['expenditure_date']) {
        dateField = 'expenditure_date';
        amountField = 'expenditure_amount';
      } else {
        dateField = 'contribution_date';
        amountField = 'contribution_amount';
      }
    }

    this._reportType = JSON.parse(localStorage.getItem(`form_${this.formType}_report_type`));

    if (this._reportType !== null) {
      const cvgStartDate: string = this._reportType.cvgStartDate;
      const cvgEndDate: string = this._reportType.cvgEndDate;

      if (this.memoCode) {
        this.frmIndividualReceipt.controls[dateField].setValidators([Validators.required]);

        this.frmIndividualReceipt.controls[dateField].updateValueAndValidity();
      } else {
        if (this.frmIndividualReceipt.controls[dateField]) {
          this.frmIndividualReceipt.controls[dateField].setValidators([
            this._contributionDateValidator.contributionDate(cvgStartDate, cvgEndDate),
            Validators.required
          ]);

          this.frmIndividualReceipt.controls[dateField].updateValueAndValidity();
        }
      }
      if (this.memoCodeChild) {
        this.frmIndividualReceipt.controls['child*' + dateField].setValidators([Validators.required]);

        this.frmIndividualReceipt.controls['child*' + dateField].updateValueAndValidity();
      } else {
        if (this.frmIndividualReceipt.controls['child*' + dateField]) {
          this.frmIndividualReceipt.controls['child*' + dateField].setValidators([
            this._contributionDateValidator.contributionDate(cvgStartDate, cvgEndDate),
            Validators.required
          ]);

          this.frmIndividualReceipt.controls['child*' + dateField].updateValueAndValidity();
        }
      }
    }

    if (this.frmIndividualReceipt) {
      if (this.frmIndividualReceipt.controls[amountField]) {
        this.frmIndividualReceipt.controls[amountField].setValidators([floatingPoint(), Validators.required]);

        this.frmIndividualReceipt.controls[amountField].updateValueAndValidity();
      }

      if (this.frmIndividualReceipt.controls['contribution_aggregate']) {
        this.frmIndividualReceipt.controls['contribution_aggregate'].setValidators([floatingPoint()]);

        this.frmIndividualReceipt.controls['contribution_aggregate'].updateValueAndValidity();
      }

      // Do same as above for child amount
      if (this.frmIndividualReceipt.controls['child*' + amountField]) {
        this.frmIndividualReceipt.controls['child*' + amountField].setValidators([
          floatingPoint(),
          Validators.required
        ]);

        this.frmIndividualReceipt.controls['child*' + amountField].updateValueAndValidity();
      }

      if (this.frmIndividualReceipt.controls['child*contribution_aggregate']) {
        this.frmIndividualReceipt.controls['child*contribution_aggregate'].setValidators([floatingPoint()]);

        this.frmIndividualReceipt.controls['child*contribution_aggregate'].updateValueAndValidity();
      }
    }
  }

  /**
   * Apply the validation rules when aggregate changes.
   */
  private _listenForAggregateChanges(): void {
    this.frmIndividualReceipt.get('contribution_aggregate').valueChanges.subscribe(val => {
      // All validators are replaced here.  Currently the only validator functions
      // for employer and occupation is the validateAggregate().  The max length is enforced
      // in the template as an element attribute max.
      // If additoanl validators need to be added here, there is no replace function in ng,
      // they must be cleared and all set in an array again. Onc solution is to
      // store the validators in a class variable array, add this function to the array, and set the
      // controls's setValidator() using the full array.  Or just get the validations from the
      // dynamic form fields again in this.formFields[].

      const employerControl = this.frmIndividualReceipt.get('employer');
      employerControl.setValidators([validateAggregate(val, true, 'employer')]);
      employerControl.updateValueAndValidity();

      const occupationControl = this.frmIndividualReceipt.get('occupation');
      occupationControl.setValidators([validateAggregate(val, true, 'occupation')]);
      occupationControl.updateValueAndValidity();
    });
  }

  /**
   * Updates vaprivate _memoCode variable.
   *
   * @param      {Object}  e      The event object.
   */
  public memoCodeChange(e, fieldName: string): void {
    const { checked } = e.target;
    const isChildForm = fieldName.startsWith(this._childFieldNamePrefix) ? true : false;
    let dateField: string;
    let amountField: string;
    // checking for expenditure_date in form parameter
    // If expenditure_date is not found setting contribution_date and contribution_amount
    if (this.frmIndividualReceipt.controls['expenditure_date']) {
      dateField = 'expenditure_date';
      amountField = 'expenditure_amount';
    } else {
      dateField = 'contribution_date';
      amountField = 'contribution_amount';
    }
    if (isChildForm) {
      if (checked) {
        this.memoCodeChild = checked;
        this.frmIndividualReceipt.controls['child*memo_code'].setValue(this._memoCodeValue);
        this.frmIndividualReceipt.controls['child*' + dateField].setValidators([Validators.required]);

        this.frmIndividualReceipt.controls['child*' + dateField].updateValueAndValidity();
      } else {
        this._validateTransactionDate();
        this.memoCodeChild = checked;
        this.frmIndividualReceipt.controls['child*memo_code'].setValue(null);
        this.frmIndividualReceipt.controls['child*' + dateField].setValidators([
          this._contributionDateValidator.contributionDate(this.cvgStartDate, this.cvgEndDate),
          Validators.required
        ]);

        this.frmIndividualReceipt.controls[dateField].updateValueAndValidity();
      }
    } else {
      if (checked) {
        this.memoCode = checked;
        this.frmIndividualReceipt.controls['memo_code'].setValue(this._memoCodeValue);
        this.frmIndividualReceipt.controls[dateField].setValidators([Validators.required]);

        this.frmIndividualReceipt.controls[dateField].updateValueAndValidity();
      } else {
        this._validateTransactionDate();
        this.memoCode = checked;
        this.frmIndividualReceipt.controls['memo_code'].setValue(null);
        this.frmIndividualReceipt.controls[dateField].setValidators([
          this._contributionDateValidator.contributionDate(this.cvgStartDate, this.cvgEndDate),
          Validators.required
        ]);

        this.frmIndividualReceipt.controls[dateField].updateValueAndValidity();
      }
    }

    const contributionAmountNum = this._convertFormattedAmountToDecimal(null);
    let transactionDate = null;
    if (this.frmIndividualReceipt.get(dateField)) {
      transactionDate = this.frmIndividualReceipt.get(dateField).value;
    }
    const aggregateValue: string = this._receiptService.determineAggregate(
      this._contributionAggregateValue,
      contributionAmountNum,
      this.scheduleAction,
      this.memoCode,
      this._selectedEntity,
      this._transactionToEdit,
      this.transactionType,
      this._isSubOfParent(),
      transactionDate
    );
    this.frmIndividualReceipt.patchValue({ contribution_aggregate: aggregateValue }, { onlySelf: true });
  }

  public handleOnBlurEvent($event: any, col: any) {
    if (this.isFieldName(col.name, 'contribution_amount') || this.isFieldName(col.name, 'expenditure_amount')) {
      this.contributionAmountChange($event, col.name, col.validation.dollarAmountNegative);
    } else if (this.isFieldName(col.name, 'total_amount') || this.isFieldName(col.name, 'incurred_amount')) {
      if (this.isFieldName(col.name, 'total_amount') && this.totalAmountReadOnly) {
        return;
      }
      this._formatAmount($event, col.name, col.validation.dollarAmountNegative);
      if (col.name === 'total_amount') {
        this._getFedNonFedPercentage();
      }
      if (col.name === 'incurred_amount') {
        this._adjustDebtBalanceAtClose();
      }
    } else {
      this.populatePurpose(col.name);
    }
  }

  private _adjustDebtBalanceAtClose() {
    if (this.transactionType !== 'DEBT_TO_VENDOR' &&
        this.transactionType !== 'DEBT_BY_VENDOR') {
      return;
    }
    if (
      !this.frmIndividualReceipt.contains('beginning_balance') ||
      !this.frmIndividualReceipt.contains('incurred_amount') ||
      !this.frmIndividualReceipt.contains('payment_amount') ||
      !this.frmIndividualReceipt.contains('balance_at_close')
    ) {
      return;
    }

    let beginningBalance = this.frmIndividualReceipt.get('beginning_balance').value;
    if (beginningBalance) {
      if (typeof beginningBalance === 'string') {
        beginningBalance = beginningBalance.replace(/,/g, ``);
      }
    } else {
      beginningBalance = 0;
    }

    let incurredAmount = this.frmIndividualReceipt.get('incurred_amount').value;
    if (incurredAmount) {
      if (typeof incurredAmount === 'string') {
        incurredAmount = incurredAmount.replace(/,/g, ``);
      }
    } else {
      incurredAmount = 0;
    }

    let paymentAmount = this.frmIndividualReceipt.get('payment_amount').value;
    if (paymentAmount) {
      if (typeof paymentAmount === 'string') {
        paymentAmount = paymentAmount.replace(/,/g, ``);
      }
    } else {
      paymentAmount = 0;
    }

    beginningBalance = parseFloat(beginningBalance);
    incurredAmount = parseFloat(incurredAmount);
    paymentAmount = parseFloat(paymentAmount);
    const balanceAtClose = beginningBalance + incurredAmount - paymentAmount;

    this._formatAmount({ target: { value: balanceAtClose.toString() } }, 'balance_at_close', false);
  }

  /**
   * H4 and H6 will populate readonly fields using the user provided payment and activity.
   * Call the API to calculate the fed, non-fed and activity YTD values.
   */
  private _getFedNonFedPercentage() {

    if (this.transactionType !== 'ALLOC_FEA_DISB_DEBT' &&
      this.transactionType !== 'ALLOC_EXP_DEBT'
      &&
      this.transactionType !== 'ALLOC_EXP' &&
      this.transactionType !== 'ALLOC_EXP_CC_PAY' &&
      this.transactionType !== 'ALLOC_EXP_CC_PAY_MEMO' &&
      this.transactionType !== 'ALLOC_EXP_STAF_REIM' &&
      this.transactionType !== 'ALLOC_EXP_STAF_REIM_MEMO' &&
      this.transactionType !== 'ALLOC_EXP_PMT_TO_PROL' &&
      this.transactionType !== 'ALLOC_EXP_PMT_TO_PROL_MEMO' &&
      this.transactionType !== 'ALLOC_EXP_VOID'
      &&
      this.transactionType !== 'ALLOC_FEA_DISB' &&
      this.transactionType !== 'ALLOC_FEA_CC_PAY' &&
      this.transactionType !== 'ALLOC_FEA_CC_PAY_MEMO' &&
      this.transactionType !== 'ALLOC_FEA_STAF_REIM' &&
      this.transactionType !== 'ALLOC_FEA_STAF_REIM_MEMO' &&
      this.transactionType !== 'ALLOC_FEA_VOID'
    ) {
      return;
    }

    // reset all pre-populated values
    this.frmIndividualReceipt.patchValue({ fed_share_amount: null }, { onlySelf: true });
    this.frmIndividualReceipt.patchValue({ non_fed_share_amount: null }, { onlySelf: true });
    this.frmIndividualReceipt.patchValue({ activity_event_amount_ytd: null }, { onlySelf: true });

    if (!this.frmIndividualReceipt.contains('total_amount')) {
      return;
    }

    let totalAmount = this.frmIndividualReceipt.get('total_amount').value;
    if (!totalAmount) {
      return;
    }
    if (typeof totalAmount === 'string') {
      totalAmount = totalAmount.replace(/,/g, ``);
    }

    let activityEvent = null;
    if (this.frmIndividualReceipt.contains('activity_event_type')) {
      activityEvent = this.frmIndividualReceipt.get('activity_event_type').value;
    }

    let activityEventName = null;
    if (this.frmIndividualReceipt.contains('activity_event_identifier')) {
      activityEventName = this.frmIndividualReceipt.get('activity_event_identifier').value;
    }

    if (!activityEvent) {
      return;
    }

    this._receiptService.getFedNonFedPercentage(totalAmount, activityEvent, activityEventName, this.transactionType).subscribe(
      res => {
        if (res) {
          if (res.fed_share) {
            this._formatAmount({ target: { value: res.fed_share.toString() } }, 'fed_share_amount', false);
            this._formatAmount({ target: { value: res.fed_share.toString() } }, 'federal_share', false);
          }
          if (res.nonfed_share) {
            this._formatAmount({ target: { value: res.nonfed_share.toString() } }, 'non_fed_share_amount', false);
            this._formatAmount({ target: { value: res.nonfed_share.toString() } }, 'levin_share', false);
          }
          if (res.aggregate_amount) {
            this._formatAmount(
              { target: { value: res.aggregate_amount.toString() } },
              'activity_event_amount_ytd',
              false
            );
          }
        }
      },
      errorRes => { }
    );
  }

  /**
   * Present user with H1/H2 required before making Debt payment.
   */
  private _handleNoH1H2(activityEventScheduleType: string) {
    // Default to H1 if not provided
    if (!activityEventScheduleType) {
      activityEventScheduleType = 'sched_h1';
    }

    // Hard Coding DF/DC  => H2 for now.  Once dynamic forms provides schedule in activityEventTypes
    // const activityEventType = this.frmIndividualReceipt.get('activity_event_type').value;
    // const scheduleName = (activityEventType === 'DF' || activityEventType === 'DC') ? 'H2' : 'H1';
    // const scheduleType = (activityEventType === 'DF' || activityEventType === 'DC') ? 'sched_h2' : 'sched_h1';

    const scheduleName = activityEventScheduleType === 'sched_h1' ? 'H1' : 'H2';
    const scheduleType = activityEventScheduleType;

    const message =
      `Please add Schedule ${scheduleName} before proceeding with adding the ` +
      `amount.  Schedule ${scheduleName} is required to correctly allocate the federal and non-federal portions of the transaction.`;
    this._dialogService.confirm(message, ConfirmModalComponent, 'Warning!', false).then(res => {
      const emitObj: any = {
        form: this.frmIndividualReceipt,
        direction: 'next',
        step: 'step_3',
        previousStep: 'step_2',
        scheduleType: scheduleType,
        action: ScheduleActions.add
      };
      if (scheduleType === 'sched_h2') {
        emitObj.transactionType = 'ALLOC_H2_RATIO';
        emitObj.transactionTypeText = 'Allocation Ratios';
      }
      this.status.emit(emitObj);
    });
  }

  private _formatAmount(e: any, fieldName: string, negativeAmount: boolean) {
    let contributionAmount: string = e.target.value;

    // default to 0 when no value
    contributionAmount = contributionAmount ? contributionAmount : '0';

    // remove commas
    contributionAmount = contributionAmount.replace(/,/g, ``);

    // determine if negative, truncate if > max
    contributionAmount = this._transformAmount(contributionAmount, this._contributionAmountMax);

    let contributionAmountNum = parseFloat(contributionAmount);
    // Amount is converted to negative for Return / Void / Bounced
    if (negativeAmount) {
      contributionAmountNum = -Math.abs(contributionAmountNum);
      this._contributionAmount = String(contributionAmountNum);
    }

    const amountValue: string = this._decimalPipe.transform(contributionAmountNum, '.2-2');
    const patch = {};
    patch[fieldName] = amountValue;
    if (this.frmIndividualReceipt) {
      this.frmIndividualReceipt.patchValue(patch, { onlySelf: true });
    }
  }

  /**
   * Handle a change to the Activity Event select.
   */
  public handleActivityEventTypeChange($event: any, col: any) {
    // reset activity_event_identifier whenever the type changes
    this.frmIndividualReceipt.patchValue({ activity_event_identifier: null }, { onlySelf: true });
    this.activityEventNames = null;

    if (!$event) {
      this._resetFedNonFed();
      this.totalAmountReadOnly = true;
      return;
    }

    if ($event.hasOwnProperty('hasValue')) {
      if ($event.hasValue === false) {
        if ($event.hasOwnProperty('scheduleType')) {
          this._handleNoH1H2($event.scheduleType);
        } else {
          this._handleNoH1H2(null);
        }
      }
    }

    if ($event.activityEventTypes) {
      this.activityEventNames = $event.activityEventTypes;
      // make required
      // NOTE: Any new validations from the dynamic forms API will need to
      // be added back as this rebuilds the validators for the FormControl.
      // Currently the only relevent one is "required" true/fase.
      if (this.frmIndividualReceipt.contains('activity_event_identifier')) {
        const activityControl = this.frmIndividualReceipt.get('activity_event_identifier');
        activityControl.setValidators([Validators.required]);
        activityControl.updateValueAndValidity();
      }
    } else {
      // remove required
      if (this.frmIndividualReceipt.contains('activity_event_identifier')) {
        const activityControl = this.frmIndividualReceipt.get('activity_event_identifier');
        activityControl.setValidators([Validators.nullValidator]);
        activityControl.updateValueAndValidity();
      }
    }

    let eventTypeVal = null;
    if (this.frmIndividualReceipt.contains('activity_event_type')) {
      eventTypeVal = this.frmIndividualReceipt.get('activity_event_type').value;
    }

    // Don't allow a total amount to be entered if the required activity event and activity name
    // are not set.  For event types requiring the 2nd dropdown, activityEventNames will have data.
    if (!eventTypeVal) {
      this._resetFedNonFed();
      this.totalAmountReadOnly = true;
    } else {
      if (this.activityEventNames) {
        let activityEventIdentifier = null;
        if (this.frmIndividualReceipt.contains('activity_event_identifier')) {
          activityEventIdentifier = this.frmIndividualReceipt.get('activity_event_identifier').value;
        }
        if (activityEventIdentifier) {
          this._getFedNonFedPercentage();
          this.totalAmountReadOnly = false;
        } else {
          this._resetFedNonFed();
          this.totalAmountReadOnly = true;
        }
      } else {
        this._getFedNonFedPercentage();
        this.totalAmountReadOnly = false;
      }
    }
  }

  public handleActivityEventNameChange($event: any, col: any) {
    if (!$event) {
      this._resetFedNonFed();
      this.totalAmountReadOnly = true;
    } else {
      this._getFedNonFedPercentage();
      this.totalAmountReadOnly = false;
    }
  }

  private _resetFedNonFed() {
    this.frmIndividualReceipt.patchValue({ fed_share_amount: null }, { onlySelf: true });
    this.frmIndividualReceipt.patchValue({ non_fed_share_amount: null }, { onlySelf: true });
    this.frmIndividualReceipt.patchValue({ activity_event_amount_ytd: null }, { onlySelf: true });
  }

  /**
   * Determine if fields is read only.  If it should
   * be read only return true else null.  Null will
   * remove HTML attribute readonly whereas setting it to
   * false will not remove readonly from DOM and fields remains in readonly.
   */
  public isFieldReadOnly(col: any) {
    if (col.type === 'text' && col.isReadonly) {
      return true;
    }
    if (col.name === 'total_amount') {
      return this._isTotalAmountReadOnly(col);
    }
    return null;
  }

  public isSelectFieldReadOnly(col: any) {
    if (col.type === 'select' && col.isReadonly) {
      if (this.frmIndividualReceipt.get(col.name)) {
        this.frmIndividualReceipt.get(col.name).disable();
      }
      return true;
    }
    return null;
  }

  /**
   * Return true if readonly else null to remove readonly attribute from DOM.
   */
  private _isTotalAmountReadOnly(col: any): boolean {
    if (col.name !== 'total_amount') {
      return null;
    }
    // Must be H4 or H6
    if (this.transactionType !== 'ALLOC_FEA_DISB_DEBT' && this.transactionType !== 'ALLOC_EXP_DEBT') {
      return null;
    }
    return this.totalAmountReadOnly ? true : null;
  }

  /**
   * Updates the contribution aggregate field once contribution ammount is entered.
   *
   * @param      {Object}  e         The event object.
   * @param      {string}  fieldName The name of the field
   */
  public contributionAmountChange(e: any, fieldName: string, negativeAmount: boolean): void {
    const isChildForm = fieldName.startsWith(this._childFieldNamePrefix) ? true : false;
    let contributionAmount: string = e.target.value;

    // default to 0 when no value
    contributionAmount = contributionAmount ? contributionAmount : '0';

    // remove commas
    contributionAmount = contributionAmount.replace(/,/g, ``);

    // determine if negative, truncate if > max
    contributionAmount = this._transformAmount(contributionAmount, this._contributionAmountMax);

    let contributionAggregate: string = null;
    if (isChildForm) {
      this._contributionAmountChlid = contributionAmount;
      contributionAggregate = String(this._contributionAggregateValueChild);
    } else {
      this._contributionAmount = contributionAmount;
      contributionAggregate = String(this._contributionAggregateValue);
    }

    let contributionAmountNum = parseFloat(contributionAmount);
    // Amount is converted to negative for Return / Void / Bounced
    if (negativeAmount) {
      contributionAmountNum = -Math.abs(contributionAmountNum);
      this._contributionAmount = String(contributionAmountNum);
    }

    const amountValue: string = this._decimalPipe.transform(contributionAmountNum, '.2-2');

    if (isChildForm) {
      if (this.frmIndividualReceipt.get('expenditure_amount')) {
        this.frmIndividualReceipt.patchValue({ 'child*expenditure_amount': amountValue }, { onlySelf: true });
      } else {
        this.frmIndividualReceipt.patchValue({ 'child*contribution_amount': amountValue }, { onlySelf: true });
      }
    } else {
      if (this.frmIndividualReceipt.get('expenditure_amount')) {
        this.frmIndividualReceipt.patchValue({ expenditure_amount: amountValue }, { onlySelf: true });
      } else {
        this.frmIndividualReceipt.patchValue({ contribution_amount: amountValue }, { onlySelf: true });
      }
    }
    let transactionDate = null;
    if (this.frmIndividualReceipt.get('contribution_date')) {
      transactionDate = this.frmIndividualReceipt.get('contribution_date').value;
    }
    const aggregateValue: string = this._receiptService.determineAggregate(
      this._contributionAggregateValue,
      contributionAmountNum,
      this.scheduleAction,
      this.memoCode,
      this._selectedEntity,
      this._transactionToEdit,
      this.transactionType,
      this._isSubOfParent(),
      transactionDate
    );

    if (isChildForm) {
      this.frmIndividualReceipt.patchValue({ 'child*contribution_aggregate': aggregateValue }, { onlySelf: true });
    } else {
      if (this.abstractScheduleComponent === AbstractScheduleParentEnum.schedFComponent) {
        this.frmIndividualReceipt.patchValue({ aggregate_general_elec_exp: aggregateValue }, { onlySelf: true });
      } else {
        this.frmIndividualReceipt.patchValue({ contribution_aggregate: aggregateValue }, { onlySelf: true });
      }
    }
  }

  /**
   * Prevent user from keying in more than the max allowed by the API.
   * HTML max must allow for commas, decimals and negative sign and therefore
   * this is needed to enforce digit limitation.  This method will remove
   * non-numerics permitted by the floatingPoint() validator,
   * commas, decimals and negative sign, before checking the number of digits.
   *
   * Note: If this method is not desired, it may be replaced with a validation
   * on submit.  It is here to catch user error before submitting the form.
   */
  public contributionAmountKeyup(e: any) {
    let val = this._utilService.deepClone(e.target.value);
    val = val.replace(/,/g, ``);
    val = val.replace(/\./g, ``);
    val = val.replace(/-/g, ``);

    if (val) {
      if (val.length > this._contributionAmountMax) {
        e.target.value = e.target.value.substring(0, e.target.value.length - 1);
      }
    }
  }

  /**
   * Allow for negative sign and don't allow more than the max
   * number of digits.
   */
  private _transformAmount(amount: string, max: number): string {
    if (!amount) {
      return amount;
    } else if (amount.length > 0 && amount.length <= max) {
      return amount;
    } else {
      // Need to handle negative sign, decimal and max digits
      if (amount.substring(0, 1) === '-') {
        if (amount.length === max || amount.length === max + 1) {
          return amount;
        } else {
          return amount.substring(0, max + 2);
        }
      } else {
        const result = amount.substring(0, max + 1);
        return result;
      }
    }
  }

  /**
   * Gets the transaction type.
   */
  private _getTransactionType(): void {
    const transactionType: any = JSON.parse(localStorage.getItem(`form_${this.formType}_transaction_type`));

    if (typeof transactionType === 'object') {
      if (transactionType !== null) {
        if (transactionType.hasOwnProperty('mainTransactionTypeValue')) {
          this._transactionType = transactionType.mainTransactionTypeValue;
        }
      }
    }

    if (this.transactionType) {
      // Not sure if this is needed for preventing excessive calls.
      // Removed for now to get working for sched_h.
      // if (this.transactionType !== this._transactionTypePrevious) {
      this._transactionTypePrevious = this.transactionType;
      // reload dynamic form fields
      this._getFormFields();
      // }
    }
  }

  public handleFormFieldKeyup($event: any, col: any) {
    if (!col) {
      return;
    }
    if (!col.name) {
      return;
    }
    if ($event.key) {
      if (this._isIgnoreKey($event.key)) {
        return;
      }
    }
    if (
      col.name === 'last_name' ||
      col.name === 'first_name' ||
      col.name === 'middle_name' ||
      col.name === 'prefix' ||
      col.name === 'suffix' ||
      col.name === 'street_1' ||
      col.name === 'street_2' ||
      col.name === 'city' ||
      col.name === 'state' ||
      col.name === 'zip_code' ||
      col.name === 'employer' ||
      col.name === 'occupation'
    ) {
      if (this._selectedEntity) {
        this.showWarn(col.text, col.name);
      }
    } else if (
      col.name === this._childFieldNamePrefix + 'entity_name' ||
      col.name === this._childFieldNamePrefix + 'donor_cmte_id' ||
      col.name === this._childFieldNamePrefix + 'beneficiary_cmte_id' ||
      col.name === this._childFieldNamePrefix + 'street_1' ||
      col.name === this._childFieldNamePrefix + 'street_2' ||
      col.name === this._childFieldNamePrefix + 'city' ||
      col.name === this._childFieldNamePrefix + 'state' ||
      col.name === this._childFieldNamePrefix + 'zip_code' ||
      col.name === this._childFieldNamePrefix + 'employer' ||
      col.name === this._childFieldNamePrefix + 'occupation'
    ) {
      if (this._selectedEntityChild) {
        this.showWarn(col.text, col.name);
      }
    } else if (this._isCandidateField(col)) {
      this.handleFormFieldKeyupCandidate($event, col);
    } else if (this.isFieldName(col.name, 'contribution_amount')) {
      this.contributionAmountKeyup($event);
    } else {
      return null;
    }
  }

  private _isIgnoreKey(key: string) {
    if (!key) {
      return true;
    }
    if (typeof key !== 'string') {
      return true;
    }
    const keyUpper = key.toUpperCase();
    if (
      // TODO add more keys, home, insert, end, print, pause, etc
      keyUpper === 'F12' ||
      keyUpper === 'TAB' ||
      keyUpper === 'ENTER' ||
      keyUpper === 'SHIFT' ||
      keyUpper === 'ALT' ||
      keyUpper === 'CONTROL' ||
      keyUpper === 'ARROWRIGHT' ||
      keyUpper === 'CAPSLOCK' ||
      keyUpper === 'PAGEUP' ||
      keyUpper === 'PAGEDOWN' ||
      keyUpper === 'ESCAPE' ||
      keyUpper === 'ARROWUP' ||
      keyUpper === 'ARROWLEFT' ||
      keyUpper === 'ARROWDOWN'
    ) {
      return true;
    } else {
      return false;
    }
  }

  public handleFormFieldKeyupCandidate($event: any, col: any) {
    if (!col) {
      return;
    }
    if (!col.name) {
      return;
    }
    if ($event.key) {
      if (this._isIgnoreKey($event.key)) {
        return;
      }
    }
    const isChildField = col.name.startsWith(this._childFieldNamePrefix) ? true : false;
    if (this._isCandidateField(col)) {
      if (isChildField) {
        if (this._selectedCandidateChild) {
          this.showWarnCandidate(col.text, col.name);
        }
      } else {
        if (this._selectedCandidate) {
          this.showWarnCandidate(col.text, col.name);
        }
      }
    } else {
      return null;
    }
  }

  /**
   * Show a warning indicating fields may not be changed for entities loaded from the database.
   *
   * @param fieldLabel Field Label to show in the message
   */
  private showWarn(fieldLabel: string, name: string) {
    const isChildForm = name.startsWith(this._childFieldNamePrefix) ? true : false;

    // only show on first key
    if (isChildForm) {
      if (this._selectedChangeWarnChild[name] === name) {
        return;
      }
    } else {
      if (this._selectedChangeWarn[name] === name) {
        return;
      }
    }

    const message = `Please note that if you update contact information it will be updated in the Contacts file.`;
    this._dialogService.confirm(message, ConfirmModalComponent, 'Warning!', false).then(res => { });

    if (isChildForm) {
      this._selectedChangeWarnChild[name] = name;
    } else {
      this._selectedChangeWarn[name] = name;
    }
  }

  /**
   * Show a warning indicating fields may not be changed for entities loaded from the database
   * for Candidate.
   *
   * @param fieldLabel Field Label to show in the message
   */
  private showWarnCandidate(fieldLabel: string, name: string) {
    const isChildForm = name.startsWith(this._childFieldNamePrefix) ? true : false;

    // only show on first key
    if (isChildForm) {
      if (this._selectedCandidateChangeWarnChild[name] === name) {
        return;
      }
    } else {
      if (this._selectedCandidateChangeWarn[name] === name) {
        return;
      }
    }

    const message = `Please note that if you update contact information it will be updated in the Contacts file.`;
    this._dialogService.confirm(message, ConfirmModalComponent, 'Warning!', false).then(res => { });

    if (isChildForm) {
      this._selectedCandidateChangeWarnChild[name] = name;
    } else {
      this._selectedCandidateChangeWarn[name] = name;
    }
  }

  /**
   * Select elements width is set on the form-group level not the select element
   * as done with text and date fields.
   */
  public setSelectTypeWidth(col: any) {
    if (col.type === 'select') {
      return col.width;
    }
    return null;
  }

  public customStateSearchFn(term: string, state: any) {
    term = term.toLowerCase();
    return state.name.toLowerCase().indexOf(term) > -1 || state.code.toLowerCase() === term;
  }

  /**
   * Handle warnings when state changes.
   */
  public handleStateChange(stateOption: any, col: any) {
    const isChildForm = col.name.startsWith(this._childFieldNamePrefix) ? true : false;

    if (isChildForm) {
      if (this._selectedEntityChild) {
        this.showWarn(col.text, this._childFieldNamePrefix + 'state');
      } else if (this._selectedCandidateChild) {
        this.showWarnCandidate(col.text, col.name);
      }
    } else {
      if (this._selectedEntity) {
        this.showWarn(col.text, 'state');
      } else if (this._selectedCandidate) {
        this.showWarnCandidate(col.text, col.name);
      }
    }
  }

  /**
   *
   * @param item
   * @param col
   */
  public handleCandOfficeChange(item: any, col: any) {
    const isChildForm = col.name.startsWith(this._childFieldNamePrefix) ? true : false;
    if (isChildForm) {
      if (this._selectedCandidateChild) {
        this.showWarnCandidate(col.text, col.name);
      }
    } else {
      if (this._selectedCandidate) {
        this.showWarnCandidate(col.text, col.name);
      }
    }
  }

  /**
   * Set the Election Code on the form when it changes in the UI.
   */
  public handleElectionCodeChange(item: any, col: any) {
    // TODO change template to use the ng-select inputs as done with
    // candidate office.

    const isChildForm = col.name.startsWith(this._childFieldNamePrefix) ? true : false;

    let fieldNamePrefix = '';
    if (isChildForm) {
      fieldNamePrefix = this._childFieldNamePrefix;
    }
    const description = fieldNamePrefix + 'election_other_description';

    // Description is required when Other is selected
    if (item.electionType === 'O') {
      if (this.frmIndividualReceipt.contains(description)) {
        this.frmIndividualReceipt.controls[description].setValidators([Validators.required]);
        this.frmIndividualReceipt.controls[description].updateValueAndValidity();
      }
    } else {
      if (this.frmIndividualReceipt.contains(description)) {
        this.frmIndividualReceipt.controls[description].setValidators([Validators.nullValidator]);
        this.frmIndividualReceipt.controls[description].updateValueAndValidity();
      }
    }
  }

  /**
   * Vaidates the form on submit.
   */
  private _doValidateReceipt(saveAction: SaveActions): Observable<any> {
    // TODO because parent is saved automatically when user clicks add child, we
    // may not want to save it if unchanged.  Check form status for untouched.

    if (this.frmIndividualReceipt.valid) {
      const receiptObj: any = {};

      for (const field in this.frmIndividualReceipt.controls) {
        if (field === 'contribution_date' || field === 'expenditure_date') {
          receiptObj[field] = this._utilService.formatDate(this.frmIndividualReceipt.get(field).value);
        } else if (field === this._childFieldNamePrefix + 'contribution_date') {
          receiptObj[field] = this._utilService.formatDate(this.frmIndividualReceipt.get(field).value);
        } else if (field === 'memo_code') {
          if (this.memoCode) {
            receiptObj[field] = this.frmIndividualReceipt.get(field).value;
            console.log('memo code val ' + receiptObj[field]);
          }
        } else if (field === this._childFieldNamePrefix + 'memo_code') {
          if (this.memoCodeChild) {
            receiptObj[field] = this.frmIndividualReceipt.get(field).value;
            console.log('child memo code val ' + receiptObj[field]);
          }
        } else if (this.isFieldName(field, 'purpose_description') || this.isFieldName(field, 'expenditure_purpose')) {
          const preTextHiddenField = this._findHiddenField('name', 'pretext');
          let preText = '';
          if (preTextHiddenField) {
            preText = preTextHiddenField.value ? preTextHiddenField.value : '';
          }
          const purposeVal = this.frmIndividualReceipt.get(field).value;
          if (purposeVal) {
            receiptObj[field] = preText + this.frmIndividualReceipt.get(field).value;
          } else {
            receiptObj[field] = this.frmIndividualReceipt.get(field).value;
          }
        } else if (
          field === 'last_name' ||
          field === 'first_name' ||
          field === 'cand_last_name' ||
          field === 'cand_first_name' ||
          this.isFieldName(field, 'cmte_id') ||
          this.isFieldName(field, 'cmte_name') ||
          this.isFieldName(field, 'designating_cmte_name') ||
          this.isFieldName(field, 'subordinate_cmte_name') ||
          this.isFieldName(field, 'entity_name')
        ) {
          // if (this._selectedEntity) {
          // If the typeahead was used to load the entity into the form,
          // we don't allow users to make changes to the entity. Non-Typeahead
          // field (address, middle name, etc) are reset onKeyup.  Typeahead
          // fields must be reset here.  This is a known UI design issue with the
          // typeahead and not being able to disable fields because of add functionality.
          // We are tolerating this limitation where the user may change the last or
          // first name, it will reflect the change in the UI but won't be save to API.
          // receiptObj[field] = this._selectedEntity[field];
          // } else {
          // TODO Possible defect with typeahead setting field as the entity object
          // rather than the string defined by the inputFormatter();
          // If an object is received, find the value on the object by fields type
          // otherwise use the string value.  This is not desired and this patch
          // should be removed if the issue is resolved.
          const typeAheadField = this.frmIndividualReceipt.get(field).value;
          if (typeAheadField && typeof typeAheadField !== 'string') {
            receiptObj[field] = typeAheadField[field];
          } else {
            receiptObj[field] = typeAheadField;
          }
          // }
        } else if (field === 'donor_cmte_id' ||
          field === 'payee_cmte_id' ||
          field === 'beneficiary_cmte_id' ||
          field === 'designating_cmte_id' ||
          field === 'subordinate_cmte_id') {
          // added this condition as formControl value is entire entity object
          // when we perform auto lookup.
          const typeAheadField = this.frmIndividualReceipt.get(field).value;
          if (typeAheadField && typeof typeAheadField !== 'string') {
            receiptObj[field] = typeAheadField['cmte_id'];
          } else {
            receiptObj[field] = typeAheadField;
          }
        } else if (field === 'contribution_amount' || field === 'expenditure_amount') {
          if (this._contributionAmount === '') {
            let amountValue = this.frmIndividualReceipt.get(field).value;
            amountValue = amountValue.replace(/,/g, ``);
            this._contributionAmount = amountValue.toString();
          }
          receiptObj[field] = this._contributionAmount;
        } else if (field === this._childFieldNamePrefix + 'contribution_amount') {
          receiptObj[field] = this._contributionAmountChlid;
        } else if (
          field === 'beginning_balance' ||
          field === 'incurred_amount' ||
          field === 'balance_at_close' ||
          field === 'payment_amount' ||
          field === 'total_amount' ||
          field === 'fed_share_amount' ||
          field === 'non_fed_share_amount' ||
          field === 'activity_event_amount_ytd' ||
          field === 'aggregate_general_elec_exp' ||
          // for H6 fields name
          field === 'federal_share' ||
          field === 'levin_share'
        ) {
          // fed_share_amount, non_fed_share_amount, activity_event_amount_ytd
          // Amounts in numeric format shoud be supported by the API.
          // The individual-receipt.service is currently only passing string values
          // to in the request.  TODO Why is this?  Remove the check or allow numerics and
          // then remove this block of code.
          let amountVal = null;
          if (this.frmIndividualReceipt.get(field).value) {
            amountVal = this.frmIndividualReceipt.get(field).value;
            if (amountVal) {
              amountVal = amountVal.toString();
              amountVal = amountVal.replace(/,/g, ``);
            }
          }
          receiptObj[field] = amountVal;
        } else if (field === 'levin_account_id') {
          receiptObj[field] = this.frmIndividualReceipt.get(field).value.toString();
        } else {
          receiptObj[field] = this.frmIndividualReceipt.get(field).value;
        }
      }

      // for each entity ID comes from the dynamic form fields as setEntityIdTo.
      // If setEntityIdTo not sent by API, default to entity_id.
      if (this._transactionToEdit) {
        this.hiddenFields.forEach((el: any) => {
          if (el.name === 'transaction_id') {
            el.value = this._transactionToEdit.transactionId;
            // If Transaction Id is present, setting Action to Edit
            this.scheduleAction = ScheduleActions.edit;
          } else if (el.name === 'api_call') {
            el.value = this._transactionToEdit.apiCall;
          }
        });
      }

      this.hiddenFields.forEach(el => {
        receiptObj[el.name] = el.value;
      });

      // If entity ID exist, the transaction will be added to the existing entity by the API
      // Otherwise it will create a new Entity.  Since there may be more than 1 entity
      // saved in a form, entity IDs must be unique for each.  The name of the property

      this._setReceiptObjectEntityId(this._selectedEntity, receiptObj, false);
      this._setReceiptObjectEntityId(this._selectedEntityChild, receiptObj, true);
      this._setReceiptObjectEntityId(this._selectedCandidate, receiptObj, false);
      this._setReceiptObjectEntityId(this._selectedCandidateChild, receiptObj, true);

      if (this._transactionToEdit) {
        if (receiptObj['entity_id'] === null || receiptObj['entity_id'] === undefined) {
          receiptObj['entity_id'] = this._transactionToEdit.entityId;
        }
      }
      // There is a race condition with populating hiddenFields
      // and receiving transaction data to edit from the message service.
      // If editing, set transaction ID at this point to avoid race condition issue.
      // Two transactions one screen is messing up..
      // we might need to revisit to fix the two transactions one screen

      // set the back ref id for save on a sub tran.
      if (
        this._parentTransactionModel &&
        this._parentTransactionModel.transactionId &&
        this.scheduleAction === ScheduleActions.addSubTransaction
      ) {
        receiptObj.back_ref_transaction_id = this._parentTransactionModel.transactionId;
      }

      localStorage.setItem(`form_${this.formType}_receipt`, JSON.stringify(receiptObj));

      this._receiptService.saveSchedule(this.formType, this.scheduleAction).subscribe(res => {
        if (res) {
          this._transactionToEdit = null;

          const reportId = this._receiptService.getReportIdFromStorage(this.formType);
          this._reportsService
            .updateReportDate(new reportModel({ report_id: reportId }))
            .subscribe((resUpdateReportDate: any) => {
              console.log(resUpdateReportDate);
            });
          this._receiptService.getSchedule(this.formType, res).subscribe(resp => {
            const message: any = {
              formType: this.formType,
              totals: resp
            };

            this._messageService.sendMessage(message);
          });

          this._contributionAmount = '';
          this._contributionAmountChlid = '';
          this._contributionAggregateValue = 0.0;
          this._contributionAggregateValueChild = 0.0;
          const contributionAggregateValue: string = this._decimalPipe.transform(
            this._contributionAggregateValue,
            '.2-2'
          );

          if (this.frmIndividualReceipt.contains('contribution_aggregate')) {
            this.frmIndividualReceipt.controls['contribution_aggregate'].setValue(contributionAggregateValue);
          }

          if (this.frmIndividualReceipt.controls['child*contribution_aggregate']) {
            const contributionAggregateValueChild: string = this._decimalPipe.transform(
              this._contributionAggregateValueChild,
              '.2-2'
            );
            if (this.frmIndividualReceipt.contains('child*contribution_aggregate')) {
              this.frmIndividualReceipt.controls['child*contribution_aggregate'].setValue(
                contributionAggregateValueChild
              );
            }
          }

          // Replace this with clearFormValues() if possible or break it into
          // 2 methods so 1 may be called here so as not to miss init vars.
          this._formSubmitted = true;
          this.memoCode = false;
          this.memoCodeChild = false;
          this.frmIndividualReceipt.reset();
          this._setMemoCodeForForm();
          this._selectedEntity = null;
          this._selectedChangeWarn = null;
          this._selectedEntityChild = null;
          this._selectedChangeWarnChild = null;
          this._selectedCandidate = null;
          this._selectedCandidateChangeWarn = null;
          this._selectedCandidateChild = null;
          this._selectedCandidateChangeWarnChild = null;
          this.activityEventNames = null;
          // Replace this with clearFormValues() if possible - END

          localStorage.removeItem(`form_${this.formType}_receipt`);
          localStorage.setItem(`form_${this.formType}_saved`, JSON.stringify({ saved: true }));
          window.scrollTo(0, 0);

          let transactionId = null;
          if (res.hasOwnProperty('transaction_id')) {
            transactionId = res.transaction_id;
          } else {
            console.log('schedA save has no transaction_id property');
          }

          // UI allows for returning to parent from unsaved child.  If this is the case switch
          // saveAction from saveForEditSub to saveForAddSub.
          if (saveAction === SaveActions.saveForEditSub) {
            let editChild = false;
            if (res) {
              if (res.hasOwnProperty('child')) {
                if (Array.isArray(res.child)) {
                  if (res.child.length > 0) {
                    if (res.child[0].hasOwnProperty('transaction_id')) {
                      if (res.child[0].transaction_id) {
                        editChild = true;
                      }
                    }
                  }
                }
              }
            }
            if (!editChild) {
              saveAction = SaveActions.saveForAddSub;
            }
          }

          // If save is for user click addChild, we are saving parent on behalf of the user
          // before presenting a new sub tran to add.  Save parent id and emit to show new child form.

          if (saveAction === SaveActions.saveForAddSub) {
            if (this.scheduleAction === ScheduleActions.add || this.scheduleAction === ScheduleActions.edit) {
              this._parentTransactionModel = this._transactionsService.mapFromServerSchedFields([res])[0];
            }

            // If the child is a sub-schedule, send a message containing the parent transaction model.
            if (this.subTransactionInfo) {
              if (this.subTransactionInfo.scheduleType && this.subTransactionInfo.subScheduleType) {
                if (this.subTransactionInfo.scheduleType !== this.subTransactionInfo.subScheduleType) {
                  this._f3xMessageService.sendParentModelMessage(this._parentTransactionModel);
                }
              }
            }

            const addSubTransEmitObj: any = {
              form: this.frmIndividualReceipt,
              direction: 'next',
              step: 'step_3',
              previousStep: 'step_2',
              transactionTypeText: this.subTransactionInfo.subTransactionTypeDescription,
              transactionType: this.subTransactionInfo.subTransactionType,
              apiCall: this.subTransactionInfo.api_call,
              scheduleType: this.subTransactionInfo.subScheduleType,
              action: ScheduleActions.addSubTransaction
            };

            const prePopulateFieldArray = this._checkForEarmarkPurposePrePopulate(res);
            if (prePopulateFieldArray) {
              addSubTransEmitObj.prePopulateFieldArray = prePopulateFieldArray;
            } else if (this.subTransactionInfo) {
              if (this.subTransactionInfo.scheduleType === 'sched_d' && this.subTransactionInfo.isParent === true) {
                addSubTransEmitObj.prePopulateFromSchedD = res;
              }
            }
            this.status.emit(addSubTransEmitObj);
          } else if (saveAction === SaveActions.saveForEditSub) {
            this._progressToChild(ScheduleActions.edit, res);
          } else if (saveAction === SaveActions.saveForReturnToParent) {
            this.returnToParent(ScheduleActions.edit);
          } else if (saveAction === SaveActions.saveForReturnToNewParent) {
            this.returnToParent(ScheduleActions.add);
          } else if (saveAction === SaveActions.updateOnly) {
            this._completedCloning = true;
            if(this.isShedH4OrH6TransactionType(this.transactionType)) {
              this.goH4OrH6Summary(this.transactionType);
            }else {
              this.viewTransactions();
            }
          } else {
            if (saveAction === SaveActions.saveOnly) {
              // sched D subtran must have payee fields pre-poulated after saving one
              // and presenting new one to save.
              if (this.subTransactionInfo) {
                if (this.subTransactionInfo.scheduleType === 'sched_d' && this.subTransactionInfo.isParent === false) {
                  this._prePopulateFromSchedDData = res;
                  this._prePopulateFromSchedD(this._prePopulateFromSchedDData);
                }
              }
            }

            let resetParentId = true;
            if (this.subTransactionInfo) {
              if (this.subTransactionInfo.isParent === false) {
                resetParentId = false;
              }
            }
            if (resetParentId) {
              this._parentTransactionModel = null;
              this.subTransactions = [];
            }
          }
          // setting default action to add/addSub when we save transaction
          // as it should not be for edit after save.
          if (!this.isEarmark()) {
            if (this._isSubOfParent()) {
              this.scheduleAction = ScheduleActions.addSubTransaction;
            } else {
              this.scheduleAction = ScheduleActions.add;
            }
          }
        }
      });
    } else {
      this.frmIndividualReceipt.markAsDirty();
      this.frmIndividualReceipt.markAsTouched();
      localStorage.setItem(`form_${this.formType}_saved`, JSON.stringify({ saved: false }));
      window.scrollTo(0, 0);

      const invalid = [];
      const controls = this.frmIndividualReceipt.controls;
      for (const name in controls) {
        if (controls[name].invalid) {
          invalid.push(name);
          console.log('invalid form field on submit = ' + name);
        }
      }
      return Observable.of('invalid');
    }
  }

  /**
   * Used by Earmarks or any other transaction where the
   * "2 transactions / 1 screen" requirement is needed.
   */
  public saveAndReturnToNewParent(): void {
    this._doValidateReceipt(SaveActions.saveForReturnToNewParent);
  }

  /**
   * Save a child transaction and show its parent.  If the form has not been
   * changed (dirty) then don't save and just show parent.
   */
  public saveAndReturnToParent(): void {
    if (!this.frmIndividualReceipt.dirty) {
      this.clearFormValues();
      this.returnToParent(ScheduleActions.edit);
    } else {
      this._doValidateReceipt(SaveActions.saveForReturnToParent);
    }
  }

  /**
   * Set CSS properties when the memo dropdown opens and closes.
   */
  public multipleMemoDropdownChanged(open: boolean) {
    if (open) {
      // TEMP hack for testing
      // this.multipleSubTransactionInfo.push(this.multipleSubTransactionInfo[0]);

      // 23 px for each item and add 40px for default.
      let size = this.multipleSubTransactionInfo ? this.multipleSubTransactionInfo.length : 0;
      size = size > 0 ? size * 23 + 40 : 0;
      this.memoDropdownSize = size + 'px';
    } else {
      this.memoDropdownSize = null;
    }
  }

  public saveForAddMemoSub(jfMemo: any): void {
    this.subTransactionInfo = jfMemo;
    this._doValidateReceipt(SaveActions.saveForAddSub);
  }

  public saveForAddSub(): void {
    this._doValidateReceipt(SaveActions.saveForAddSub);
  }

  public saveForAddEarmark(): void {
    this._doValidateReceipt(SaveActions.saveForAddSub);
  }

  public saveForEditEarmark(): void {
    this._doValidateReceipt(SaveActions.saveForEditSub);
  }

  public saveOnly(): void {
    this._doValidateReceipt(SaveActions.saveOnly);
  }

  public updateOnly(): void {
    this._doValidateReceipt(SaveActions.updateOnly);
  }

  private _progressToChild(scheduleAction: ScheduleActions, res: any): void {
    let childTransactionId = null;
    let childTransaction = null;
    let apiCall = null;
    if (res.hasOwnProperty('child')) {
      if (Array.isArray(res.child)) {
        if (res.child.length > 0) {
          childTransaction = res.child[0];
          if (res.child[0].hasOwnProperty('transaction_id')) {
            childTransactionId = res.child[0].transaction_id;
          }
          if (res.child[0].hasOwnProperty('api_call')) {
            apiCall = res.child[0].api_call;
          }
        }
      }
    }

    if (childTransactionId && apiCall) {
      const transactionModel = new TransactionModel({});
      transactionModel.transactionId = childTransactionId;
      transactionModel.type = this.subTransactionInfo.subTransactionTypeDescription;
      transactionModel.transactionTypeIdentifier = this.subTransactionInfo.subTransactionType;
      transactionModel.apiCall = apiCall;
      // Need a better way to pass a fully populated child TransactionModel.
      // Until then mapping for additional fields will be done here field by field.
      if (childTransaction) {
        let prefix = '';
        if (childTransaction.hasOwnProperty('contribution_amount')) {
          prefix = 'contribution_';
        } else if (childTransaction.hasOwnProperty('expenditure_amount')) {
          prefix = 'expenditure_';
        }
        transactionModel.amount = childTransaction[prefix + 'amount'];
        transactionModel.date = childTransaction[prefix + 'date'];
        transactionModel.aggregate = childTransaction[prefix + 'aggregate'];
        transactionModel.memoCode = childTransaction.memo_code;
        transactionModel.entityId = childTransaction.entity_id;
      }

      this.memoCode = false;
      this.memoCodeChild = false;
      const emitObj: any = {
        form: {},
        direction: 'next',
        step: 'step_3',
        previousStep: 'step_2',
        transactionTypeText: this.subTransactionInfo.subTransactionTypeDescription,
        transactionType: this.subTransactionInfo.subTransactionType,
        action: scheduleAction,
        scheduleType: this.subTransactionInfo.subScheduleType
      };
      if (scheduleAction === ScheduleActions.edit) {
        emitObj.transactionDetail = { transactionModel: transactionModel };
      }
      this.status.emit(emitObj);
    }
  }

  /**
   * Return to the parent transaction from sub tran.
   */
  public returnToParent(scheduleAction: ScheduleActions): void {
    this.clearFormValues();
    let transactionModel = this._parentTransactionModel;
    if (!transactionModel) {
      transactionModel = new TransactionModel({});
    }
    transactionModel.type = this.subTransactionInfo.transactionTypeDescription;
    transactionModel.transactionTypeIdentifier = this.subTransactionInfo.transactionType;
    transactionModel.apiCall = this.subTransactionInfo.api_call;
    this.memoCode = false;
    this.memoCodeChild = false;
    const emitObj: any = {
      form: {},
      direction: 'next',
      step: 'step_3',
      previousStep: 'step_2',
      transactionTypeText: this.subTransactionInfo.transactionTypeDescription,
      transactionType: this.subTransactionInfo.transactionType,
      action: scheduleAction,
      scheduleType: this.subTransactionInfo.scheduleType
    };
    if (scheduleAction === ScheduleActions.edit) {
      emitObj.transactionDetail = { transactionModel: transactionModel };
    }
    this.status.emit(emitObj);
  }

  private _setReceiptObjectEntityId(userSelectedEntity: any, receiptObj: any, isChild: boolean) {
    // added condition to check if entity_id already exist in receiptObj to avoid overriding entity ID's
    if (userSelectedEntity && !receiptObj.entity_id) {
      if (userSelectedEntity.setEntityIdTo) {
        receiptObj[userSelectedEntity.setEntityIdTo] = userSelectedEntity.entity_id;
      } else {
        receiptObj.entity_id = userSelectedEntity.entity_id;
      }
    }
  }

  protected _setSetEntityIdTo(userSelectedEntity: any, col: any) {
    if (col.setEntityIdTo) {
      userSelectedEntity.setEntityIdTo = col.setEntityIdTo;
    }
  }

  /**
   * Goes to the previous step.
   */
  public previousStep(): void {
    this.clearFormValues();
    this.status.emit({
      form: {},
      direction: 'previous',
      step: 'step_2'
    });
  }

  /**
   * Navigate to the Transactions.
   */
  public viewTransactions(): void {
    if (!this._cloned || this._completedCloning) {
      this.clearFormValues();
      let reportId = this._receiptService.getReportIdFromStorage(this.formType);
      console.log('reportId', reportId);

      if (!reportId) {
        reportId = '0';
      }
      localStorage.setItem(`form_${this.formType}_view_transaction_screen`, 'Yes');
      localStorage.setItem('Transaction_Table_Screen', 'Yes');
      this._transactionsMessageService.sendLoadTransactionsMessage(reportId);

      this._router.navigate([`/forms/form/${this.formType}`], {
        queryParams: {
          step: 'transactions',
          reportId: reportId,
          edit: this.editMode,
          transactionCategory: this._transactionCategory
        }
      });
    } else {
      let reportId = this._receiptService.getReportIdFromStorage(this.formType);
      if (!reportId) {
        reportId = '0';
      }
      this._dialogService
        .confirm(
          'You are about to delete this transaction ' + this._transactionToEdit.transactionId + '.',
          ConfirmModalComponent,
          'Caution!'
        )
        .then(res => {
          if (res === 'okay') {
            this._transactionsService
              .trashOrRestoreTransactions(this.formType, 'trash', reportId, [this._transactionToEdit])
              .subscribe((res: GetTransactionsResponse) => {
                this._dialogService
                  .confirm(
                    'Transaction has been successfully deleted and sent to the recycle bin. ' +
                    this._transactionToEdit.transactionId,
                    ConfirmModalComponent,
                    'Success!',
                    false,
                    ModalHeaderClassEnum.successHeader
                  )
                  .then(response => {
                    if (
                      response === 'okay' ||
                      response === 'cancel' ||
                      response === ModalDismissReasons.BACKDROP_CLICK ||
                      response === ModalDismissReasons.ESC
                    ) {
                      this._router.navigate([`/forms/form/${this.formType}`], {
                        queryParams: {
                          step: 'transactions',
                          reportId: reportId,
                          edit: this.editMode,
                          transactionCategory: this._transactionCategory,
                          refresh: 1
                        }
                      });
                      this._router.navigateByUrl('/dashboard', { skipLocationChange: true }).then(() => {
                        this._router.navigate([`/forms/form/${this.formType}`], {
                          queryParams: {
                            step: 'transactions',
                            reportId: reportId,
                            edit: this.editMode,
                            transactionCategory: this._transactionCategory
                          }
                        });
                      });
                    }
                  });
              });
          } else if (res === 'cancel') {
          }
        });
    }
  }

  public printPreview(): void {
    this._reportTypeService.printPreview('individual_receipt', this.formType);
  }
  public ImportTransactions(): void {
    alert('Import transaction is not yet supported');
  }

  /**
   * Format an entity to display in the type ahead.
   *
   * @param result formatted item in the typeahead list
   */
  public formatTypeaheadItem(result: any) {
    const lastName = result.last_name ? result.last_name.trim() : '';
    const firstName = result.first_name ? result.first_name.trim() : '';
    const street1 = result.street_1 ? result.street_1.trim() : '';
    const street2 = result.street_2 ? result.street_2.trim() : '';

    return `${lastName}, ${firstName}, ${street1}, ${street2}`;
  }

  /**
   * Format an entity to display in the Org type ahead.
   *
   * @param result formatted item in the typeahead list
   */
  public formatTypeaheadOrgItem(result: any) {
    const street1 = result.street_1 ? result.street_1.trim() : '';
    const street2 = result.street_2 ? result.street_2.trim() : '';
    const name = result.entity_name ? result.entity_name.trim() : '';

    return `${name}, ${street1}, ${street2}`;
  }

  /**
   * Format an entity to display in the Committee ID type ahead.
   *
   * @param result formatted item in the typeahead list
   */
  public formatTypeaheadCommitteeId(result: any) {
    const street1 = result.street_1 ? result.street_1.trim() : '';
    const street2 = result.street_2 ? result.street_2.trim() : '';
    const name = result.cmte_id ? result.cmte_id.trim() : '';

    return `${name}, ${street1}, ${street2}`;
  }

  /**
   * Format an entity to display in the Candidate ID type ahead.
   *
   * @param result formatted item in the typeahead list
   */
  public formatTypeaheadCandidateId(result: any) {
    const candidateId = result.beneficiary_cand_id ? result.beneficiary_cand_id.trim() : '';
    const lastName = result.cand_last_name ? result.cand_last_name.trim() : '';
    const firstName = result.cand_first_name ? result.cand_first_name.trim() : '';
    let office = result.cand_office ? result.cand_office.toUpperCase().trim() : '';
    if (office) {
      if (office === 'P') {
        office = 'Presidential';
      } else if (office === 'S') {
        office = 'Senate';
      } else if (office === 'H') {
        office = 'House';
      }
    }
    const officeState = result.cand_office_state ? result.cand_office_state.trim() : '';
    const officeDistrict = result.cand_office_district ? result.cand_office_district.trim() : '';

    return `${candidateId}, ${lastName}, ${firstName}, ${office}, ${officeState}, ${officeDistrict}`;
  }

  /**
   * Format an entity to display in the Committee Name type ahead.
   *
   * @param result formatted item in the typeahead list
   */
  public formatTypeaheadCommitteeName(result: any) {
    const street1 = result.street_1 ? result.street_1.trim() : '';
    const street2 = result.street_2 ? result.street_2.trim() : '';
    const name = result.cmte_id ? result.cmte_name.trim() : '';

    return `${name}, ${street1}, ${street2}`;
  }

  /**
   * Format an entity to display in the Candidate type ahead field.
   *
   * @param result formatted item in the typeahead list
   */
  public formatTypeaheadCandidate(result: any) {
    const lastName = result.cand_last_name ? result.cand_last_name.trim() : '';
    const firstName = result.cand_first_name ? result.cand_first_name.trim() : '';
    let office = result.cand_office ? result.cand_office.toUpperCase().trim() : '';
    if (office) {
      if (office === 'P') {
        office = 'Presidential';
      } else if (office === 'S') {
        office = 'Senate';
      } else if (office === 'H') {
        office = 'House';
      }
    }
    const officeState = result.cand_office_state ? result.cand_office_state.trim() : '';
    const officeDistrict = result.cand_office_district ? result.cand_office_district.trim() : '';

    return `${lastName}, ${firstName}, ${office}, ${officeState}, ${officeDistrict}`;
  }

  /**
   * Populate the fields in the form with the values from the selected Candidate.
   *
   * @param $event The mouse event having selected the contact from the typeahead options.
   */
  public handleSelectedCandidate($event: NgbTypeaheadSelectItemEvent, col: any) {
    // FNE-1438 Need to detect if tab key caused the event. And don't load if true.
    // TODO need a way to determine if key was tab.

    const entity = $event.item;

    const isChildForm = col.name.startsWith(this._childFieldNamePrefix) ? true : false;
    let namePrefix = '';

    if (isChildForm) {
      this._selectedCandidateChild = this._utilService.deepClone(entity);
      this._setSetEntityIdTo(this._selectedCandidateChild, col);
      this._selectedCandidateChangeWarnChild = {};
      namePrefix = this._childFieldNamePrefix;
    } else {
      this._selectedCandidate = this._utilService.deepClone(entity);
      this._setSetEntityIdTo(this._selectedCandidate, col);
      this._selectedCandidateChangeWarn = {};
    }

    const fieldNames = [];
    fieldNames.push('cand_last_name');
    fieldNames.push('cand_first_name');
    fieldNames.push('cand_middle_name');
    fieldNames.push('cand_prefix');
    fieldNames.push('cand_suffix');
    fieldNames.push('cand_office');
    fieldNames.push('cand_office_state');
    fieldNames.push('cand_office_district');
    fieldNames.push('cand_election_year');
    fieldNames.push('beneficiary_cand_id');
    this._patchFormFields(fieldNames, entity, namePrefix);
    // setting Beneficiary Candidate Entity Id to hidden variable
    const beneficiaryCandEntityIdHiddenField = this._findHiddenField('name', 'beneficiary_cand_entity_id');
    if (beneficiaryCandEntityIdHiddenField) {
      beneficiaryCandEntityIdHiddenField.value = entity.beneficiary_cand_entity_id;
    }

    if (this.abstractScheduleComponent === AbstractScheduleParentEnum.schedFComponent) {
      if (this.frmIndividualReceipt.contains('expenditure_date')) {
        if (this._selectedCandidate) {
          if (this._selectedCandidate.beneficiary_cand_id) {
            const dateValue = this.frmIndividualReceipt.get('expenditure_date').value;
            const expenditureDate = this._utilService.formatDate(dateValue);
            this._getSchedFDebtPaymentAggregate(this._selectedCandidate.beneficiary_cand_id,
              expenditureDate, this._selectedCandidate.beneficiary_cand_entity_id);
          }
        }
      }
    }
  }

  /**
   * Populate the fields in the form with the values from the selected individual.
   *
   * @param $event The mouse event having selected the contact from the typeahead options.
   */
  public handleSelectedIndividual($event: NgbTypeaheadSelectItemEvent, col: any) {
    const entity = $event.item;

    const isChildForm = col.name.startsWith(this._childFieldNamePrefix) ? true : false;
    let namePrefix = '';

    if (isChildForm) {
      this._selectedEntityChild = this._utilService.deepClone(entity);
      this._setSetEntityIdTo(this._selectedEntityChild, col);
      this._selectedChangeWarnChild = {};
      namePrefix = this._childFieldNamePrefix;
    } else {
      this._selectedEntity = this._utilService.deepClone(entity);
      this._setSetEntityIdTo(this._selectedEntity, col);
      this._selectedChangeWarn = {};
    }

    const fieldNames = [];
    fieldNames.push('last_name');
    fieldNames.push('first_name');
    fieldNames.push('middle_name');
    fieldNames.push('prefix');
    fieldNames.push('suffix');
    fieldNames.push('street_1');
    fieldNames.push('street_2');
    fieldNames.push('city');
    fieldNames.push('state');
    fieldNames.push('zip_code');
    fieldNames.push('occupation');
    fieldNames.push('employer');
    this._patchFormFields(fieldNames, entity, namePrefix);

    // If date is selected, get the aggregate.
    if (this.frmIndividualReceipt.contains('contribution_date')) {
      const dateValue = this.frmIndividualReceipt.get('contribution_date').value;
      const contribDate = this._utilService.formatDate(dateValue);
      if (contribDate) {
        this._getContributionAggregate(contribDate, this._selectedEntity.entity_id, null);
      }
    }
  }

  private _patchFormFields(fieldNames: string[], entity: any, namePrefix: string) {
    if (fieldNames) {
      for (const fieldName of fieldNames) {
        const patch = {};
        patch[namePrefix + fieldName] = entity[fieldName];
        this.frmIndividualReceipt.patchValue(patch, { onlySelf: true });
      }
    }
  }

  /**
   * Populate the fields in the form with the values from the selected contact.
   *
   * @param $event The mouse event having selected the contact from the typeahead options.
   */
  // TODO use the factory method approach a done with individual to avoid hard coding
  // child name field prefix and it's let error prone.
  public handleSelectedOrg($event: NgbTypeaheadSelectItemEvent, col: any) {
    const entity = $event.item;

    const isChildForm = col.name.startsWith(this._childFieldNamePrefix) ? true : false;

    let namePrefix = '';
    if (isChildForm) {
      this._selectedEntityChild = this._utilService.deepClone(entity);
      this._setSetEntityIdTo(this._selectedEntityChild, col);
      this._selectedChangeWarnChild = {};
      namePrefix = this._childFieldNamePrefix;
    } else {
      this._selectedEntity = this._utilService.deepClone(entity);
      this._setSetEntityIdTo(this._selectedEntity, col);
      this._selectedChangeWarn = {};
    }

    // These field names map to the same name in the form
    const fieldNames = [];
    fieldNames.push('street_1');
    fieldNames.push('street_2');
    fieldNames.push('city');
    fieldNames.push('state');
    fieldNames.push('zip_code');
    fieldNames.push('occupation');
    fieldNames.push('employer');
    fieldNames.push('cand_last_name');
    fieldNames.push('cand_first_name');
    fieldNames.push('cand_middle_name');
    fieldNames.push('cand_suffix');
    fieldNames.push('cand_prefix');
    fieldNames.push('cand_office');
    fieldNames.push('cand_office_state');
    fieldNames.push('cand_office_district');
    this._patchFormFields(fieldNames, entity, namePrefix);
    // setting Beneficiary Candidate Entity Id to hidden variable
    const beneficiaryCandEntityIdHiddenField = this._findHiddenField('name', 'beneficiary_cand_entity_id');
    if (beneficiaryCandEntityIdHiddenField) {
      beneficiaryCandEntityIdHiddenField.value = entity.beneficiary_cand_entity_id;
    }
    // These fields names do not map to the same name in the form
    const fieldName = col.name;
    if (isChildForm) {
      if (fieldName === this._childFieldNamePrefix + 'entity_name') {
        if (this.frmIndividualReceipt.contains('child*donor_cmte_id')) {
          this.frmIndividualReceipt.patchValue({ 'child*donor_cmte_id': entity.cmte_id }, { onlySelf: true });
        }
        if (this.frmIndividualReceipt.contains('child*beneficiary_cmte_id')) {
          this.frmIndividualReceipt.patchValue({ 'child*beneficiary_cmte_id': entity.cmte_id }, { onlySelf: true });
        }
      }
      if (
        fieldName === this._childFieldNamePrefix + 'donor_cmte_id' ||
        fieldName === this._childFieldNamePrefix + 'beneficiary_cmte_id'
      ) {
        this.frmIndividualReceipt.patchValue({ 'child*entity_name': entity.cmte_name }, { onlySelf: true });
      }

      if (fieldName === this._childFieldNamePrefix + 'donor_cmte_name') {
        this.frmIndividualReceipt.patchValue({ 'child*donor_cmte_id': entity.cmte_id }, { onlySelf: true });
      }
      if (fieldName === this._childFieldNamePrefix + 'beneficiary_cmte_name') {
        this.frmIndividualReceipt.patchValue({ 'child*beneficiary_cmte_id': entity.cmte_id }, { onlySelf: true });
      }
      if (fieldName === this._childFieldNamePrefix + 'donor_cmte_id') {
        this.frmIndividualReceipt.patchValue({ 'child*donor_cmte_name': entity.cmte_name }, { onlySelf: true });
      }
      if (fieldName === this._childFieldNamePrefix + 'beneficiary_cmte_id') {
        this.frmIndividualReceipt.patchValue({ 'child*beneficiary_cmte_name': entity.cmte_name }, { onlySelf: true });
      }
    } else {
      if (fieldName === 'entity_name' || fieldName === 'donor_cmte_id' || fieldName === 'beneficiary_cmte_id') {
        // populate org/committee fields
        if (fieldName === 'entity_name') {
          if (this.frmIndividualReceipt.controls['donor_cmte_id']) {
            this.frmIndividualReceipt.patchValue({ donor_cmte_id: entity.cmte_id }, { onlySelf: true });
          } else if (this.frmIndividualReceipt.controls['beneficiary_cmte_id']) {
            this.frmIndividualReceipt.patchValue({ beneficiary_cmte_id: entity.cmte_id }, { onlySelf: true });
          }
        }
        if (fieldName === 'donor_cmte_id' || fieldName === 'beneficiary_cmte_id') {
          this.frmIndividualReceipt.patchValue({ entity_name: entity.cmte_name }, { onlySelf: true });
        }
      }
    }
  }

  /**
   * Search for entities/contacts when last name input value changes.
   */
  searchLastName = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        if (searchText) {
          return this._typeaheadService.getContacts(searchText, 'last_name');
        } else {
          return Observable.of([]);
        }
      })
    );

  /**
   * Search for entities/contacts when first name input value changes.
   */
  searchFirstName = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        if (searchText) {
          return this._typeaheadService.getContacts(searchText, 'first_name');
        } else {
          return Observable.of([]);
        }
      })
    );

  /**
   * Search for Candidates when last name input value changes.
   */
  searchCandLastName = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        if (searchText) {
          return this._typeaheadService.getContacts(searchText, 'cand_last_name');
        } else {
          return Observable.of([]);
        }
      })
    );

  /**
   * Search for Candidate when first name input value changes.
   */
  searchCandFirstName = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        if (searchText) {
          return this._typeaheadService.getContacts(searchText, 'cand_first_name');
        } else {
          return Observable.of([]);
        }
      })
    );

  /**
   * Search for entities when organization/entity_name input value changes.
   */
  searchOrg = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        if (searchText) {
          return this._typeaheadService.getContacts(searchText, 'entity_name');
        } else {
          return Observable.of([]);
        }
      })
    );

  /**
   * Search for entities when organization/entity_name input value changes.
   */
  searchCommitteeName = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        if (searchText) {
          return this._typeaheadService.getContacts(searchText, 'cmte_name');
        } else {
          return Observable.of([]);
        }
      })
    );

  /**
   * Search for entities when organization/entity_name input value changes.
   */
  searchCommitteeId = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        const searchTextUpper = searchText.toUpperCase();

        if (
          searchTextUpper === 'C' ||
          searchTextUpper === 'C0' ||
          searchTextUpper === 'C00' ||
          searchTextUpper === 'C000'
        ) {
          return Observable.of([]);
        }

        if (searchText) {
          return this._typeaheadService.getContacts(searchText, 'cmte_id');
        } else {
          return Observable.of([]);
        }
      })
    );


  /**
   * Search for entities when Candidate ID input value changes.
   */
  searchCandidateId = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        if (searchText.length < 3) {
          return Observable.of([]);
        } else {
          const searchTextUpper = searchText.toUpperCase();
          return this._typeaheadService.getContacts(searchTextUpper, 'cand_id');
        }
      })
    );

  /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the last name field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterLastName = (x: { last_name: string }) => {
    if (typeof x !== 'string') {
      return x.last_name;
    } else {
      return x;
    }
  };

  /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the first name field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterFirstName = (x: { first_name: string }) => {
    if (typeof x !== 'string') {
      return x.first_name;
    } else {
      return x;
    }
  };

  /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the last name field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterCandLastName = (x: { cand_last_name: string }) => {
    if (typeof x !== 'string') {
      return x.cand_last_name;
    } else {
      return x;
    }
  };

  /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the first name field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterCandFirstName = (x: { cand_first_name: string }) => {
    if (typeof x !== 'string') {
      return x.cand_first_name;
    } else {
      return x;
    }
  };

  /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the entity name field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterOrgName = (x: { entity_name: string }) => {
    if (typeof x !== 'string') {
      return x.entity_name;
    } else {
      return x;
    }
  };

  /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the committee ID field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterCommitteeId = (x: { cmte_id: string }) => {
    if (typeof x !== 'string') {
      return x.cmte_id;
    } else {
      return x;
    }
  };

  /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the Candidate ID field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterCandidateId = (x: { beneficiary_cand_id: string }) => {
    if (typeof x !== 'string') {
      return x.beneficiary_cand_id;
    } else {
      return x;
    }
  };

  /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the committee name field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterCommitteeName = (x: { cmte_name: string }) => {
    if (typeof x !== 'string') {
      return x.cmte_name;
    } else {
      return x;
    }
  };

  public checkForMemoCode(fieldName: string) {
    const isChildForm = fieldName.startsWith(this._childFieldNamePrefix) ? true : false;
    if (isChildForm) {
      return this.memoCodeChild;
    } else {
      return this.memoCode;
    }
  }

  /**
   * Apply business rules when date changes.
   *
   * @param fieldName the date field name in the form.
   */
  public dateChange(fieldName: string) {
    console.log('date has changed!');
    const isChildForm = fieldName.startsWith(this._childFieldNamePrefix) ? true : false;
    if (isChildForm) {
      if (this.frmIndividualReceipt.contains(this._childFieldNamePrefix + fieldName)) {
        const dateValue = this.frmIndividualReceipt.get(this._childFieldNamePrefix + fieldName).value;
        if (!dateValue) {
          return;
        }
        /*
          Memo transactions should not validate for transaction date
        */
        if (this.memoCode) {
          this.frmIndividualReceipt.controls[this._childFieldNamePrefix + fieldName].setValidators([
            Validators.required
          ]);
          this.frmIndividualReceipt.controls[this._childFieldNamePrefix + fieldName].updateValueAndValidity();
        }
        if (this._selectedEntityChild) {
          const entityId = this._selectedEntityChild.entity_id ? this._selectedEntityChild.entity_id : null;
          const cmteId = this._selectedEntityChild.cmte_id ? this._selectedEntityChild.cmte_id : null;
          const contribDate = this._utilService.formatDate(dateValue);
          if (fieldName === 'contribution_date') {
            this._getContributionAggregate(contribDate, entityId, cmteId);
          }
        }
      }
    } else {
      if (this.frmIndividualReceipt.contains(fieldName)) {
        const dateValue = this.frmIndividualReceipt.get(fieldName).value;
        if (!dateValue) {
          return;
        }
        /*
          Memo transactions should not validate for transaction date
        */
        if (this.memoCode) {
          this.frmIndividualReceipt.controls[fieldName].setValidators([Validators.required]);
          this.frmIndividualReceipt.controls[fieldName].updateValueAndValidity();
        }
        if (this.abstractScheduleComponent === AbstractScheduleParentEnum.schedFComponent) {
          if (fieldName === 'expenditure_date') {
            if (this._selectedCandidate) {
              if (this._selectedCandidate.beneficiary_cand_id) {
                const expenditureDate = this._utilService.formatDate(dateValue);
                this._getSchedFDebtPaymentAggregate(this._selectedCandidate.beneficiary_cand_id,
                  expenditureDate, this._selectedCandidate.beneficiary_cand_entity_id);
              }
            }
          }
        } else {
          if (this._selectedEntity) {
            if (this._selectedEntity.entity_id) {
              const contribDate = this._utilService.formatDate(dateValue);
              if (fieldName === 'contribution_date') {
                this._getContributionAggregate(contribDate, this._selectedEntity.entity_id, null);
              }
            }
          }
        }
      }
    }
  }

  // Use this if the fields populated by the type-ahead should be disabled.
  // public isReadOnly(name: string, type: string) {
  //   if (name === 'contribution_aggregate' && type === 'text') {
  //     return true;
  //   }
  //   if (name === 'first_name' || name === 'last_name' || name === 'prefix') {
  //     if (this._selectedEntityId) {
  //       console.log('this._selectedEntityId = ' + this._selectedEntityId);
  //       return true;
  //     }
  //   }
  //   return null;
  // }

  private _getFormFields(): void {
    console.log('get transaction type form fields ' + this.transactionType);

    // init some of the dynamic form data for each call.
    // TODO may need to add others.
    this.subTransactionInfo = null;
    this.multipleSubTransactionInfo = null;
    this.subTransactions = [];
    this.memoDropdownSize = null;
    this.totalAmountReadOnly = true;
    const levinText = 'LEVIN';
    const staticTranTypes = [
      'ALLOC_H2_SUM',
      'ALLOC_H1',
      'ALLOC_H2_RATIO',
      'ALLOC_H3_RATIO',
      'ALLOC_H3_SUM',
      'ALLOC_H3_SUM_P',
      'ALLOC_H5_RATIO',
      'ALLOC_H5_SUM',
      'ALLOC_H5_SUM_P',
      'ALLOC_H4_TYPES',
      'ALLOC_H6_TYPES',
      'LA_ENTRY',
      'LB_ENTRY',
      'ALLOC_H4_SUM',
      'ALLOC_H6_SUM'
    ];
    // var a = [1,2,3];
    // Do not call dynaic form for statis transaction types
    if (staticTranTypes.indexOf(this.transactionType) !== -1) {
      return;
    }

    if (this.transactionType.startsWith(levinText)) {
      this._receiptService.getLevinAccounts().subscribe(res => {
        if (res) {
          this.levinAccounts = res;
        }
      });
    }
    this._receiptService.getDynamicFormFields(this.formType, this.transactionType).subscribe(res => {
      if (res) {
        if (res.hasOwnProperty('data')) {
          if (typeof res.data === 'object') {
            if (res.data.hasOwnProperty('formFields')) {
              if (Array.isArray(res.data.formFields)) {
                // If fields are pre-populated for "static" forms, append any additional fields
                // from the API as with SF.
                if (this.formFieldsPrePopulated) {
                  if (this.staticFormFields) {
                    if (this.staticFormFields.length > 0) {
                      for (const field of this.staticFormFields) {
                        res.data.formFields.push(field);
                      }
                    }
                  }
                }
                this.formFields = res.data.formFields;
                this._setForm(this.formFields);
              }
            }
            if (res.data.hasOwnProperty('hiddenFields')) {
              if (Array.isArray(res.data.hiddenFields)) {
                this.hiddenFields = res.data.hiddenFields;
              }
            }
            if (res.data.hasOwnProperty('states')) {
              if (Array.isArray(res.data.states)) {
                this.states = res.data.states;
              }
            }
            if (res.data.hasOwnProperty('electionTypes')) {
              if (Array.isArray(res.data.electionTypes)) {
                this.electionTypes = res.data.electionTypes;
              }
            }

            if (res.data.hasOwnProperty('committeeTypeEvents')) {
              if (Array.isArray(res.data.committeeTypeEvents)) {
                const committeeTypeEvents = res.data.committeeTypeEvents;
                if (this._cmteTypeCategory) {
                  for (const committeeTypeEvent of committeeTypeEvents) {
                    if (this._cmteTypeCategory === committeeTypeEvent.committeeTypeCategory) {
                      this.activityEventTypes = committeeTypeEvent.eventTypes;
                    }

                    if ((this.transactionType === 'ALLOC_FEA_DISB' ||
                      this.transactionType === 'ALLOC_FEA_CC_PAY' ||
                      this.transactionType === 'ALLOC_FEA_CC_PAY_MEMO' ||
                      this.transactionType === 'ALLOC_FEA_STAF_REIM' ||
                      this.transactionType === 'ALLOC_FEA_STAF_REIM_MEMO' ||
                      this.transactionType == 'ALLOC_FEA_VOID') &&
                      'H6' === committeeTypeEvent.committeeTypeCategory) {
                      this.activityEventTypes = committeeTypeEvent.eventTypes;
                    }
                  }
                }
              }
            }

            if (res.data.hasOwnProperty('titles')) {
              if (Array.isArray(res.data.titles)) {
                this.titles = res.data.titles;
              }
            }
            if (res.data.hasOwnProperty('entityTypes')) {
              // TODO entityTypes are not returned by dynamic forms API for some.
              // If propery exists but is null use hard coded default until API returns.
              if (!res.data.entityTypes) {
                res.data.entityTypes = entityTypes;
              }
              if (Array.isArray(res.data.entityTypes)) {
                this.entityTypes = res.data.entityTypes;
                if (this.entityTypes) {
                  for (const field of this.entityTypes) {
                    // If API sets selected to true it can be used to set the default.
                    // If none are set, use the first.
                    // If none are set, default to first.
                    if (field.selected) {
                      this.selectedEntityType = field;
                    }
                  }
                  if (!this.selectedEntityType) {
                    if (this.entityTypes.length > 0) {
                      this.selectedEntityType = this.entityTypes[0];
                    }
                  }
                }
                // expecting default entity type to be IND
                this.toggleValidationIndOrg(this.selectedEntityType.entityType);
                this._entityTypeDefault = this.selectedEntityType;
                this.frmIndividualReceipt.patchValue(
                  { entity_type: this.selectedEntityType.entityType },
                  { onlySelf: true }
                );
              }
            }
            if (res.data.hasOwnProperty('subTransactions')) {
              if (Array.isArray(res.data.subTransactions)) {
                if (res.data.subTransactions.length > 0) {
                  this.subTransactionInfo = res.data.subTransactions[0];
                  if (res.data.subTransactions.length > 1) {
                    // Fix an issue where previous transaction type is passed.
                    for (const hiddenField of this.hiddenFields) {
                      if ('transaction_type_identifier' === hiddenField.name) {
                        if ((hiddenField.value = this.transactionType)) {
                          this.multipleSubTransactionInfo = res.data.subTransactions;
                        }
                      }
                    }
                  }
                }
              }
            }
          } // typeof res.data
        } // res.hasOwnProperty('data')
      } // res
      this._prePopulateFormField(this._prePopulateFieldArray);
      this._prePopulateFieldArray = null;

      let apiCall: string = this._findHiddenField('name', 'api_call');
      apiCall = apiCall ? apiCall : '';

      let schedDSubTran = false;
      if (this.subTransactionInfo) {
        if (this.subTransactionInfo.scheduleType === 'sched_d' && this.subTransactionInfo.isParent === false) {
          schedDSubTran = true;
        }
      }

      // If Data for sched D sub-tran has been received by the message service,
      // pre-populate the formGroup now that the dynamic form API call is complete.
      if (
        this._prePopulateFromSchedDData &&
        schedDSubTran &&
        this.scheduleAction === ScheduleActions.addSubTransaction
      ) {
        this._prePopulateFromSchedD(this._prePopulateFromSchedDData);
        this._prePopulateFromSchedDData = null;
      }
    });
  }

  /**
   * Toggle fields in the form depending on entity type.
   */
  public handleEntityTypeChange(item: any) {
    // Set the selectedEntityType for the toggle method to check.
    for (const entityTypeObj of this.entityTypes) {
      if (entityTypeObj.entityType === item.entityType) {
        entityTypeObj.selected = true;
        this.selectedEntityType = entityTypeObj;
      } else {
        entityTypeObj.selected = false;
      }
    }

    if (item) {
      this.toggleValidationIndOrg(item.group);
    }
  }

  /**
   * Sched D Debt Payments (Sub-transactions) will be auto-populated with
   * fields from the main Sched D.
   *
   * @param schedDData
   */
  protected _prePopulateFromSchedD(schedDData: any) {
    let fieldArray = [];
    if (schedDData.hasOwnProperty('entity_type')) {
      const entityType = schedDData.entity_type;
      if (!entityType) {
        return;
      }
      if (typeof entityType !== 'string') {
        return;
      }

      this._prePopulateFormFieldHelper(schedDData, 'entity_type', fieldArray);
      if (entityType === 'ORG') {
        fieldArray = this._prePopulateFormFieldHelper(schedDData, 'entity_name', fieldArray);
      } else if (entityType === 'IND') {
        fieldArray = this._prePopulateFormFieldHelper(schedDData, 'last_name', fieldArray);
        fieldArray = this._prePopulateFormFieldHelper(schedDData, 'first_name', fieldArray);
        fieldArray = this._prePopulateFormFieldHelper(schedDData, 'middle_name', fieldArray);
        fieldArray = this._prePopulateFormFieldHelper(schedDData, 'prefix', fieldArray);
        fieldArray = this._prePopulateFormFieldHelper(schedDData, 'suffix', fieldArray);
      } else {
        // invalid type
      }
      fieldArray = this._prePopulateFormFieldHelper(schedDData, 'street_1', fieldArray);
      fieldArray = this._prePopulateFormFieldHelper(schedDData, 'street_2', fieldArray);
      fieldArray = this._prePopulateFormFieldHelper(schedDData, 'city', fieldArray);
      fieldArray = this._prePopulateFormFieldHelper(schedDData, 'state', fieldArray);
      fieldArray = this._prePopulateFormFieldHelper(schedDData, 'zip_code', fieldArray);

      if (this.entityTypes) {
        if (Array.isArray(this.entityTypes)) {
          for (const entityTypeObj of this.entityTypes) {
            if (entityTypeObj.entityType === entityType) {
              entityTypeObj.selected = true;
              this.selectedEntityType = entityTypeObj;
            } else {
              entityTypeObj.selected = false;
            }
          }
          this.handleEntityTypeChange(this.selectedEntityType);
        }
      }
    }
    this._prePopulateFormField(fieldArray);
  }

  /**
   * Helper method for pre-populating an array to apply field values to the form.
   *
   * @param data
   * @param fieldName
   * @param fieldArray
   */
  private _prePopulateFormFieldHelper(data: any, fieldName: string, fieldArray: Array<any>) {
    if (!fieldArray || !fieldName || !data) {
      return;
    }
    if (!Array.isArray(fieldArray)) {
      fieldArray = [];
    }
    if (data.hasOwnProperty(fieldName)) {
      fieldArray.push({ name: fieldName, value: data[fieldName] });
    }
    return fieldArray;
  }

  /**
   * Pre-populate form fields with values from the pre-populate array.
   *
   * @param fieldArray an array of field names and values
   */
  private _prePopulateFormField(fieldArray: Array<any>) {
    if (!fieldArray) {
      return;
    }
    if (!Array.isArray(fieldArray)) {
      return;
    }
    for (const field of fieldArray) {
      if (field.hasOwnProperty('name') && field.hasOwnProperty('value')) {
        if (this.frmIndividualReceipt.get(field.name)) {
          const patch = {};
          patch[field.name] = field.value;
          this.frmIndividualReceipt.patchValue(patch, { onlySelf: true });
        }
      }
    }
  }

  private _prePopulateFormForEditOrView(transactionDetail: any) {
    if (transactionDetail) {
      // The action on the message is the same as the this.scheduleAction from parent.
      // using the field from the message in case there is a race condition with Input().
      // If not provided, default to edit.
      if (transactionDetail.action) {
        if (transactionDetail.action in ScheduleActions) {
          this.scheduleAction = transactionDetail.action;
        } else {
          this.scheduleAction = ScheduleActions.edit;
        }
      }
      if (transactionDetail.transactionModel) {
        const formData: TransactionModel = transactionDetail.transactionModel;

        // TODO this data will come from the API not the transaction table
        // may need to set it after API for race condition problem when come from Reports.
        // For now it is sufficient just to set it with the transactionId.
        this._transactionToEdit = formData;

        // TODO property names are not the same in TransactionModel
        // as they are when the selectedEntity is populated from
        // the auto-lookup / core/autolookup_search_contacts API.
        // Mapping may need to be added here.  See transactions service
        // mapToServerFields(model: TransactionModel) as it may
        // be used or cloned to a mapping method in the contact.service.

        // TODO need to get the entity from the look up service using entity_id
        // this._selectedEntity = formData;
        this._selectedChangeWarn = {};

        // TODO need to handle child data once passed
        // this._selectedEntityChild = editOrView.childTransactionModel ? editOrView.childTransactionModel : null;
        this._selectedChangeWarnChild = {};

        // TODO need to handle candidate from child form once data is passed.
        // this._selectedCandidate = null; Do we need the actual data set or just boolean if there is data
        // For edit we can always show warning so we might not need to set the selectedAutolookup warn fields
        this._selectedCandidateChangeWarn = {};
        // this._selectedCandidateChild = null;
        this._selectedCandidateChangeWarnChild = {};

        // this.transactionType = formData.transactionTypeIdentifier;
        this._setFormDataValues(formData.transactionId, formData.apiCall);
      }
    }
  }

  /**
   * Set the values from the API in the form.
   *
   * @param transactionId
   */
  private _setFormDataValues(transactionId: string, apiCall: string) {
    const reportId = this._receiptService.getReportIdFromStorage(this.formType);
    this.subTransactions = [];
    this._receiptService.getDataSchedule(reportId, transactionId, apiCall).subscribe(res => {
      if (Array.isArray(res)) {
        for (const trx of res) {
          if (trx.hasOwnProperty('transaction_id')) {
            if (trx.transaction_id === transactionId) {
              if (trx.hasOwnProperty('child')) {
                if (Array.isArray(trx.child)) {
                  if (trx.child.length > 0) {
                    this._parentTransactionModel = this._transactionsService.mapFromServerSchedFields([trx])[0];
                    this.subTransactions = trx.child;
                    if (this.subTransactionInfo) {
                      this.subTransactionsTableType = this.subTransactionInfo.scheduleType;
                    }
                    for (const subTrx of this.subTransactions) {
                      console.log('sub tran id ' + subTrx.transaction_id);
                    }
                  }
                }
              } else {
                if (trx.hasOwnProperty('back_ref_transaction_id')) {
                  if (trx.back_ref_transaction_id) {
                    this._getParentFromChild(reportId, trx.back_ref_transaction_id, apiCall);
                  }
                }
              }
              for (const prop in trx) {
                if (trx.hasOwnProperty(prop)) {
                  // add to hidden fields
                  for (const hiddenField of this.hiddenFields) {
                    if (prop === hiddenField.name) {
                      hiddenField.value = trx[prop];
                    }
                  }
                  if (this.frmIndividualReceipt) {
                    if (this.frmIndividualReceipt.get(prop)) {
                      if (this.frmIndividualReceipt.get(prop)) {
                        if (this.isFieldName(prop, 'contribution_aggregate')) {
                          this._contributionAggregateValue = trx[prop];
                        }
                        if (this.isFieldName(prop, 'activity_event_type')) {
                          if (trx[prop] !== null || trx[prop] !== 'Select') {
                            this.totalAmountReadOnly = false;
                            if (this.activityEventTypes) {
                              for (const activityEvent of this.activityEventTypes) {
                                if (trx[prop] === activityEvent.eventType) {
                                  if (activityEvent.scheduleType === 'sched_h2' && activityEvent.hasValue === true) {
                                    this.activityEventNames = activityEvent.activityEventTypes;
                                  }
                                }
                              }
                            }
                          }
                        }
                        if (this.isFieldName(prop, 'memo_code')) {
                          const memoCodeValue = trx[prop];
                          if (memoCodeValue === this._memoCodeValue) {
                            const isChildField = prop.startsWith(this._childFieldNamePrefix) ? true : false;
                            if (isChildField) {
                              this.memoCodeChild = true;
                            } else {
                              this.memoCode = true;
                            }
                          }
                        }
                        if (this.isFieldName(prop, 'purpose_description')) {
                          const preTextHiddenField = this._findHiddenField('name', 'pretext');
                          let preText = '';
                          if (preTextHiddenField) {
                            preText = preTextHiddenField.value ? preTextHiddenField.value : '';
                          }
                          if (preText) {
                            // remove it from the input field.  It will be readded on save.
                            if (trx[prop]) {
                              if (typeof trx[prop] === 'string') {
                                if (trx[prop].startsWith(preText)) {
                                  trx[prop] = trx[prop].replace(preText, '');
                                }
                              }
                            }
                          }
                        }
                        const patch = {};
                        patch[prop] = trx[prop];
                        this.frmIndividualReceipt.patchValue(patch, { onlySelf: true });
                      }
                    }
                  }
                  if (prop === 'entity_id') {
                    this._selectedEntity = {};
                    this._selectedEntity.entity_id = trx[prop];
                  }
                  if (prop === 'beneficiary_cand_entity_id') {
                    this._selectedCandidate = {};
                    this._selectedCandidate.entity_id = trx[prop];
                  }
                  if (prop === 'entity_type') {
                    if (this.entityTypes) {
                      for (const field of this.entityTypes) {
                        field.selected = false;
                        if (trx[prop] === field.entityType) {
                          field.selected = true;
                          this.selectedEntityType = field;
                          this.frmIndividualReceipt.patchValue({ entity_type: this.selectedEntityType.entityType }, { onlySelf: true });
                          this.toggleValidationIndOrg(trx[prop]);
                          break;
                        }
                      }
                    }
                  }
                  if (prop === this._childFieldNamePrefix + 'entity_id') {
                    this._selectedEntityChild = {};
                    this._selectedEntityChild.entity_id = trx[prop];
                  }
                  // TODO add for _selectedCandidate
                }
              }
              // loop through props again now that aggregate should be set
              // and apply contributionAmountChange() formatting, setting, etc.
              for (const prop in trx) {
                if (trx.hasOwnProperty(prop)) {
                  if (this.isFieldName(prop, 'contribution_amount') || this.isFieldName(prop, 'expenditure_amount')) {
                    const amount = trx[prop] ? trx[prop] : 0;
                    this.contributionAmountChange({ target: { value: amount.toString() } }, prop, false);
                  } else if (
                    this.isFieldName(prop, 'total_amount') ||
                    this.isFieldName(prop, 'beginning_balance') ||
                    this.isFieldName(prop, 'incurred_amount') ||
                    this.isFieldName(prop, 'payment_amount') ||
                    this.isFieldName(prop, 'balance_at_close') ||
                    this.isFieldName(prop, 'fed_share_amount') ||
                    this.isFieldName(prop, 'non_fed_share_amount') ||
                    this.isFieldName(prop, 'activity_event_amount_ytd')
                  ) {
                    const amount = trx[prop] ? trx[prop] : 0;
                    this._formatAmount({ target: { value: amount.toString() } }, prop, false);
                  }
                }
              }
              this._validateTransactionDate();
              this._calculateDebtAmountFields(trx);
            }
          }
        }
        //move the payment button into view if flag is set.
        if (this._transactionToEdit && this._transactionToEdit.scrollDebtPaymentButtonIntoView) {
          let button = document.getElementById("jfMemoDropdown");
          button.scrollIntoView();
        }
      }
    });
  }

  private _calculateDebtAmountFields(trx: any) {
    if (trx.transaction_type_identifier !== 'DEBT_TO_VENDOR' &&
        trx.transaction_type_identifier !== 'DEBT_BY_VENDOR') {
      return;
    }

    // TODO this should come from the API
    let paymentAmount = 0.0;
    for (const subTrx of this.subTransactions) {
      if (subTrx.hasOwnProperty('expenditure_amount')) {
        if (subTrx.expenditure_amount) {
          paymentAmount = paymentAmount + subTrx.expenditure_amount;
        }
      } else if (subTrx.hasOwnProperty('contribution_amount')) {
        if (subTrx.contribution_amount) {
          paymentAmount = paymentAmount + subTrx.contribution_amount;
        }
      } else if (subTrx.hasOwnProperty('total_amount')) {
        if (subTrx.total_amount) {
          paymentAmount = paymentAmount + subTrx.total_amount;
        }
      } else if (subTrx.hasOwnProperty('total_fed_levin_amount')) {
        if (subTrx.total_fed_levin_amount) {
          paymentAmount = paymentAmount + subTrx.total_fed_levin_amount;
        }
      }
    }
    this._formatAmount({ target: { value: paymentAmount.toString() } }, 'payment_amount', false);

    // Beginning balance + Incurred amount - Payment Amount = Balance at close
    let incurredAmount = 0;
    if (trx.hasOwnProperty('incurred_amount')) {
      if (trx.incurred_amount) {
        incurredAmount = trx.incurred_amount;
      }
    }
    const balanceAtClose = trx.beginning_balance + incurredAmount - paymentAmount;
    this._formatAmount({ target: { value: balanceAtClose.toString() } }, 'balance_at_close', false);
  }

  /**
   * When a child transaction is selected for editing from the main table as opposed to editing
   * from the parent sub-transaction table, the parent information needs to be obtained from the
   * API.  It is need for returning to the parent from the child.
   * @param reportId
   * @param backRefTransactionId
   * @param apiCall
   */
  private _getParentFromChild(reportId: string, backRefTransactionId: string, apiCall: string) {
    // There is a bug the apiCall value is incorrect when where a parent-child have different schedules
    // as with Sched_D.  Temporary path is to hard code the apiCall based on the trnasactionID 1st to chars.
    // TODO add back_ref_api_call to child transaction in the getSched API and pass it here.
    if (backRefTransactionId.startsWith('SD')) {
      apiCall = '/sd/schedD';
    }

    this._receiptService.getDataSchedule(reportId, backRefTransactionId, apiCall).subscribe(res => {
      if (Array.isArray(res)) {
        for (const trx of res) {
          if (trx.hasOwnProperty('transaction_id')) {
            if (trx.transaction_id === backRefTransactionId) {
              const modelArray = this._transactionsService.mapFromServerSchedFields([trx]);
              if (modelArray) {
                if (modelArray.length > 0) {
                  this._parentTransactionModel = modelArray[0];
                }
              }
            }
          }
        }
      }
    });
  }

  /**
   * Determine if the child transactions should be shown.
   */
  public isShowChildTransactions(): boolean {
    if (this.subTransactionInfo) {
      if (this.subTransactionInfo.isEarmark) {
        return false;
      }
    }
    if (this._isParentOfSub()) {
      if (this.subTransactions) {
        if (this.subTransactions.length > 0) {
          return true;
        }
      }
    }
    return false;
  }

  /**
   * Returns true if the transaction type is a parent of
   * a parent/ sub-transaction relationship.  It will return false for
   *  1) transaction types that are sub-transactions of a parent
   *  2) transaction types that have NO parent / sub-transaction relationship
   */
  private _isParentOfSub(): boolean {
    if (this.subTransactionInfo) {
      if (this.subTransactionInfo.isParent === true) {
        return true;
      }
    }
    return false;
  }

  /**
   * Returns true if the transaction type is a sub-transaction of
   * a parent/ sub-transaction relationship.  It will return false for
   *  1) transaction types that are parents of a parent / sub-transaction relationship
   *  2) transaction types that have NO parent / sub-transaction relationship
   */
  private _isSubOfParent(): boolean {
    if (this.subTransactionInfo) {
      if (this.subTransactionInfo.isParent === false) {
        return true;
      }
    }
    return false;
  }

  public isEarmark(): boolean {
    if (this.subTransactionInfo) {
      if (this.subTransactionInfo.isEarmark) {
        return true;
      }
    }
    return false;
  }

  /**
   * Determine if the field should be shown.
   */
  public isToggleShow(col: any) {
    if (col.name === 'activity_event_identifier') {
      if (this.activityEventNames) {
        return true;
      } else {
        return false;
      }
    } else {
      if (!this.selectedEntityType) {
        return true;
      }
      if (!col.toggle) {
        return true;
      }
      if (this.selectedEntityType.group === col.entityGroup || !col.entityGroup) {
        return true;
      } else {
        return false;
      }
    }
  }

  public showHideEntityType(entityTypeGroup: string) { }

  // public isMemoCodeReadOnly(fieldName: string) {
  //   if (this.isFieldName(fieldName, 'memo_code')) {
  //     const isChildField = fieldName.startsWith(this._childFieldNamePrefix) ? true : false;
  //     if (isChildField) {
  //       return this._readOnlyMemoCodeChild;
  //     } else {
  //       return this._readOnlyMemoCode;
  //     }
  //   }
  //   return false;
  // }

  public clearFormValues(): void {
    this._transactionToEdit = null;

    this._selectedEntity = null;
    this._selectedEntityChild = null;
    this._selectedChangeWarn = {};
    this._selectedChangeWarnChild = {};

    this._selectedCandidate = null;
    this._selectedCandidateChangeWarn = null;
    this._selectedCandidateChild = null;
    this._selectedCandidateChangeWarnChild = null;

    this._contributionAggregateValue = 0.0;
    this._contributionAggregateValueChild = 0.0;
    this.memoCode = false;
    this.memoCodeChild = false;
    this._readOnlyMemoCode = false;
    this._readOnlyMemoCodeChild = false;
    if (this.frmIndividualReceipt) {
      this.frmIndividualReceipt.reset();
    }
    if (this.frmIndividualReceipt && this.frmIndividualReceipt.contains('entity_type')) {
      this.selectedEntityType = this._entityTypeDefault;
      this.frmIndividualReceipt.patchValue({ entity_type: this.selectedEntityType.entityType }, { onlySelf: true });
    }
    this.memoDropdownSize = null;
    this.activityEventNames = null;
  }

  private toggleValidationIndOrg(entityType: string) {
    if (entityType === 'ORG' || entityType === 'org-group') {
      if (this.frmIndividualReceipt.controls['last_name']) {
        this.frmIndividualReceipt.controls['last_name'].setValidators([Validators.nullValidator]);
        this.frmIndividualReceipt.controls['last_name'].updateValueAndValidity();
      }
      if (this.frmIndividualReceipt.controls['first_name']) {
        this.frmIndividualReceipt.controls['first_name'].setValidators([Validators.nullValidator]);
        this.frmIndividualReceipt.controls['first_name'].updateValueAndValidity();
      }
      if (this.frmIndividualReceipt.controls['entity_name']) {
        this.frmIndividualReceipt.controls['entity_name'].setValidators([Validators.required]);
        this.frmIndividualReceipt.controls['entity_name'].updateValueAndValidity();
      }
    } else {
      if (this.frmIndividualReceipt.controls['last_name']) {
        this.frmIndividualReceipt.controls['last_name'].setValidators([Validators.required]);
        this.frmIndividualReceipt.controls['last_name'].updateValueAndValidity();
      }
      if (this.frmIndividualReceipt.controls['first_name']) {
        this.frmIndividualReceipt.controls['first_name'].setValidators([Validators.required]);
        this.frmIndividualReceipt.controls['first_name'].updateValueAndValidity();
      }
      if (this.frmIndividualReceipt.controls['entity_name']) {
        this.frmIndividualReceipt.controls['entity_name'].setValidators([Validators.nullValidator]);
        this.frmIndividualReceipt.controls['entity_name'].updateValueAndValidity();
      }
    }
  }

  /**
   * Auto populate parent purpose with child names fields or child purpose
   * with parent name fields
   */
  public populatePurpose(fieldName: string) {
    if (
      !this.subTransactionInfo.isEarmark && !this.subTransactionInfo.isParent
      // this.transactionType !== 'EAR_REC' &&
      // this.transactionType !== 'CON_EAR_UNDEP' &&
      // this.transactionType !== 'CON_EAR_DEP_1'
      &&
      this.transactionType !== 'ALLOC_EXP' &&
      this.transactionType !== 'ALLOC_EXP_CC_PAY' &&
      this.transactionType !== 'ALLOC_EXP_CC_PAY_MEMO' &&
      this.transactionType !== 'ALLOC_EXP_STAF_REIM' &&
      this.transactionType !== 'ALLOC_EXP_STAF_REIM_MEMO' &&
      this.transactionType !== 'ALLOC_EXP_PMT_TO_PROL' &&
      this.transactionType !== 'ALLOC_EXP_PMT_TO_PROL_MEMO' &&
      this.transactionType !== 'ALLOC_EXP_VOID'
      &&
      this.transactionType !== 'ALLOC_FEA_DISB' &&
      this.transactionType !== 'ALLOC_FEA_CC_PAY' &&
      this.transactionType !== 'ALLOC_FEA_CC_PAY_MEMO' &&
      this.transactionType !== 'ALLOC_FEA_STAF_REIM' &&
      this.transactionType !== 'ALLOC_FEA_STAF_REIM_MEMO' &&
      this.transactionType !== 'ALLOC_FEA_VOID'
    ) {
      return;
    }
    const isChildField = fieldName.startsWith(this._childFieldNamePrefix) ? true : false;
    if (isChildField) {
      if (!this.frmIndividualReceipt.get('child*purpose_description')) {
        return;
      }
    } else {
      if (!this.frmIndividualReceipt.get('purpose_description')) {
        return;
      }
    }
    const candPrefix = 'cand_';
    if (isChildField) {
      // populate parent purpose with child candidate fields
      const childPrefix = this._childFieldNamePrefix + candPrefix;
      let lastName = '';
      // type ahead fields need to be checked for objects
      if (this.frmIndividualReceipt.contains(childPrefix + 'last_name')) {
        const lastNameObject = this.frmIndividualReceipt.get(childPrefix + 'last_name').value;

        if (lastNameObject && typeof lastNameObject !== 'string') {
          // it's an object as a result of the ngb-typeahead
          lastName = lastNameObject[candPrefix + 'last_name'];
        } else {
          lastName = lastNameObject;
          lastName = lastName && typeof lastName === 'string' ? lastName.trim() : '';
        }
      }

      let firstName = '';
      if (this.frmIndividualReceipt.contains(childPrefix + 'first_name')) {
        const firstNameObject = this.frmIndividualReceipt.get(childPrefix + 'first_name').value;

        if (firstNameObject && typeof firstNameObject !== 'string') {
          // it's an object as a result of the ngb-typeahead
          firstName = firstNameObject[candPrefix + 'first_name'];
        } else {
          firstName = firstNameObject;
          firstName = firstName && typeof firstName === 'string' ? firstName.trim() : '';
        }
      }

      let prefix = '';
      if (this.frmIndividualReceipt.contains(childPrefix + 'prefix')) {
        prefix = this.frmIndividualReceipt.get(childPrefix + 'prefix').value;
        prefix = prefix && typeof prefix === 'string' ? prefix.trim() : '';
      }
      let middleName = '';
      if (this.frmIndividualReceipt.contains(childPrefix + 'middle_name')) {
        middleName = this.frmIndividualReceipt.get(childPrefix + 'middle_name').value;
        middleName = middleName && typeof middleName === 'string' ? middleName.trim() : '';
      }
      let suffix = '';
      if (this.frmIndividualReceipt.contains(childPrefix + 'suffix')) {
        suffix = this.frmIndividualReceipt.get(childPrefix + 'suffix').value;
        suffix = suffix && typeof suffix === 'string' ? suffix.trim() : '';
      }

      const purposePre = 'Earmarked for';
      let purpose = purposePre;
      const nameArray = [];
      if (prefix) {
        nameArray.push(prefix);
      }
      if (firstName) {
        nameArray.push(firstName);
      }
      if (middleName) {
        nameArray.push(middleName);
      }
      if (lastName) {
        nameArray.push(lastName);
      }
      if (suffix) {
        nameArray.push(suffix);
      }
      for (const field of nameArray) {
        purpose += ' ' + field;
      }

      console.log('purpose is: ' + purpose);
      if (purpose !== purposePre) {
        this.frmIndividualReceipt.patchValue({ 'child*purpose_description': purpose }, { onlySelf: true });
      }
    } else {
      let lastName = '';
      // type ahead fields need to be checked for objects
      if (this.frmIndividualReceipt.contains('last_name')) {
        const lastNameObject = this.frmIndividualReceipt.get('last_name').value;

        if (lastNameObject && typeof lastNameObject !== 'string') {
          // it's an object as a result of the ngb-typeahead
          lastName = lastNameObject.last_name;
        } else {
          lastName = lastNameObject;
          lastName = lastName && typeof lastName === 'string' ? lastName.trim() : '';
        }
      }

      let firstName = '';
      if (this.frmIndividualReceipt.contains('first_name')) {
        const firstNameObject = this.frmIndividualReceipt.get('first_name').value;

        if (firstNameObject && typeof firstNameObject !== 'string') {
          // it's an object as a result of the ngb-typeahead
          firstName = firstNameObject.first_name;
        } else {
          firstName = firstNameObject;
          firstName = firstName && typeof firstName === 'string' ? firstName.trim() : '';
        }
      }

      let prefix = '';
      if (this.frmIndividualReceipt.contains('prefix')) {
        prefix = this.frmIndividualReceipt.get('prefix').value;
        prefix = prefix && typeof prefix === 'string' ? prefix.trim() : '';
      }
      let middleName = '';
      if (this.frmIndividualReceipt.contains('middle_name')) {
        middleName = this.frmIndividualReceipt.get('middle_name').value;
        middleName = middleName && typeof middleName === 'string' ? middleName.trim() : '';
      }
      let suffix = '';
      if (this.frmIndividualReceipt.contains('suffix')) {
        suffix = this.frmIndividualReceipt.get('suffix').value;
        suffix = suffix && typeof suffix === 'string' ? suffix.trim() : '';
      }

      const purposePre = 'Earmarked for';
      let purpose = purposePre;
      const nameArray = [];
      if (prefix) {
        nameArray.push(prefix);
      }
      if (firstName) {
        nameArray.push(firstName);
      }
      if (middleName) {
        nameArray.push(middleName);
      }
      if (lastName) {
        nameArray.push(lastName);
      }
      if (suffix) {
        nameArray.push(suffix);
      }
      for (const field of nameArray) {
        purpose += ' ' + field;
      }

      console.log('purpose is: ' + purpose);
      if (purpose !== purposePre) {
        this.frmIndividualReceipt.patchValue({ purpose_description: purpose }, { onlySelf: true });
      }
    }
  }

  private _convertFormattedAmountToDecimal(formatedAmount: string): number {
    if (!formatedAmount) {
      if (this.frmIndividualReceipt.get('expenditure_amount')) {
        formatedAmount = this.frmIndividualReceipt.get('expenditure_amount').value;
      } else {
        formatedAmount = this.frmIndividualReceipt.get('contribution_amount').value;
      }
    }
    if (typeof formatedAmount === 'string') {
      // remove commas
      formatedAmount = formatedAmount.replace(/,/g, ``);
      return parseFloat(formatedAmount);
    } else {
      return formatedAmount;
    }
  }

  private _getContributionAggregate(contribDate: string, entityId: number, cmteId: string) {
    const reportId = this._receiptService.getReportIdFromStorage(this.formType);
    this._receiptService
      .getContributionAggregate(reportId, entityId, cmteId, this.transactionType, contribDate)
      .subscribe(res => {
        const contributionAmountNum = this._convertFormattedAmountToDecimal(null);

        let contributionAggregate: string = String(res.contribution_aggregate);
        contributionAggregate = contributionAggregate ? contributionAggregate : '0';
        this._contributionAggregateValue = parseFloat(contributionAggregate);

        let transactionDate = null;
        if (this.frmIndividualReceipt.get('contribution_date')) {
          transactionDate = this.frmIndividualReceipt.get('contribution_date').value;
        }
        const aggregateValue: string = this._receiptService.determineAggregate(
          this._contributionAggregateValue,
          contributionAmountNum,
          this.scheduleAction,
          this.memoCode,
          this._selectedEntity,
          this._transactionToEdit,
          this.transactionType,
          this._isSubOfParent(),
          transactionDate
        );

        this.frmIndividualReceipt.patchValue({ contribution_aggregate: aggregateValue }, { onlySelf: true });
      });
  }

  /**
   * Get the aggregate for Schedule F Debt Payment.  It is similar to _getContributionAggregate().
   * @param candidateId the Candidate ID 
   * @param expenditureDate the date of the expenditure from the form
   * @param candidateEntityId the Entity ID for the Candidate
   * @param expenditureAmount the expenditure amount from the form
   */
  private _getSchedFDebtPaymentAggregate(
    candidateId: number,
    expenditureDate: string,
    candidateEntityId: string,
    expenditureAmount?: string) {

    if (!candidateId || !expenditureDate) {
      return;
    }

    this._receiptService
      .getSchedFPaymentAggregate(candidateId, expenditureDate)
      .subscribe(res => {
        const contributionAmountNum = this._convertFormattedAmountToDecimal(null);

        let contributionAggregate: string = String(res.aggregate_general_elec_exp);
        contributionAggregate = contributionAggregate ? contributionAggregate : '0';
        this._contributionAggregateValue = parseFloat(contributionAggregate);

        let transactionDate = null;
        if (this.frmIndividualReceipt.get('expenditure_date')) {
          transactionDate = this.frmIndividualReceipt.get('expenditure_date').value;
        }

        // Sched F Payment uses Candidate Entity ID for aggregate calc.
        // Pass it in the Entity ID of the Transaction Model.
        // Clone used to not adversely impact processing on this._transactionToEdit
        let transactionToEditClone = null;
        if (this._transactionToEdit && this.scheduleAction === ScheduleActions.edit) {
          transactionToEditClone = this._utilService.deepClone(this._transactionToEdit);
          transactionToEditClone.entityId = candidateEntityId;
        }

        const aggregateValue: string = this._receiptService.determineAggregate(
          this._contributionAggregateValue,
          contributionAmountNum,
          this.scheduleAction,
          this.memoCode,
          this._selectedCandidate,
          transactionToEditClone,
          this.transactionType,
          this._isSubOfParent(),
          transactionDate
        );

        this.frmIndividualReceipt.patchValue({ aggregate_general_elec_exp: aggregateValue }, { onlySelf: true });
      });
  }

  /**
   * Office types may be hard coded as they are never expected to Change for now.
   */
  private _getCandidateOfficeTypes() {
    this._contactsService.getContactsDynamicFormFields().subscribe(res => {
      if (res) {
        console.log('getFormFields res =', res);
        if (res.hasOwnProperty('data')) {
          if (typeof res.data === 'object') {
            if (res.data.hasOwnProperty('officeSought')) {
              if (Array.isArray(res.data.officeSought)) {
                this.candidateOfficeTypes = res.data.officeSought;
              }
            }
          }
        }
      }
    });
  }

  private _setMemoCodeForForm() {
    if (this._readOnlyMemoCode) {
      this.frmIndividualReceipt.controls['memo_code'].setValue(this._memoCodeValue);
      const memoCntrol = this.frmIndividualReceipt.get('memo_code');
      memoCntrol.disable();
      this.memoCode = true;
    }
    if (this._readOnlyMemoCodeChild) {
      this.frmIndividualReceipt.controls[this._childFieldNamePrefix + 'memo_code'].setValue(this._memoCodeValue);
      const memoCntrol = this.frmIndividualReceipt.get(this._childFieldNamePrefix + 'memo_code');
      memoCntrol.disable();
      this.memoCodeChild = true;
    }
  }

  private _isCandidateField(col: any) {
    if (
      this.isFieldName(col.name, 'cand_last_name') ||
      this.isFieldName(col.name, 'cand_first_name') ||
      this.isFieldName(col.name, 'cand_middle_name') ||
      this.isFieldName(col.name, 'cand_prefix') ||
      this.isFieldName(col.name, 'cand_suffix') ||
      this.isFieldName(col.name, 'cand_office') ||
      this.isFieldName(col.name, 'cand_office_district')
    ) {
      return true;
    }
  }

  private _findHiddenField(property: string, value: any) {
    return this.hiddenFields.find((hiddenField: any) => hiddenField[property] === value);
  }

  // private _checkForSchedDPrePopulate(): Array<any> {
  //   const prePopulateFieldArray = null;
  //   if (this.frmIndividualReceipt.contains('entity_type')) {
  //     const entityType = this.frmIndividualReceipt.get('entity_type').value;
  //     if (entityType === 'ORG') {
  //       prePopulateFieldArray.push({ name: 'entity_type', value: entityType });
  //       if (this.frmIndividualReceipt.contains('entity_name')) {
  //         const val = this.frmIndividualReceipt.get('entity_name').value;
  //         prePopulateFieldArray.push({ name: 'entity_name', value: val });
  //       }
  //     } else if (entityType === 'IND') {

  //     } else {
  //       // invalid type
  //     }
  //   }

  //   return prePopulateFieldArray;
  // }

  /**
   * populate the purpose description for child with parent.
   */
  private _checkForEarmarkPurposePrePopulate(res: any): Array<any> {
    let prePopulateFieldArray = null;
    if (this.subTransactionInfo) {
      if (this.subTransactionInfo.isEarmark && this.subTransactionInfo.isParent) {
        let earmarkMemoPurpose = null;

        if (res.hasOwnProperty('entity_type')) {
          if (res.entity_type === 'IND' || res.entity_type === 'CAN') {
            const lastName = res.last_name ? res.last_name.trim() : '';
            const firstName = res.first_name ? res.first_name.trim() : '';
            const middleName = res.middle_name ? res.middle_name.trim() : '';
            const suffix = res.suffix ? res.suffix.trim() : '';
            const prefix = res.prefix ? res.prefix.trim() : '';
            earmarkMemoPurpose = `${lastName}, ${firstName}, ${middleName}, ${prefix}, ${suffix}`;
          } else {
            if (res.hasOwnProperty('entity_name')) {
              earmarkMemoPurpose = res.entity_name;
            }
          }
        }
        prePopulateFieldArray = [];
        if (res.hasOwnProperty('contribution_amount')) {
          const amountValue: string = this._decimalPipe.transform(parseFloat(res.contribution_amount), '.2-2');
          prePopulateFieldArray.push({ name: 'contribution_amount', value: amountValue });
          prePopulateFieldArray.push({ name: 'expenditure_amount', value: amountValue });
        } else if (res.hasOwnProperty('expenditure_amount')) {
          const amountValue: string = this._decimalPipe.transform(parseFloat(res.expenditure_amount), '.2-2');
          prePopulateFieldArray.push({ name: 'contribution_amount', value: amountValue });
          prePopulateFieldArray.push({ name: 'expenditure_amount', value: amountValue });
        }
        prePopulateFieldArray.push({ name: 'purpose_description', value: earmarkMemoPurpose });
        prePopulateFieldArray.push({ name: 'expenditure_purpose', value: earmarkMemoPurpose });
      }
    }
    return prePopulateFieldArray;
  }

  /**
   * Find a Form Field object by name.
   */
  public findFormField(name: string): any {
    if (!name || !this.formFields) {
      return null;
    }
    const fields = this.formFields;
    for (const el of fields) {
      if (el.hasOwnProperty('cols') && el.cols) {
        for (const e of el.cols) {
          if (e.name === name) {
            return e;
          }
        }
      }
    }
    return null;
  }

  public isShedH4OrH6TransactionType(transactionType: string): boolean {

    if (transactionType === 'ALLOC_EXP' ||
      transactionType === 'ALLOC_EXP_CC_PAY' ||
      //transactionType === 'ALLOC_EXP_CC_PAY_MEMO' ||
      transactionType === 'ALLOC_EXP_STAF_REIM' ||
      //transactionType === 'ALLOC_EXP_STAF_REIM_MEMO' ||
      transactionType === 'ALLOC_EXP_PMT_TO_PROL' ||
      //transactionType === 'ALLOC_EXP_PMT_TO_PROL_MEMO' ||
      transactionType === 'ALLOC_EXP_VOID'
      ||
      transactionType === 'ALLOC_FEA_DISB' ||
      transactionType === 'ALLOC_FEA_CC_PAY' ||
      //transactionType === 'ALLOC_FEA_CC_PAY_MEMO' ||
      transactionType === 'ALLOC_FEA_STAF_REIM' ||
      //transactionType === 'ALLOC_FEA_STAF_REIM_MEMO' ||
      transactionType === 'ALLOC_FEA_VOID') {
      return true;
    } else {
      return false
    }
  }

  public goH4OrH6Summary(transactionType: string) {

    if (transactionType === 'ALLOC_EXP' ||
      transactionType === 'ALLOC_EXP_CC_PAY' ||
      transactionType === 'ALLOC_EXP_CC_PAY_MEMO' ||
      transactionType === 'ALLOC_EXP_STAF_REIM' ||
      transactionType === 'ALLOC_EXP_STAF_REIM_MEMO' ||
      transactionType === 'ALLOC_EXP_PMT_TO_PROL' ||
      transactionType === 'ALLOC_EXP_PMT_TO_PROL_MEMO' ||
      transactionType === 'ALLOC_EXP_VOID') {
      const emitObj: any = {
        form: this.frmIndividualReceipt,
        direction: 'next',
        step: 'step_3',
        previousStep: 'step_2',
        transactionType: 'ALLOC_H4_SUM',
        action: ScheduleActions.add,
        transactionTypeText: 'H4 Transaction List'
      };
      this.status.emit(emitObj);
    }

    if (transactionType === 'ALLOC_FEA_DISB' ||
      transactionType === 'ALLOC_FEA_CC_PAY' ||
      transactionType === 'ALLOC_FEA_CC_PAY_MEMO' ||
      transactionType === 'ALLOC_FEA_STAF_REIM' ||
      transactionType === 'ALLOC_FEA_STAF_REIM_MEMO' ||
      transactionType === 'ALLOC_FEA_VOID') {
        const emitObj: any = {
          form: this.frmIndividualReceipt,
          direction: 'next',
          step: 'step_3',
          previousStep: 'step_2',
          transactionType: 'ALLOC_H6_SUM',
          action: ScheduleActions.add,
          transactionTypeText: 'H6 Transaction List'
        };
      this.status.emit(emitObj);
    }
  }
}
