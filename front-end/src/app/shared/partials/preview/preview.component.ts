import { Component, EventEmitter, OnInit, Output, Input, ViewEncapsulation } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { BehaviorSubject, Subscription } from 'rxjs';
import { environment } from '../../../../environments/environment';
import { form99 } from '../../interfaces/FormsService/FormsService';
import { MessageService } from '../../services/MessageService/message.service';
import { FormsService } from '../../services/FormsService/forms.service';
import { DialogService } from '../../services/DialogService/dialog.service';
import { ConfirmModalComponent } from '../confirm-modal/confirm-modal.component';

@Component({
  selector: 'app-preview',
  templateUrl: './preview.component.html',
  styleUrls: ['./preview.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class PreviewComponent implements OnInit {
  @Output() status: EventEmitter<any> = new EventEmitter<any>();

  public committeeDetails: any = {};
  public confirmModal: BehaviorSubject<boolean> = new BehaviorSubject(false);
  public typeSelected: string = '';
  public formType: string = '';
  public date_stamp: Date = new Date();
  public formDetails: form99;
  public showValidateBar: boolean = false;
  public fileName: string = '';
  public fileurl: string = '';
  public orgFileName: string = '';
  public orgFileUrl: string = '';
  public printpriview_filename: string = '';
  public printpriview_fileurl: string = '';
  public editMode: boolean;
  private _subscription: Subscription;
  private _step: string = '';
  private _printPriviewPdfFileLink: string = '';
  private _formDetails: any = {};
  private _setRefresh:boolean = false;

  constructor(
    private _activatedRoute: ActivatedRoute,
    private _messageService: MessageService,
    private _formsService: FormsService,
    private _dialogService: DialogService
  ) {
    _activatedRoute.queryParams.subscribe(p => {
      if (p.refresh) {
        this._setRefresh = true;
        this.ngOnInit();
      }
    });
  }

  ngOnInit(): void {
    this.formType = this._activatedRoute.snapshot.paramMap.get('form_id');
    this.editMode = this._activatedRoute.snapshot.queryParams.edit === 'false' ? false : true;
    this._messageService.getMessage().subscribe(res => {
  
      console.log("Preview screen this.formDetails ", this.formDetails);
      this.committeeDetails = JSON.parse(localStorage.getItem('committee_details'));

      if (this.editMode)  {
        this._step = res.step;
        this.formDetails =  JSON.parse(localStorage.getItem('form_99_details'));
      }else if (!this.editMode)  {
        this._step = res.step;
        this.formDetails = res.data;
      }

      setTimeout(() => {
        if (this.formType === '99') {
          if (this.formDetails) {
  
            if (this.formDetails.hasOwnProperty('filename')) {
              this.fileName = this.formDetails.filename;
            } else {
              this.fileName = "";
            }
  
            if (this.formDetails.hasOwnProperty('org_fileurl')) {
              this.orgFileUrl = this.formDetails.org_fileurl;
            } else if (this.formDetails.hasOwnProperty('file')) {
              this.orgFileUrl = this.formDetails.file;
            } else {
              this.orgFileUrl = "";
            }
  
            console.log("this.orgFileUrl", this.orgFileUrl );
            console.log("this.fileName", this.fileName );
  
          }
  
          if (this.formDetails && typeof this.formDetails !== 'undefined' && this.formDetails.reason) {
            if (typeof this.formDetails.reason !== 'undefined') {
              this.typeSelected = this.formDetails.reason;
            }
          }
        }
      }, 500);

    });
  }

  ngDoCheck(): void {
    if (this.formDetails) {
      if (this.formDetails.org_fileurl) {
        this.orgFileUrl = this.formDetails.org_fileurl;
      }
    }

    if (!this.formDetails) {
      if (localStorage.getItem(`form_${this.formType}_details`) !== null) {
        this.formDetails = JSON.parse(localStorage.getItem(`form_${this.formType}_details`));

        if (this.formType === '99') {
          if (!this.typeSelected) {
            this.typeSelected = this.formDetails.reason;
          }
        }
      }
    }
  }

  /**
   * Determines ability for a person to leave a page with a form on it.
   *
   * @return     {boolean}  True if able to deactivate, False otherwise.
   */
  public async canDeactivate(): Promise<boolean> {
    if (this.hasUnsavedData()) {
      let result: boolean = null;

      result = await this._dialogService.confirm('', ConfirmModalComponent).then(res => {
        let val: boolean = null;

        if (res === 'okay') {
          val = true;
        } else if (res === 'cancel') {
          val = false;
        }

        return val;
      });

      return result;
    } else {
      return true;
    }
  }

  /**
   * Determines if form has unsaved data.
   * TODO: Move to service.
   *
   * @return     {boolean}  True if has unsaved data, False otherwise.
   */
  public hasUnsavedData(): boolean {
    let formSaved: any = JSON.parse(localStorage.getItem(`form_${this.formType}_saved`));

    if (formSaved !== null) {
      let formStatus: boolean = formSaved.saved;

      if (!formStatus) {
        return true;
      }
    }

    return false;
  }

  public goToPreviousStep(): void {
    setTimeout(() => {
      localStorage.setItem(`form_${this.formType}_details`, JSON.stringify(this.formDetails));
    }, 100);

    this.status.emit({
      form: {},
      direction: 'previous',
      step: 'step_2',
      previousStep: this._step
    });

    this.showValidateBar = false;

    this._messageService.sendMessage({
      validateMessage: {
        validate: {},
        showValidateBar: false
      }
    });
  }

  public goToNextStep(): void {
    setTimeout(() => {
      localStorage.setItem(`form_${this.formType}_details`, JSON.stringify(this.formDetails));
    }, 100);

    this.status.emit({
      form: 'preview',
      direction: 'next',
      step: 'step_4',
      previousStep: this._step,
      refresh: this._setRefresh
    });

    this.showValidateBar = false;

    this._messageService.sendMessage({
      validateMessage: {
        validate: {},
        showValidateBar: false
      }
    });
  }

  public validateForm(): void {
    this.showValidateBar = true;

    this._formsService.validateForm({}, this.formType).subscribe(
      res => {
        if (res) {
          this._messageService.sendMessage({
            validateMessage: {
              validate: environment.validateSuccess,
              showValidateBar: true
            }
          });
        }
      },
      error => {
        this._messageService.sendMessage({
          validateMessage: {
            validate: error.error,
            showValidateBar: true
          }
        });
      }
    );
  }
  public printPreview(): void {
    this._formDetails = JSON.parse(localStorage.getItem(`form_${this.formType}_details`));
    console.log('Accessing PreviewComponent printPriview ...');
    localStorage.setItem(`form_${this.formType}_details`, JSON.stringify(this._formDetails));
    console.log('Accessing PreviewComponent printPriview ...');
    this._formsService.PreviewForm_Preview_sign_Screen({}, '99').subscribe(
      res => {
        if (res) {
          console.log('Accessing PreviewComponent printPriview res ...', res);
          window.open(localStorage.getItem('form_99_details.printpriview_fileurl'), '_blank');
        }
      },
      error => {
        console.log('error: ', error);
      }
    );
  }
}
