import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, identity } from 'rxjs';
import { map } from 'rxjs/operators';
import { CookieService } from 'ngx-cookie-service';
import { environment } from '../../../../environments/environment';
import { form3xReportTypeDetails} from '../../../shared/interfaces/FormsService//FormsService';

@Injectable({
  providedIn: 'root'
})
export class ReportTypeService {
  constructor(private _http: HttpClient, private _cookieService: CookieService) {}

  /**
   * Gets the report types.
   *
   * @param      {string}  formType  The form type
   */
  public getReportTypes(formType: string): Observable<any> {
    let token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions = new HttpHeaders();
    let url: string = '/core/get_report_types?form_type=F3X';
    let params = new HttpParams();

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    params = params.append('form_type', `${formType}`);

    return this._http.get(`${environment.apiUrl}${url}`, {
      headers: httpOptions
    });
  }

  /**
   * Saves a report.
   *
   * @param      {string}  formType  The form type
   */
  public saveReport(formType: string, access_type: string): Observable<any> {
    let token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions = new HttpHeaders();
    let url: string = '/core/reports';

    let params = new HttpParams();
    let formData: FormData = new FormData();

    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let form3xReportType: any = JSON.parse(localStorage.getItem(`form_${formType}_report_type`));

    if (form3xReportType === null)
    {
      console.log("get backup object");
      let form3xReportType: any = JSON.parse(localStorage.getItem(`form_${formType}_report_type_backup`));
    }

    formData.append('form_type', `F${formType}`);
    formData.append('report_type', form3xReportType.reportType);
    formData.append('cvg_start_dt', form3xReportType.cvgStartDate);
    formData.append('cvg_end_dt', form3xReportType.cvgEndDate);
    formData.append('due_dt', form3xReportType.dueDate);

    if (form3xReportType.hasOwnProperty('amend_Indicator')) {
      if (typeof form3xReportType.amend_Indicator === 'string') {
        if (form3xReportType.amend_Indicator.length >= 1) {
          formData.append('amend_ind', form3xReportType.amend_Indicator);
        } else {
          formData.append('amend_ind', 'N');
        }
      }
    } else {
      formData.append('amend_ind', 'N');
    }

    if (form3xReportType.hasOwnProperty('coh_bop')) {
      if (typeof form3xReportType.coh_bop === 'string') {
        if (form3xReportType.coh_bop.length >= 1) {
          formData.append('coh_bop', form3xReportType.coh_bop);
        }
      } else {
        formData.append('coh_bop', '0');
      }
    } else {
      formData.append('coh_bop', '0');
    }

    if (typeof form3xReportType.electionCode === 'string') {
      if (form3xReportType.electionCode.length >= 1) {
        formData.append('election_code', form3xReportType.electionCode);
      }
    }

    if (form3xReportType.election_date !== null) {
      if (typeof form3xReportType.election_date === 'string') {
        if (form3xReportType.election_date.length >= 1) {
          formData.append('date_of_election', form3xReportType.election_date);
        }        
      }
    }

    if (form3xReportType.election_state !== null) {
      if (typeof form3xReportType.election_state === 'string') {
        if (form3xReportType.election_state.length >= 1) {
          formData.append('state_of_election', form3xReportType.election_state);
        }
      }
    }

    if (access_type === 'Saved') {
      formData.append('status', 'Saved');
    } else if (access_type === 'Submitted') {
      formData.append('status', 'Submitted');
    }

    if (form3xReportType.email1 !== null) {
      if (typeof form3xReportType.email1 === 'string') {
        if (form3xReportType.email1.length >= 1) {
          formData.append('email_1', form3xReportType.email1);
        }
      }
    }

    if (form3xReportType.email2 !== null) {
      if (typeof form3xReportType.email2 === 'string') {
        if (form3xReportType.email2.length >= 1) {
          formData.append('email_2', form3xReportType.email2);
        }
      }
    }

    if (form3xReportType.additionalEmail1 !== null) {
      if (typeof form3xReportType.additionalEmail1 === 'string') {
        if (form3xReportType.additionalEmail1.length >= 1) {
          formData.append('additional_email_1', form3xReportType.additionalEmail1);
        }
      }
    }

    if (form3xReportType.additionalEmail2 !== null) {
      if (typeof form3xReportType.additionalEmail2 === 'string') {
        if (form3xReportType.additionalEmail2.length >= 1) {
          formData.append('additional_email_2', form3xReportType.additionalEmail2);
        }
      }
    }

    return this._http
      .post(`${environment.apiUrl}${url}`, formData, {
        headers: httpOptions
      })
      .pipe(
        map(res => {
          if (res) {
            console.log("Form 3X save res = ", res);
            if (localStorage.getItem(`form_${formType}_report_type`) !== null) {
              const reportObj: form3xReportTypeDetails = JSON.parse(window.localStorage.getItem(`form_${formType}_report_type`));
               if (res['reportid']) {
                reportObj.reportId = res['reportid'];
                window.localStorage.setItem(`form_${formType}_report_type`, JSON.stringify(reportObj));
              }
            }
            return res;
          }
          return false;
        })
      );
  }

