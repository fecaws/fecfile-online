import { Component, HostListener, OnInit, NgZone, ViewChild, ViewEncapsulation } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BehaviorSubject, Observable, of } from 'rxjs';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { environment } from '../../environments/environment';
import { FormsService } from '../shared/services/FormsService/forms.service';
import { MessageService } from '../shared/services/MessageService/message.service';
import { DialogService } from '../shared/services/DialogService/dialog.service';
import { ValidateComponent } from '../shared/partials/validate/validate.component';
import { ConfirmModalComponent } from '../shared/partials/confirm-modal/confirm-modal.component';

@Component({
  selector: 'app-forms',
  templateUrl: './forms.component.html',
  styleUrls: ['./forms.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class FormsComponent implements OnInit {

	public formType: string = '';
  public closeResult: string = '';
  public canContinue: boolean = false;
  public showValidateBar: boolean = false;
  public confirmModal: BehaviorSubject<boolean> = new BehaviorSubject(false);

  private _openModal: any = null;

  constructor(
  	private _activeRoute: ActivatedRoute,
    private _modalService: NgbModal,
    private _ngZone: NgZone,
    private _messageService: MessageService,
    private _dialogService: DialogService,
    private _formsService: FormsService
  ) { }

  ngOnInit(): void {
  	this._activeRoute
      .params
      .subscribe( params => {
  		  this.formType = params.form_id;
  	});

    this._messageService
      .getMessage()
      .subscribe(res => {
        if(res.validateMessage) {
          this.showValidateBar = res.validateMessage.showValidateBar;
        }
      });
  }

  /**
   * Determines ability for a person to leave a page with a form on it.
   *
   * @return     {boolean}  True if able to deactivate, False otherwise.
   */
  public async canDeactivate(): Promise<boolean> {
    if (this._formsService.formHasUnsavedData(this.formType)) {
      let result: boolean = null;

      result = await this._dialogService
        .confirm('', ConfirmModalComponent)
        .then(res => {
          let val: boolean = null;

          if(res === 'okay') {
            val = true;
          } else if(res === 'cancel') {
            val = false;
          }

          return val;
        });

      return result;
    } else {
      return true;
    }

    return false;
  }

  /**
   * Open's the modal window.
   *
   * @param      {Object}  content  The content
   */
  /*public openModal(): void {
    console.log('openModal: ');
    console.log('this.modalContent: ', this.modalContent);
    console.log('this._modalService.open(this.modalContent): ', this._modalService.open(this.modalContent));
    this._openModal = this._modalService.open(this.modalContent);

    this.confirmModal.next(false);
  }

  public modalResponse(response: string): void {
    console.log('modalResponse: ');
    console.log('response: ',  response);
    let result: boolean = false;

    if(response === 'okay') {
      this._modalService.dismissAll();
      result = true;
    } else if(response === 'cancel') {
      this._modalService.dismissAll();
      result = false;
    }

    this.confirmModal.next(result);
  }*/
}
