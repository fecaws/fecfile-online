import { Component, OnInit, NgZone } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Subject, Subscription } from 'rxjs';
import { environment } from '../../environments/environment';
import { MessageService } from '../shared/services/MessageService/message.service';
import { CookieService } from 'ngx-cookie-service';
import { ApiService } from '../shared/services/APIService/api.service';
import { AuthService } from '../shared/services/AuthService/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  public frm: FormGroup;
  public isBusy: boolean = false;
  public hasFailed: boolean = false;
  public committeeIdInputError: boolean = false;
  public passwordInputError: boolean = false;
  public appTitle: string = null;
  public loggedOut: any = '';
  private _subscription: Subscription;

  constructor(
    private _fb: FormBuilder,
    private _ngZone: NgZone,
    private _apiService: ApiService,
    private _authService: AuthService,
    private _router: Router,
    private _route: ActivatedRoute,
    private _cookieService: CookieService,
    private _messageService: MessageService
  ) {
    this.frm = _fb.group({
      commiteeId: ['', Validators.required],
      loginPassword: ['', Validators.required]
    });
    this._subscription =
      this._messageService
        .getMessage()
        .subscribe(res => {
          this.loggedOut = res;
        });
 }

  ngOnInit() {
    this.appTitle = environment.appTitle;
  }

  ngOnDestroy() {
    this._subscription.unsubscribe();
  }

  public getLoggedOut() {
    return this.loggedOut;
  }

  /**
   * Updates the form validation when fields have text entered.
   *
   */
  public updateStatus(): void {
    if (this.frm.get('commiteeId').valid) {
      this.committeeIdInputError = false;
    }

    if (this.frm.get('loginPassword').valid) {
      this.passwordInputError = false;
    }
  }

  /**
   * Signs a user in once form is filled in and submit button clicked.
   *
   */
  public doSignIn(): void {
    if (this.frm.invalid) {
      this.committeeIdInputError = (this.frm.get('commiteeId').invalid)? true : false;

      this.passwordInputError = (this.frm.get('loginPassword').invalid)? true : false;
      return;
    }

    this.isBusy = true;
    this.hasFailed = false;

    const username: string = this.frm.get('commiteeId').value;
    const password: string = this.frm.get('loginPassword').value;

    this._apiService
      .signIn(username, password)
      .subscribe(res => {
        if (res.token) {
          this._authService
              .doSignIn(res.token);

          this._router.navigate(['dashboard']);
        }
      },
      (error) => {
        console.log('error: ', error);
        this.isBusy = false;
        this.hasFailed = true;
      });
  }
}
