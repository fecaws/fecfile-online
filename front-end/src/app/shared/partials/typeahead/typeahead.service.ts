import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import 'rxjs/add/observable/of';
import { CookieService } from 'ngx-cookie-service';
import { environment } from '../../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class TypeaheadService {
  constructor(private _http: HttpClient, private _cookieService: CookieService) {}

  /**
   * Get contacts starting with the search string by field name.
   * For example, search last_name startng with 'Jon' should return
   * contact with a Last Name of Jones, Jonston, Jonesby, etc.
   *
   * @param searchString the value keyed by the user to search with.
   * @param fieldName the field choosen by the user to search on.
   *  Possible fields are 'entity_name', 'first_name', 'last_name'.
   */
  public getContacts(searchString: string, fieldName: string): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    const url = '/core/autolookup_search_contacts';
    let httpOptions = new HttpHeaders();
    let params = new HttpParams();

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    if (!searchString) {
      return;
    }

    if (
      fieldName === 'entity_name' ||
      fieldName === 'first_name' ||
      fieldName === 'last_name' ||
      fieldName === 'cmte_id' ||
      fieldName === 'cmte_name'
    ) {
      params = params.append(fieldName, searchString);
    } else {
      if (fieldName) {
        console.log(`invalid field name for ${url} of ${fieldName}`);
      } else {
        console.log(`invalid field name for ${url}`);
      }
      return Observable.of([]);
    }

    return this._http.get(`${environment.apiUrl}${url}`, {
      headers: httpOptions,
      params
    });
  }
}
