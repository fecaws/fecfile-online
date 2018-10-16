import { Component, EventEmitter, Input, OnInit, Output, ViewEncapsulation } from '@angular/core';
import { FormBuilder, FormGroup, FormControl, NgForm, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { QuillEditorComponent } from 'ngx-quill';
import { AngularEditorConfig } from '@kolkov/angular-editor';
import { environment } from '../../../../environments/environment';
import { ApiService } from '../../../shared/services/APIService/api.service';
import { MessageService } from '../../../shared/services/MessageService/message.service';
import { DialogService } from '../../../shared/services/DialogService/dialog.service';

@Component({
  selector: 'app-reason',
  templateUrl: './reason.component.html',
  styleUrls: ['./reason.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class ReasonComponent implements OnInit {

  @Output() status: EventEmitter<any> = new EventEmitter<any>();
  @Input('editor') editor: any;

  public frmReason: FormGroup;
  public reasonType: string = '';
  public reasonFailed: boolean = false;
  public lengthError: boolean = false;
  public isValidReason: boolean = false;
  public reasonText: string = '';
  public isFiled: boolean = false;
  public characterCount: number = 0;
  public formSaved: boolean = false;

  private _form_99_details: any = JSON.parse(localStorage.getItem('form_99_details'));
  private _editorMax: number = 20000;

  public editorConfig: AngularEditorConfig = {
    editable: true,
    spellcheck: true,
    height: '25rem',
    minHeight: '5rem',
    placeholder: 'Enter text here...',
    translate: 'no',
    uploadUrl: 'v1/images', // if needed
    customClasses: [ // optional
      {
        name: "quote",
        class: "quote",
      },
      {
        name: 'redText',
        class: 'redText'
      },
      {
        name: "titleText",
        class: "titleText",
        tag: "h1",
      },
    ]
  };


  constructor(
    private _fb: FormBuilder,
    private _router: Router,
    private _apiService: ApiService,
    private _messageService: MessageService,
    private _dialogService: DialogService
  ) {
    this._messageService.clearMessage();
  }

  ngOnInit(): void {

    if(this._form_99_details) {
      if(this._form_99_details.text) {
        this.frmReason = this._fb.group({
          reasonText: [this._form_99_details.text, [
            Validators.required,
            Validators.maxLength(this._editorMax)
          ]]
        });
       } else {
        this.frmReason = this._fb.group({
          reasonText: ['', [
            Validators.required,
            Validators.maxLength(this._editorMax)
          ]]
        });
       }
    } else {
      this.frmReason = this._fb.group({
        reasonText: ['', [
          Validators.required,
          Validators.maxLength(this._editorMax)
        ]]
      });
    }
  }

  ngDoCheck(): void {
    if (this.frmReason.get('reasonText').value.length >= 1) {
      this.characterCount = this.frmReason.get('reasonText').value.length;
    } else if(this.frmReason.get('reasonText').value.length === 0) {
      this.characterCount = 0;
    }
  }

  public onContentChanged(e, el): void {
    /*console.log('content changed: ');
    if(this.frmReason.controls['reasonText'].errors) {
      if(this.frmReason.controls['reasonText'].errors.maxlength) {
        console.log('maxLength:');
        console.log('this.frmReason: ', this.frmReason);
        console.log('e: ', e);
      }
    }*/
  }

  /**
   * Validates the reason form.
   *
   */
  public doValidateReason() {
    if (this.frmReason.get('reasonText').value.length >= 1) {
        this.reasonFailed = false;
        this.isValidReason = true;

        this.reasonText = this.frmReason.get('reasonText').value;

        this.status.emit({
          form: this.frmReason,
          direction: 'next',
          step: 'step_3',
          previousStep: 'step_2'
        });

        this._messageService.sendMessage({
          data: this.frmReason.get('reasonText').value,
          previousStep: 'step_3'
        });
    } else {
      this.reasonFailed = true;
      this.isValidReason = false;

      this.status.emit({
        form: this.frmReason,
        direction: 'next',
        step: 'step_2',
        previousStep: ''
      });
      return;
    }
  }

  public previousStep(): void {
    this.status.emit({
      form: {},
      direction: 'previous',
      step: 'step_1'
    });
  }

  /**
   * Saves the form when the save button is clicked.
   *
   */
  public saveForm() {
    if(this.frmReason.valid) {
      if (this.frmReason.get('reasonText').value.length >= 1) {
        this._apiService
          .fileForm99(this.frmReason.get('reasonText').value)
          .subscribe(res => {
            if(res) {
              console.log('res: ', res);
              this.formSaved = true;
            }
          },
          (error) => {
            console.log('error: ', error);
          });
      }
    }
  }

  /*public canDeactivate(): Observable<boolean> | boolean {
      if (!this.formSaved && this.frmReason.dirty) {

          return this._dialogService.confirm('Discard changes for this form?');
      }
      return true;
  }*/
}
