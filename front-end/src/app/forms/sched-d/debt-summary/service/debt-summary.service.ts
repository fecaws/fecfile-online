import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';
import { OrderByPipe } from 'src/app/shared/pipes/order-by/order-by.pipe';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { ReportTypeService } from 'src/app/forms/form-3x/report-type/report-type.service';
import { DatePipe } from '@angular/common';
import { DebtSummaryModel } from '../model/debt-summary.model';

/**
 * The service for Debt Summary
 */
@Injectable({
  providedIn: 'root'
})
export class DebtSummaryService {
  constructor(
    private _http: HttpClient,
    private _cookieService: CookieService,
    private _datePipe: DatePipe,
    private _orderByPipe: OrderByPipe,
    private _reportTypeService: ReportTypeService
  ) {}

  /**
   * Get the Debts comprising the Debt Summary.
   */
  public getDebts(): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions = new HttpHeaders();
    const url = '/sd/schedD';
    const reportId: string = this._reportTypeService.getReportIdFromStorage('3X').toString();

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let params = new HttpParams();
    params = params.append('report_id', reportId);

    return this._http
      .get(`${environment.apiUrl}${url}`, {
        headers: httpOptions,
        params
      })
      .pipe(
        map(res => {
          if (res) {
            return res;
          }
          return false;
        })
      );
  }

  public deleteDebt(debt: DebtSummaryModel): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions = new HttpHeaders();
    const url = '/sd/schedD';
    const reportId: string = this._reportTypeService.getReportIdFromStorage('3X').toString();

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    let params = new HttpParams();
    params = params.append('transaction_id', debt.transactionId);
    params = params.append('report_id', reportId);

    return this._http
      .delete(`${environment.apiUrl}${url}`, {
        params,
        headers: httpOptions
      })
      .pipe(
        map(res => {
          if (res) {
            console.log('get_outstanding_loans API res: ', res);

            return res;
          }
          return false;
        })
      );
  }

  /**
   * Sort Debt summary items.
   *
   * @param array
   * @param sortColumnName
   * @param descending
   */
  public sortDebtSummary(array: any, sortColumnName: string, descending: boolean) {
    const direction = descending ? -1 : 1;
    this._orderByPipe.transform(array, { property: sortColumnName, direction: direction });
    return array;
  }

  /**
   * Map server fields from the response to the model.
   *
   * TODO The API should be changed to pass the property names expected by the front end.
   */
  public mapFromServerFields(serverData: any): DebtSummaryModel[] {
    if (!serverData || !Array.isArray(serverData)) {
      return;
    }
    const modelArray = [];
    for (const row of serverData) {
      const model = new DebtSummaryModel({});
      model.selected = false;
      model.toggleChild = false;
      model.apiCall = row.api_call;
      model.transactionTypeIdentifier = row.transaction_type_identifier;
      model.transactionTypeDescription = row.transaction_type_description;
      model.scheduleType = row.schedule_type;
      model.transactionId = row.transaction_id;
      model.backRefTransactionId = row.back_ref_transaction_id;
      model.child = this._mapChildFromServerFields(row.child);
      model.entityType = row.entity_type;
      this._setDebtName(row);
      model.name = row.name;
      model.beginningBalance = row.beginning_balance ? row.beginning_balance : 0;
      model.incurredAmt = row.incurred_amount ? row.incurred_amount : 0;
      model.paymentAmt = row.payment_amount ? row.payment_amount : 0;
      model.closingBalance = row.balance_at_close ? row.balance_at_close : 0;
      modelArray.push(model);
    }
    return modelArray;
  }

  /**
   * Map server fields from the response to the model for the child payment.
   */
  private _mapChildFromServerFields(serverData: any): DebtSummaryModel[] {
    if (!serverData || !Array.isArray(serverData)) {
      return;
    }
    const modelArray = [];
    for (const row of serverData) {
      const model = new DebtSummaryModel({});
      model.selected = false;
      model.toggleChild = false;
      model.apiCall = row.api_call;
      model.transactionTypeIdentifier = row.transaction_type_identifier;
      model.transactionTypeDescription = row.transaction_type_description;
      model.scheduleType = row.schedule_type;
      model.transactionId = row.transaction_id;
      model.backRefTransactionId = row.back_ref_transaction_id;
      model.entityType = row.entity_type;
      this._setDebtName(row);
      model.name = row.name;
      model.paymentAmt = row.expenditure_amount ? row.expenditure_amount : 0;
      model.paymentDate = row.expenditure_date;
      modelArray.push(model);
    }
    return modelArray;
  }

  private _setDebtName(debt: any): void {
    const lastName = debt.last_name ? debt.last_name.trim() : '';
    const firstName = debt.first_name ? debt.first_name.trim() : '';
    const middleName = debt.middle_name ? debt.middle_name.trim() : '';
    const suffix = debt.suffix ? debt.suffix.trim() : '';
    const prefix = debt.prefix ? debt.prefix.trim() : '';

    if (debt.entity_type === 'IND' || debt.entity_type === 'CAN') {
      debt.name = `${lastName}, ${firstName}, ${middleName}, ${prefix}, ${suffix}`;
    } else {
      if (debt.hasOwnProperty('entity_name')) {
        debt.name = debt.entity_name;
      }
    }
  }
}
