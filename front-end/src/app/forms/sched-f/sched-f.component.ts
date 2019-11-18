import { Component, OnInit, OnDestroy, OnChanges, Output, EventEmitter, Input, SimpleChanges } from '@angular/core';
import { IndividualReceiptComponent } from '../form-3x/individual-receipt/individual-receipt.component';
import { FormBuilder, FormGroup } from '@angular/forms';
import { FormsService } from 'src/app/shared/services/FormsService/forms.service';
import { IndividualReceiptService } from '../form-3x/individual-receipt/individual-receipt.service';
import { ContactsService } from 'src/app/contacts/service/contacts.service';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbTooltipConfig, NgbTypeaheadSelectItemEvent } from '@ng-bootstrap/ng-bootstrap';
import { UtilService } from 'src/app/shared/utils/util.service';
import { CurrencyPipe, DecimalPipe } from '@angular/common';
import { ReportTypeService } from '../form-3x/report-type/report-type.service';
import { TypeaheadService } from 'src/app/shared/partials/typeahead/typeahead.service';
import { DialogService } from 'src/app/shared/services/DialogService/dialog.service';
import { F3xMessageService } from '../form-3x/service/f3x-message.service';
import { TransactionsMessageService } from '../transactions/service/transactions-message.service';
import { ContributionDateValidator } from 'src/app/shared/utils/forms/validation/contribution-date.validator';
import { TransactionsService } from '../transactions/service/transactions.service';
import { HttpClient } from '@angular/common/http';
import { MessageService } from 'src/app/shared/services/MessageService/message.service';
import { ScheduleActions } from '../form-3x/individual-receipt/schedule-actions.enum';
import { AbstractSchedule } from '../form-3x/individual-receipt/abstract-schedule';
import { ReportsService } from 'src/app/reports/service/report.service';
import { TransactionModel } from '../transactions/model/transaction.model';
import { AbstractScheduleParentEnum } from '../form-3x/individual-receipt/abstract-schedule-parent.enum';
import { schedFstaticFormFields } from './static-form-fields.json';

/**
 * Schedule F is a sub-transaction of Schedule D.
 */
@Component({
  selector: 'app-sched-f',
  templateUrl: './sched-f.component.html',
  styleUrls: ['./sched-f.component.scss'],
  providers: [NgbTooltipConfig, CurrencyPipe, DecimalPipe]
})
export class SchedFComponent extends AbstractSchedule implements OnInit, OnDestroy, OnChanges {
  @Input() formType: string;
  @Input() transactionTypeText: string;
  @Input() transactionType: string;
  @Input() scheduleAction: ScheduleActions;
  @Input() forceChangeDetection: Date;
  @Output() status: EventEmitter<any>;

  public showPart2: boolean;
  public loaded = false;

  protected staticFormFields = schedFstaticFormFields;

  constructor(
    _http: HttpClient,
    _fb: FormBuilder,
    _formService: FormsService,
    _receiptService: IndividualReceiptService,
    _contactsService: ContactsService,
    _activatedRoute: ActivatedRoute,
    _config: NgbTooltipConfig,
    _router: Router,
    _utilService: UtilService,
    _messageService: MessageService,
    _currencyPipe: CurrencyPipe,
    _decimalPipe: DecimalPipe,
    _reportTypeService: ReportTypeService,
    _typeaheadService: TypeaheadService,
    _dialogService: DialogService,
    _f3xMessageService: F3xMessageService,
    _transactionsMessageService: TransactionsMessageService,
    _contributionDateValidator: ContributionDateValidator,
    _transactionsService: TransactionsService,
    _reportsService: ReportsService
  ) {
    super(
      _http,
      _fb,
      _formService,
      _receiptService,
      _contactsService,
      _activatedRoute,
      _config,
      _router,
      _utilService,
      _messageService,
      _currencyPipe,
      _decimalPipe,
      _reportTypeService,
      _typeaheadService,
      _dialogService,
      _f3xMessageService,
      _transactionsMessageService,
      _contributionDateValidator,
      _transactionsService,
      _reportsService
    );
  }

  public ngOnInit() {
    this.frmIndividualReceipt = this._fb.group({});
    this.formFieldsPrePopulated = true;
    this.abstractScheduleComponent = AbstractScheduleParentEnum.schedFComponent;
    this.transactionType = 'COEXP_PARTY_DEBT';
    this.transactionTypeText = 'Coordinated Party Expenditure Debt to Vendor';
    super.ngOnInit();
    this.showPart2 = false;
    this._setTransactionDetail();

    // temp code - waiting until dynamic forms completes and loads the formGroup
    // before rendering the static fields, otherwise validation error styling
    // is not working (input-error-field class).  If dynamic forms deliver
    // the static fields, then remove this or set a flag when formGroup is ready
    super.ngOnChanges(null);
    setTimeout(() => {
      this.loaded = true;
    }, 2000);
  }

  public ngOnChanges(changes: SimpleChanges) {
    this.showPart2 = false;
    this._setTransactionDetail();

    if (this._prePopulateFromSchedDData && this.scheduleAction === ScheduleActions.addSubTransaction) {
      this._prePopulateFromSchedD(this._prePopulateFromSchedDData);
      this._prePopulateFromSchedDData = null;
    }
  }

  public ngOnDestroy(): void {
    super.ngOnDestroy();
  }

  public saveAndReturnToParentDebt() {
    if (!this.frmIndividualReceipt.dirty) {
      this._setTransactionDetail();
    }
    this.saveAndReturnToParent();
  }

