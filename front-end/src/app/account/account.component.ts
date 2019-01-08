import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { SessionService } from '../shared/services/SessionService/session.service';
import { ApiService } from '../shared/services/APIService/api.service';
import { MessageService } from '../shared/services/MessageService/message.service';
import { HeaderComponent } from '../shared/partials/header/header.component';
import { SidebarComponent } from '../shared/partials/sidebar/sidebar.component';
import { FormsComponent } from '../forms/forms.component';

import { IAccount } from './account';
import { AccountService } from './account.service';

@Component({
  selector: 'app-account',
  templateUrl: './account.component.html',
  styleUrls: ['./account.component.scss'],
  providers:[AccountService]
})

export class AccountComponent implements OnInit {
  accounts: IAccount;
  public showSideBar: boolean = true;
  public showLegalDisclaimer: boolean = false;
     
  constructor(
    private _accountService:AccountService,
    private _sessionService: SessionService,
    private _apiService: ApiService,
    private _modalService: NgbModal
    ){}

    public toggleSideNav(): void {
      if (this.showSideBar) {
        this.showSideBar = false;
      } else if (!this.showSideBar) {
        this.showSideBar = true;
      }
  }

  public open(): void{
    this.showLegalDisclaimer = !this.showLegalDisclaimer;
  }

  ngOnInit() {
    // console.log("accessing service call...");
    this._accountService.getAccounts()
      .subscribe(res => this.accounts = <IAccount> res);
    // console.log(this.accounts)
  }
}