import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { CookieService } from 'ngx-cookie-service';
import { environment } from '../../../../environments/environment';
import { SessionService } from '../SessionService/session.service';
import { AuthService } from '../AuthService/auth.service';
import { Posts, Post, Auth, form99 } from '../../interfaces/APIService/APIService';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor(
    private _http: HttpClient,
    private _session: SessionService,
    private _authService: AuthService,
    private _cookieService: CookieService
  ) { }

  /**
   * Logs a user into the API.
   *
   * @param      {String}  username  The username
   * @param      {String}  password  The password
   * @return     {Object}  The JSON web token response.
   */
  public signIn(username: string, password: string) {
       let params = new HttpParams();
       params = params.append('param-1', 'value-1');
       params = params.append('param-2', 'value-2');
    return this._http
      .post<Auth>(`${environment.apiUrl}/token/obtain`, {
        username,
        password
      })
      .pipe(map(res => {
          // login successful if there's a jwt token in the response
          if (res.token) {
             this._authService.doSignIn(res.token);
          }

          return res;
      }));
  }

  public getCommiteeDetails() {
    let token: string = JSON.parse(this._cookieService.get('user'));

    let httpOptions =  new HttpHeaders();
    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    return this._http
     .get(
        `${environment.apiUrl}/core/get_committee_details`,
        {
          headers: httpOptions
        }
      )
  }

  /**
   * Files form 99.
   *
   * @param      {String}  reasonText  The reason text
   */
  public fileForm99(reasonText: string) {
    let token: string = JSON.parse(this._cookieService.get('user'));
    let type: string = localStorage.getItem('form99-type');

    localStorage.removeItem('form99-type');

    let httpOptions =  new HttpHeaders();
    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let data: form99 = {
      committeeid: 'C01234567',
      committeename: 'test2',
      street1: 'xyz',
      street2: 'abc',
      city: 'Washington',
      state: 'DC',
      zipcode: '20001',
      treasurerprefix: 'Mr',
      treasurerfirstname: 'Mark',
      reason: type,
      text: reasonText,
      treasurermiddlename: 'J',
      treasurerlastname: 'David',
      treasurersuffix: 'II',
      created_at: '2018-09-24T14:38:49.008392Z',
      is_submitted: false
    };
    return this._http
      .post<form99>(
        `${environment.apiUrl}/f99/create_f99_info`,
        data,
        {
          headers: httpOptions
        }
      )
      .pipe(map(res => {
          if (res) {
            return true;
          }
          return false;
      }));
  }

  public getForm99(committee_id: string, is_submitted: boolean) {
    let token: string = JSON.parse(this._cookieService.get('user'));

    let httpOptions =  new HttpHeaders();
    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let params = new HttpParams();
    params = params.append('committeeid', 'C1234567');
    params = params.append('is_submitted', 'false');

   //  this.httpClient.get("/data", {headers , params })


   return this._http
     .get(
        `${environment.apiUrl}/f99/fetch_f99_info`,
        {
          headers: httpOptions,
          params
        }
      )
  }
}