  public next() {
    // TODO add this in once the form fields are displaying red when in error.
    // check all page 1 for valid

    this.frmIndividualReceipt.markAsTouched();

    if (!this._checkFormFieldIsValid('coord_expenditure_yn')) {
      return;
    }
    if (!this._checkFormFieldIsValid('designated_com_id')) {
      return;
    }
    if (!this._checkFormFieldIsValid('designated_com_name')) {
      return;
    }
    if (!this._checkFormFieldIsValid('subordinate_com_id')) {
      return;
    }
    if (!this._checkFormFieldIsValid('subordinate_com_name')) {
      return;
    }
    if (!this._checkFormFieldIsValid('street_1_co_exp')) {
      return;
    }
    if (!this._checkFormFieldIsValid('street_2_co_exp')) {
      return;
    }
    if (!this._checkFormFieldIsValid('city_co_exp')) {
      return;
    }
    if (!this._checkFormFieldIsValid('state_co_exp')) {
      return;
    }
    if (!this._checkFormFieldIsValid('zip_co_exp')) {
      return;
    }
    this.frmIndividualReceipt.markAsUntouched();
    this.frmIndividualReceipt.markAsPristine();
    this.showPart2 = true;
  }

  public back() {
    this.showPart2 = false;
  }

  /**
   * Returns true if the field is valid.
   * @param fieldName name of control to check for validity
   */
  private _checkFormFieldIsValid(fieldName: string): boolean {
    if (this.frmIndividualReceipt.contains(fieldName)) {
      return this.frmIndividualReceipt.get(fieldName).valid;
    }
    // return true;
  }

  private _setTransactionDetail() {
    this.subTransactionInfo = {
      transactionType: 'DEBT_TO_VENDOR',
      transactionTypeDescription: 'Debt to Vendor',
      scheduleType: 'sched_d',
      subTransactionType: 'COEXP_PARTY_DEBT',
      subScheduleType: 'sched_f',
      subTransactionTypeDescription: 'Coordinated Party Expenditure (SF)',
      api_call: '/sd/schedD',
      isParent: false,
      isEarmark: false
    };

    if (this.scheduleAction === ScheduleActions.addSubTransaction) {
      this.clearFormValues();
    } else if (this.scheduleAction === ScheduleActions.edit) {
    }
  }

  /**
   * @override the Base class method.
   *
   * Determine if the field should be shown.
   * Don't show fields from the first screen by checking
   * the showPart2 for true.  If showPart2, determine which fields
   * to be shown based on the entity type selected.
   */
  public isToggleShow(col: any) {
    if (col.staticField) {
      return false;
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

  private _patchSubordinateFormFields(fieldNames: any[], entity: any) {
    if (fieldNames) {
      for (const field of fieldNames) {
        const patch = {};
        patch[field.formName] = entity[field.entityFieldName];
        this.frmIndividualReceipt.patchValue(patch, { onlySelf: true });
      }
    }
  }


  public handleSelectedSubordinateOrg($event: NgbTypeaheadSelectItemEvent, name: string) {
    const entity = $event.item;

    // this._selectedEntity = this._utilService.deepClone(entity);
    // this._setSetEntityIdTo(this._selectedEntity, col);
    // this._selectedChangeWarn = {};

    const fieldNames = [];
    if (name === 'designated_com_id' || name === 'designated_com_name') {
      fieldNames.push({ formName: 'designated_com_id', entityFieldName: 'cmte_id' });
      fieldNames.push({ formName: 'designated_com_name', entityFieldName: 'cmte_name' });
    } else if (name === 'subordinate_com_id' || name === 'subordinate_com_name') {
      fieldNames.push({ formName: 'subordinate_com_id', entityFieldName: 'cmte_id' });
      fieldNames.push({ formName: 'subordinate_com_name', entityFieldName: 'cmte_name' });
      fieldNames.push({ formName: 'street_1_co_exp', entityFieldName: 'street_1' });
      fieldNames.push({ formName: 'street_2_co_exp', entityFieldName: 'street_2' });
      fieldNames.push({ formName: 'state_co_exp', entityFieldName: 'state' });
      fieldNames.push({ formName: 'city_co_exp', entityFieldName: 'city' });
      fieldNames.push({ formName: 'zip_co_exp', entityFieldName: 'zip_code' });
    }
    this._patchSubordinateFormFields(fieldNames, entity);

    // // setting Beneficiary Candidate Entity Id to hidden variable
    // const beneficiaryCandEntityIdHiddenField = this._findHiddenField('name', 'beneficiary_cand_entity_id');
    // if (beneficiaryCandEntityIdHiddenField) {
    //   beneficiaryCandEntityIdHiddenField.value = entity.beneficiary_cand_entity_id;
    // }

    // // These fields names do not map to the same name in the form
    // const fieldName = col.name;
    // if (fieldName === 'entity_name' || fieldName === 'donor_cmte_id' || fieldName === 'beneficiary_cmte_id') {
    //   // populate org/committee fields
    //   if (fieldName === 'entity_name') {
    //     if (this.frmIndividualReceipt.controls['donor_cmte_id']) {
    //       this.frmIndividualReceipt.patchValue({ donor_cmte_id: entity.cmte_id }, { onlySelf: true });
    //     } else if (this.frmIndividualReceipt.controls['beneficiary_cmte_id']) {
    //       this.frmIndividualReceipt.patchValue({ beneficiary_cmte_id: entity.cmte_id }, { onlySelf: true });
    //     }
    //   }
    //   if (fieldName === 'donor_cmte_id' || fieldName === 'beneficiary_cmte_id') {
    //     this.frmIndividualReceipt.patchValue({ entity_name: entity.cmte_name }, { onlySelf: true });
    //   }
    // }
  }
}
