import { Component, OnInit } from '@angular/core';
import { ImportContactsStepsEnum } from './import-contacts-setps.enum';

@Component({
  selector: 'app-import-contacts',
  templateUrl: './import-contacts.component.html',
  styleUrls: ['./import-contacts.component.scss']
})
export class ImportContactsComponent implements OnInit {

  public steps: Array<any>;
  public currentStep: ImportContactsStepsEnum;
  public readonly step1Upload = ImportContactsStepsEnum.step1Upload;
  public readonly step2Configure = ImportContactsStepsEnum.step2Configure;
  public readonly step3Clean = ImportContactsStepsEnum.step3Clean;
  public readonly step4ImportDone = ImportContactsStepsEnum.step4ImportDone;
  public userContactFields: Array<string>;
  public userContacts: Array<any>;

  constructor() { }

  ngOnInit() {
    this.steps = [
      { text: 'Upload', step: this.step1Upload },
      { text: 'Configure', step: this.step2Configure },
      { text: 'Clean', step: this.step3Clean },
      { text: 'Import', step: this.step4ImportDone }
    ];
    this.currentStep = this.step1Upload;
  }

  public showNextStep() {
    switch (this.currentStep) {
      case this.step1Upload:
        this.currentStep = this.step2Configure;
        break;
      case this.step2Configure:
        this.currentStep = this.step3Clean;
        break;
      case this.step3Clean:
        this.currentStep = this.step4ImportDone;
        break;
      default:
        this.currentStep = this.step1Upload;
    }
  }

  public showPreviousStep() {
    switch (this.currentStep) {
      case this.step4ImportDone:
        this.currentStep = this.step3Clean;
        break;
      case this.step3Clean:
        this.currentStep = this.step2Configure;
        break;
      case this.step2Configure:
        this.currentStep = this.step1Upload;
        break;
      default:
    }
  }

  public receiveUserContacts(userContactsMessage: any) {
    this.userContactFields = userContactsMessage.userContactFields;
    this.userContacts = userContactsMessage.userContactFields;
    this.showNextStep();
  }

  /**
 * Determines ability for a person to leave a page with a form on it.
 *
 * @return     {boolean}  True if able to deactivate, False otherwise.
 */
  public async canDeactivate(): Promise<boolean> {
    // TODO check for form changes and set boolean property in this class.

    //   if (this.hasUnsavedData()) {
    //     let result: boolean = null;
    //     result = await this._dialogService.confirm('', ConfirmModalComponent).then(res => {
    //       let val: boolean = null;

    //       if (res === 'okay') {
    //         val = true;
    //       } else if (res === 'cancel') {
    //         val = false;
    //       }

    //       return val;
    //     });

    //     return result;
    //   } else {
    //     return true;
    //   }
    // }
    return true;
  }
}
