import {
  Component,
  EventEmitter,
  ElementRef,
  Input,
  OnInit,
  Output,
  ViewEncapsulation,
  ViewChild
} from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { FormBuilder, FormGroup, FormControl, NgForm, Validators } from '@angular/forms';
import { NgbTooltipConfig } from '@ng-bootstrap/ng-bootstrap';
import { environment } from '../../../../environments/environment';
import { FormsService } from '../../../shared/services/FormsService/forms.service';
import { UtilService } from '../../../shared/utils/util.service';
import { IndividualReceiptService } from './individual-receipt.service';
import { f3xTransactionTypes } from '../../../shared/interfaces/FormsService/FormsService';
import { alphaNumeric } from '../../../shared/utils/forms/validation/alpha-numeric.validator';
import { floatingPoint } from '../../../shared/utils/forms/validation/floating-point.validator';
import { contributionDate } from '../../../shared/utils/forms/validation/contribution-date.validator';

@Component({
  selector: 'f3x-individual-receipt',
  templateUrl: './individual-receipt.component.html',
  styleUrls: ['./individual-receipt.component.scss'],
  providers: [NgbTooltipConfig],
  encapsulation: ViewEncapsulation.None
})
export class IndividualReceiptComponent implements OnInit {
  @Output() status: EventEmitter<any> = new EventEmitter<any>();
  @Input() selectedOptions: any = {};
  @Input() formOptionsVisible: boolean = false;
  @Input() transactionTypeText = '';

  public formFields: any = [];
  public frmIndividualReceipt: FormGroup;
  public hiddenFields: any = [];
  public testForm: FormGroup;
  public formVisible: boolean = false;
  public states: any = [];

  private _formType: string = '';
  private _reportType: any = {};
  private _types: any = [];
  private _transaction: any = {};

  constructor(
    private _http: HttpClient,
    private _fb: FormBuilder,
    private _formService: FormsService,
    private _individualReceiptService: IndividualReceiptService,
    private _activatedRoute: ActivatedRoute,
    private _config: NgbTooltipConfig,
    private _router: Router,
    private _utilService: UtilService
  ) {
    this._config.placement = 'right';
    this._config.triggers = 'click';
  }

  ngOnInit(): void {
    this._formType = this._activatedRoute.snapshot.paramMap.get('form_id');

    this._reportType = JSON.parse(localStorage.getItem(`form_${this._formType}_report_type`));

    console.log('this._reportType: ', this._reportType);

    this.frmIndividualReceipt = this._fb.group({});

    this._individualReceiptService.getDynamicFormFields(this._formType, 'Individual Receipt').subscribe(res => {
      if (res) {
        console.log('getDynamicForms: ', res);

        // this.formFields = res.data.formFields;
        // this.hiddenFields = res.data.hiddenFields;
        // this.states = res.data.states;

        this.formFields = res.formFields;

        console.log('this.formFields: ', this.formFields);

        this.hiddenFields = res.hiddenFields;
        this.states = res.states;

        if (this.formFields.length >= 1) {
          this._setForm(this.formFields);
        }
      }
    });
  }

  ngDoCheck(): void {
    if (this.selectedOptions) {
      if (this.selectedOptions.length >= 1) {
        this.formVisible = true;
      }
    }
  }

  public fieldChange(e): void {
    console.log('fieldChange: ');

    // console.log('e: ', e);
    console.log('value: ', e.target.value);
  }

  /**
   * Generates the dynamic form after all the form fields are retrived.
   *
   * @param      {Array}  fields  The fields
   */
  private _setForm(fields: any): void {
    const formGroup: any = [];

    fields.forEach(el => {
      if (el.hasOwnProperty('cols')) {
        el.cols.forEach(e => {
          formGroup[e.name] = new FormControl(e.value || null, this._mapValidators(e.validation));
        });
      }
    });

    this.frmIndividualReceipt = new FormGroup(formGroup);
  }

  /**
   * Sets the form field valition requirements.
   *
   * @param      {String} fieldName The name of the field.
   * @param      {Object} validators  The validators.
   * @return     {Array}  The validations in an Array.
   */
  private _mapValidators(validators: any): Array<any> {
    const formValidators = [];

    if (validators) {
      for (const validation of Object.keys(validators)) {
        if (validation === 'required') {
          if (validators[validation]) {
            formValidators.push(Validators.required);
          }
        } else if (validation === 'min') {
          if (validators[validation] !== null) {
            formValidators.push(Validators.minLength(validators[validation]));
          }
        } else if (validation === 'max') {
          if (validators[validation] !== null) {
            formValidators.push(Validators.maxLength(validators[validation]));
          }
        } else if (validation === 'alphaNumeric') {
          formValidators.push(alphaNumeric());
        } else if (validation === 'dollarAmount') {
          if (validators[validation] !== null) {
            formValidators.push(floatingPoint());
          }
        } else if (validation === 'contributionDate') {
          console.log('contributionDate: ');
          console.log('validators[validation: ', validators[validation]);
          if (validators[validation]) {
            formValidators.push(contributionDate(this._reportType));
          }
        }
      }
    }
    return formValidators;
  }

  /**
   * Vaidates the form on submit.
   */
  public doValidateReceipt() {
    console.log('this.frmIndividualReceipt: ', this.frmIndividualReceipt);
    if (this.frmIndividualReceipt.valid) {
      let receiptObj: any = {};

      for (const field in this.frmIndividualReceipt.controls) {
        if (field === 'ContributionDate') {
          console.log('changeDate: ');
          receiptObj[field] = this._utilService.formatDate(this.frmIndividualReceipt.get(field).value);
        } else {
          receiptObj[field] = this.frmIndividualReceipt.get(field).value;
        }
      }

      this.hiddenFields.forEach(el => {
        receiptObj[el.name] = el.value;
      });

      localStorage.setItem(`form_${this._formType}_receipt`, JSON.stringify(receiptObj));

      this._individualReceiptService.saveScheduleA(this._formType).subscribe(res => {
        if (res) {
          this.frmIndividualReceipt.reset();

          localStorage.removeItem(`form_${this._formType}_receipt`);

          window.scrollTo(0, 0);
        }
      });
    } else {
      this.frmIndividualReceipt.markAsDirty();
      this.frmIndividualReceipt.markAsTouched();
      window.scrollTo(0, 0);
    }
  }

  /**
   * Goes to the previous step.
   */
  public previousStep(): void {
    this.status.emit({
      form: {},
      direction: 'previous',
      step: 'step_2'
    });
  }
}