  public signandSaveSubmitReport(formType: string, access_type: string): Observable<any> {
    let token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions = new HttpHeaders();
    let url: string = '/core/reports';

    let params = new HttpParams();
    let formData: FormData = new FormData();
    console.log("signandSaveSubmitReport called");
    console.log("signandSaveSubmitReport formType = ", formType);
    console.log("signandSaveSubmitReport access_type = ", access_type);

    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let form3xReportType: any = JSON.parse(localStorage.getItem(`form_${formType}_report_type`));

    if (form3xReportType === null)
    {
      console.log("get backup object");
      form3xReportType = JSON.parse(localStorage.getItem(`form_${formType}_report_type_backup`));
      console.log("backup object form3xReportType = ", form3xReportType);
    }
    console.log("signandSaveSubmitReport access_type you reached here = ", access_type);
    formData.append('form_type', `F${formType}`);
    formData.append('report_id', form3xReportType.reportId);
    formData.append('report_type', form3xReportType.reportType);
    formData.append('cvg_start_dt', form3xReportType.cvgStartDate);
    formData.append('cvg_end_dt', form3xReportType.cvgEndDate);
    formData.append('due_dt', form3xReportType.dueDate);

    console.log("signandSaveSubmitReport access_type you reached here1 = ", access_type);

    if (form3xReportType.hasOwnProperty('amend_Indicator')) {
      if (typeof form3xReportType.amend_Indicator === 'string') {
        if (form3xReportType.amend_Indicator.length >= 1) {
          formData.append('amend_ind', form3xReportType.amend_Indicator);
        } else {
          formData.append('amend_ind', 'N');
        }
      }
    } else {
      formData.append('amend_ind', 'N');
    }

    if (form3xReportType.hasOwnProperty('coh_bop')) {
      if (typeof form3xReportType.coh_bop === 'string') {
        if (form3xReportType.coh_bop.length >= 1) {
          formData.append('coh_bop', form3xReportType.coh_bop);
        }
      } else {
        formData.append('coh_bop', '0');
      }
    } else {
      formData.append('coh_bop', '0');
    }

    if (typeof form3xReportType.electionCode === 'string') {
      if (form3xReportType.electionCode.length >= 1) {
        formData.append('election_code', form3xReportType.electionCode);
      }
    }

    if (form3xReportType.election_date !== null) {
      if (typeof form3xReportType.election_date === 'string') {
        if (form3xReportType.election_date.length >= 1) {
          formData.append('date_of_election', form3xReportType.election_date);
        }        
      }
    }

    if (form3xReportType.election_state !== null) {
      if (typeof form3xReportType.election_state === 'string') {
        if (form3xReportType.election_state.length >= 1) {
          formData.append('state_of_election', form3xReportType.election_state);
        }
      }
    }

    console.log(" access_type =", access_type);

    if (access_type === 'Saved') {
      formData.append('status', 'Saved');
    } else if (access_type === 'Submitted') {
      formData.append('status', 'Submitted');
    }

    if (form3xReportType.email1 !== null) {
      if (typeof form3xReportType.email1 === 'string') {
        if (form3xReportType.email1.length >= 1) {
          formData.append('email_1', form3xReportType.email1);
        }
      }
    }

    if (form3xReportType.email2 !== null) {
      if (typeof form3xReportType.email2 === 'string') {
        if (form3xReportType.email2.length >= 1) {
          formData.append('email_2', form3xReportType.email2);
        }
      }
    }

    if (form3xReportType.additionalEmail1 !== null) {
      if (typeof form3xReportType.additionalEmail1 === 'string') {
        if (form3xReportType.additionalEmail1.length >= 1) {
          formData.append('additional_email_1', form3xReportType.additionalEmail1);
        }
      }
    }
    
    console.log("form3xReportType.additionalEmail2 = ",form3xReportType.additionalEmail2);
    if (form3xReportType.additionalEmail2 !== null) {
      if (typeof form3xReportType.additionalEmail2 === 'string') {
        if (form3xReportType.additionalEmail2.length >= 1) {
          formData.append('additional_email_2', form3xReportType.additionalEmail2);
        }
      }
    }
    
    console.log("signandSaveSubmitReport formData = ", formData);

    if (access_type==='Saved'){
      console.log("signandSaveSubmitReport HTTP called with access_type = ", access_type);
        return this._http
        .put(`${environment.apiUrl}${url}`, formData, {
          headers: httpOptions
        })
        .pipe(
          map(res => {
            if (res) {
              console.log("Form 3X save res = ", res);
              if (localStorage.getItem(`form_${formType}_report_type`) !== null) {
                const reportObj: form3xReportTypeDetails = JSON.parse(window.localStorage.getItem(`form_${formType}_report_type`));
                if (res['reportid']) {
                  reportObj.reportId = res['reportid'];
                  window.localStorage.setItem(`form_${formType}_report_type`, JSON.stringify(reportObj));
                }
              }
              return res;
            }
            return false;
          })
        );
      } else if (access_type==='Submitted'){
        console.log("signandSaveSubmitReport HTTP called with access_type = ", access_type);
        console.log("submit Report form 3X submitted...")
        return this._http
        .put(
          `${environment.apiUrl}${url}`,
          formData,
          {
            headers: httpOptions
          }
        )
        .pipe(map(res => {
            if (res) {
              console.log("submit Report form 3X submitted res = ", res)
              localStorage.removeItem(`form_${formType}_saved_backup`);
              localStorage.removeItem(`form_${formType}_report_type_backup`);
              return true;
            }
            return false;
        }));
      }
  }

