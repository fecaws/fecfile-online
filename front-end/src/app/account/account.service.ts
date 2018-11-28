import {Injectable} from '@angular/core';
import {Http, Response} from '@angular/http';
import {IAccount} from './account';
import {Observable} from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import {environment} from '../../environments/environment';
import { ConditionalExpr } from '@angular/compiler';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { CookieService } from 'ngx-cookie-service';

@Injectable()
export class AccountService{
    private AccountData: IAccount;

    constructor(
        private _http: HttpClient,
        private _cookieService: CookieService
      ) { }
    
    getAccounts(): Observable<any>
    {
        let token: string = JSON.parse(this._cookieService.get('user'));
        let httpOptions =  new HttpHeaders();
        /*let params = new HttpParams();*/
        let url: string = '';
        
        url = '/core/get_committee_details';    
                

        httpOptions = httpOptions.append('Content-Type', 'application/json');
        httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

        console.log(`${environment.apiUrl}${url}`);
        
        return this._http
        .get(
        `${environment.apiUrl}${url}`,
        {
          headers: httpOptions
        }
      );

       
   }
}