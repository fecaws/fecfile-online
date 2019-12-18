import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import 'rxjs/add/observable/of';
import { CookieService } from 'ngx-cookie-service';
import { environment } from '../../../environments/environment';
import { map } from 'rxjs/operators';
import { Subscription } from 'rxjs';

export enum SchedHActions {
  add = 'add',
  edit = 'edit'
}

@Injectable({
  providedIn: 'root'
})
export class SchedH3Service {

  constructor(
    private _http: HttpClient,
    private _cookieService: CookieService,
  ) { }

  public getActivityOrEventIdentifiers(activity_event_type: string): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions =  new HttpHeaders();
    const url = '/sh2/get_h2_type_events';

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let params = new HttpParams();
    params = params.append('activity_event_type', activity_event_type);
    
    return this._http
      .get(
        `${environment.apiUrl}${url}`,      
        {
          params,
          headers: httpOptions
        }
      )
      .pipe(map(res => {
          if (res) {
            console.log('H3 ActivityOrEventIdentifiers res: ', res);
            return res;
          }
          return false;
      })
      );
  }

  public getTotalAmount(activity_event_type: string, reportId: string): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions =  new HttpHeaders();
    const url = '/sh3/get_h3_total_amount';

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let params = new HttpParams();
    params = params.append('activity_event_type', activity_event_type);
    params = params.append('report_id', reportId);
    
    return this._http
      .get(
        `${environment.apiUrl}${url}`,      
        {
          params,
          headers: httpOptions
        }
      )
      .pipe(map(res => {
          if (res) {
            console.log('H3 Totdal Amount res: ', res);
            return res;
          }
          return false;
      })
      );

  }

  public getSummary(reportId: string): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions =  new HttpHeaders();
    const url = '/sh3/get_h3_summary';

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let params = new HttpParams();
    params = params.append('report_id', reportId);
    
    return this._http
      .get(
        `${environment.apiUrl}${url}`,      
        {
          params,
          headers: httpOptions
        }
      )
      .pipe(map(res => {
          if (res) {
            console.log('H3 Summary res: ', res);
            return res;
          }
          return false;
      })
      );
  }

  public getBreakDown(reportId: string): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions =  new HttpHeaders();
    const url = '/sh3/get_sched_h3_breakdown';

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let params = new HttpParams();
    params = params.append('report_id', reportId);
    
    return this._http
      .get(
        `${environment.apiUrl}${url}`,      
        {
          params,
          headers: httpOptions
        }
      )
      .pipe(map(res => {
          if (res) {
            console.log('H3 Breakdown res: ', res);
            return res;
          }
          return false;
      })
      );
  }

  public saveH3Ratio(ratio: any,  scheduleAction: SchedHActions): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions =  new HttpHeaders();
    const url = '/sh3/schedH3';

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    const formData: FormData = new FormData();
    for (const [key, value] of Object.entries(ratio)) {
      if (value !== null) {
        if (typeof value === 'string') {
          formData.append(key, value);
        }
      }
    }

    if (scheduleAction === SchedHActions.add) {
      return this._http
        .post(
          `${environment.apiUrl}${url}`, ratio,
          {
            headers: httpOptions
          }
        )
        .pipe(map(res => {
            if (res) {
              console.log('Save H3Ratio res: ', res);
              return res;
            }
            return false;
        })
      );
    }else if(scheduleAction === SchedHActions.edit) {
      return this._http
        .put(
          `${environment.apiUrl}${url}`, ratio,
          {
            headers: httpOptions
          }
        )
        .pipe(map(res => {
            if (res) {
              console.log('Edit H3Ratio res: ', res);
              return res;
            }
            return false;
        })
      );
    }
  }

  public saveAndGetSummary(ratio: any, reportId: string, scheduleAction: SchedHActions): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions =  new HttpHeaders();
    const url = '/sh3/schedH3';

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    const formData: FormData = new FormData();
    for (const [key, value] of Object.entries(ratio)) {
      if (value !== null) {
        if (typeof value === 'string') {
          formData.append(key, value);
        }
      }
    }

    if (scheduleAction === SchedHActions.add) {
      return this._http
        .post(
          `${environment.apiUrl}${url}`, ratio,
          {
            headers: httpOptions
          }
        )
        .pipe(map(res => {
            if (res) {
              console.log('Save H3Ratio res: ', res);

              //get summary
              //this.getSummary(reportId);

              let sub: Subscription;
              let sum: any;
              sub = this.getSummary(reportId).subscribe(res =>
                {
                  if(res) {
                    sum =  res;
                  }
                });

              return sum;
            }
            return false;
        })
        );
      }else if(scheduleAction === SchedHActions.edit) {
        return this._http
        .put(
          `${environment.apiUrl}${url}`, ratio,
          {
            headers: httpOptions
          }
        )
        .pipe(map(res => {
            if (res) {
              console.log('Edit H3Ratio res: ', res);

              //get summary
              //this.getSummary(reportId);

              let sub: Subscription;
              let sum: any;
              sub = this.getSummary(reportId).subscribe(res =>
                {
                  if(res) {
                    sum =  res;
                  }
                });

              return sum;
            }
            return false;
        })
        );
      }


  }
    
}