  public printPreviewPdf(formType: string, callFrom: string): Observable<any> {
    let token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions = new HttpHeaders();
    let printPreviewPDFUrl: string = '/core/create_json_builders';
    //let printPreviewPDFUrl: string = '/core/create_json_builders_test';
    
    let saveReportUrl: string = '/core/reports';

    
    let params = new HttpParams();
    let formData: FormData = new FormData();

    console.log("printForm formType = ", formType);

    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let form3xReportType: any = JSON.parse(localStorage.getItem(`form_${formType}_report_type`));

    if (form3xReportType === null)
    {
      console.log("get backup object");
      form3xReportType = JSON.parse(localStorage.getItem(`form_${formType}_report_type_backup`));
      console.log("backup object form3xReportType = ", form3xReportType);
    }

    params = params.append('report_id', form3xReportType.reportId);
    params = params.append('form_type', `F${formType}`);
    params = params.append('call_from', callFrom);

    formData.append('form_type', `F${formType}`);
    formData.append('report_id', form3xReportType.reportId);
    formData.append('report_type', form3xReportType.reportType);
    formData.append('cvg_start_dt', form3xReportType.cvgStartDate);
    formData.append('cvg_end_dt', form3xReportType.cvgEndDate);
    formData.append('due_dt', form3xReportType.dueDate);

    if (form3xReportType.hasOwnProperty('amend_Indicator')) {
      if (typeof form3xReportType.amend_Indicator === 'string') {
        if (form3xReportType.amend_Indicator.length >= 1) {
          formData.append('amend_ind', form3xReportType.amend_Indicator);
        } else {
          formData.append('amend_ind', 'N');
        }
      }
    } else {
      formData.append('amend_ind', 'N');
    }

    if (form3xReportType.hasOwnProperty('coh_bop')) {
      if (typeof form3xReportType.coh_bop === 'string') {
        if (form3xReportType.coh_bop.length >= 1) {
          formData.append('coh_bop', form3xReportType.coh_bop);
        }
      } else {
        formData.append('coh_bop', '0');
      }
    } else {
      formData.append('coh_bop', '0');
    }

    if (typeof form3xReportType.electionCode === 'string') {
      if (form3xReportType.electionCode.length >= 1) {
        formData.append('election_code', form3xReportType.electionCode);
      }
    }

    if (form3xReportType.election_date !== null) {
      if (typeof form3xReportType.election_date === 'string') {
        if (form3xReportType.election_date.length >= 1) {
          formData.append('date_of_election', form3xReportType.election_date);
        }        
      }
    }

    if (form3xReportType.election_state !== null) {
      if (typeof form3xReportType.election_state === 'string') {
        if (form3xReportType.election_state.length >= 1) {
          formData.append('state_of_election', form3xReportType.election_state);
        }
      }
    }

    formData.append('status', 'Saved');
    

    if (form3xReportType.email1 !== null) {
      if (typeof form3xReportType.email1 === 'string') {
        if (form3xReportType.email1.length >= 1) {
          formData.append('email_1', form3xReportType.email1);
        }
      }
    }

    if (form3xReportType.email2 !== null) {
      if (typeof form3xReportType.email2 === 'string') {
        if (form3xReportType.email2.length >= 1) {
          formData.append('email_2', form3xReportType.email2);
        }
      }
    }

    if (form3xReportType.additionalEmail1 !== null) {
      if (typeof form3xReportType.additionalEmail1 === 'string') {
        if (form3xReportType.additionalEmail1.length >= 1) {
          formData.append('additional_email_1', form3xReportType.additionalEmail1);
        }
      }
    }
    
    console.log("form3xReportType.additionalEmail2 = ",form3xReportType.additionalEmail2);
    if (form3xReportType.additionalEmail2 !== null) {
      if (typeof form3xReportType.additionalEmail2 === 'string') {
        if (form3xReportType.additionalEmail2.length >= 1) {
          formData.append('additional_email_2', form3xReportType.additionalEmail2);
        }
      }
    }

      
    return this._http
    .put(`${environment.apiUrl}${saveReportUrl}`, formData, {
      headers: httpOptions
    })
    .pipe(
      map(res => {
        if (res) {
          console.log("Form 3X save res = ", res);
           if (res['reportid']) {
              console.log(" Form 3X report updated with res = ", res);

              return this._http
              .get(
                  `${environment.apiUrl}${printPreviewPDFUrl}`,
                  {
                  headers: httpOptions,
                  params
                  }
              );
          }
          //return res;
          console.log("Form 3X report updated successfully... ");
        }
        console.log("Form 3X report not updated successfully... ");
      })
    );
   
  }

}
