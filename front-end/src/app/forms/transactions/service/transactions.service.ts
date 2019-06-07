import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import 'rxjs/add/observable/of';
import { CookieService } from 'ngx-cookie-service';
import { environment } from '../../../../environments/environment';
import { TransactionModel } from '../model/transaction.model';
import { OrderByPipe } from 'src/app/shared/pipes/order-by/order-by.pipe';
import { FilterPipe, FilterTypeEnum } from 'src/app/shared/pipes/filter/filter.pipe';
import { TransactionFilterModel } from '../model/transaction-filter.model';
import { DatePipe } from '@angular/common';
import { ZipCodePipe } from 'src/app/shared/pipes/zip-code/zip-code.pipe';
import { map } from 'rxjs/operators';

export interface GetTransactionsResponse {
  transactions: TransactionModel[];
  totalAmount: number;
  totalTransactionCount: number;

  // remove after API is renamed.
  itemsPerPage: number;
  'total pages': number;
}

@Injectable({
  providedIn: 'root'
})
export class TransactionsService {

  // only for mock data
  private mockRestoreTrxArray = [];
  private mockTrxArray = [];
  private mockRecycleBinArray = [];
  private mockTransactionId = 'TID12345';
  private mockTransactionIdRecycle = 'TIDRECY';
  // only for mock data - end

  // May only be needed for mocking server
  private _orderByPipe: OrderByPipe;
  private _filterPipe: FilterPipe;
  private _zipCodePipe: ZipCodePipe;
  private _datePipe: DatePipe;
  private _propertyNameConverterMap: Map<string, string> = new Map([
    ['zip', 'zip_code'],
  ]);


  constructor(
    private _http: HttpClient,
    private _cookieService: CookieService,
  ) {
    // mock out the recycle trx
    for (let i = 0; i < 13; i++) {
      const t1: any = this.createMockTrx();
      t1.transaction_id = this.mockTransactionIdRecycle + i;
      this.mockRestoreTrxArray.push(t1);
    }

    this._orderByPipe = new OrderByPipe();
    this._filterPipe = new FilterPipe();
    this._zipCodePipe = new ZipCodePipe();
    this._datePipe = new DatePipe('en-US');
  }


  /**
   * Gets the transactions for the form type.
   *
   * @param      {String}   formType      The form type of the transaction to get
   * @return     {Observable}             The form being retreived.
   */
  public getFormTransactions(
      formType: string,
      reportId: string,
      page: number,
      itemsPerPage: number,
      sortColumnName: string,
      descending: boolean,
      filters: TransactionFilterModel): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions =  new HttpHeaders();
    // let params = new HttpParams();
    const formData: FormData = new FormData();
    const url = '/core/get_all_transactions';

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    const serverSortColumnName = this.mapToSingleServerName(sortColumnName);

        const request: any = {};

    /////////////////////////////////
    /////////////////////////////////
    /////////////////////////////////

    // This is a temp patch/fix for and issue where
    // report ID is not in local storage when user clicks
    // View Transactions from the Individual Receipt compoent.
    // It is here for development purposes only.  Not for production.

    // if (reportId === '0') {
    //   console.log('WARNING: Using default Report ID 1206963 for development reasons as no value ' +
    //     'was present in localStorage for form_F3X_report_type from IndividualReceiptComponent');
    //   reportId = '431'; // '1206963';
    // }

    /////////////////////////////////
    /////////////////////////////////
    //////////////////////////////////

    request.reportid = reportId;
    request.page = page;
    request.itemsPerPage = itemsPerPage;
    request.sortColumnName = sortColumnName;
    request.descending = descending;

    // if (filters) {
    //   request.filters = filters;
    //   if (request.filters.keywords) {
    //     const keywordsEdited = [];
    //     for (const keyword of request.filters.keywords) {
    //       // replace ` and " with ' for backend.
    //       let kw = keyword.replace(/\"/g, `'`);
    //       kw = kw.replace(/`/g, `'`);
    //       keywordsEdited.push(kw);
    //     }
    //     request.filters.keywords = keywordsEdited;
    //   }
    // }

    if (filters) {
      request.filters = filters;
      if (request.filters.keywords) {
        const keywordsEdited = [];
        for (const keyword of request.filters.keywords) {
          // replace ` and " with ' for backend.
          let kw = keyword.replace(/\"/g, `'`);
          kw = kw.replace(/`/g, `'`);
          keywordsEdited.push(kw);
        }
        request.filters.keywords = keywordsEdited;
      } else {
        request.filters.keywords = [];
      }
    } else {
      const emptyFilters: any = {};
      emptyFilters.keywords = [];

      request.filters = emptyFilters;
    }

    return this._http
    .post(
      `${environment.apiUrl}${url}`,
      request,
      {
        headers: httpOptions
      }
    )
    .pipe(map(res => {
        if (res) {
          console.log('res: ', res);

          return res;
        }
        return false;
    }));


    // return this._http
    // .get(
    //     `${environment.apiUrl}${url}`,
    //     {
    //       headers: httpOptions,
    //       params
    //     }
    //   );
  }


  /**
   * Map server fields from the response to the model.
   */
  public mapFromServerFields(serverData: any) {
    if (!serverData || !Array.isArray(serverData)) {
      return;
    }
    const modelArray = [];
    for (const row of serverData) {
      const model = new TransactionModel({});
      model.type = row.transaction_type_desc;
      model.transactionId = row.transaction_id;
      model.name = row.name;
      // model.street = row.street_1 + (row.street_2 ? ' ' + row.street_2 : '');
      model.street = row.street_1;
      model.street2 = row.street_2;
      model.city = row.city;
      model.state = row.state;
      model.zip = row.zip_code;

      // this._propertyNameConverterMap.get('zip');

      model.date = row.transaction_date;
      model.amount = row.transaction_amount;
      model.aggregate = row.aggregate_amt ? row.aggregate_amt : 0;
      model.purposeDescription = row.purpose_description;
      model.contributorEmployer = row.employer;
      model.contributorOccupation = row.occupation;
      model.memoCode = row.memo_code;
      model.memoText = row.memo_text;
      model.deletedDate = row.deleted_date ? row.deleted_date : null;
      modelArray.push(model);
    }
    return modelArray;
  }


  /**
   * Map a single field name to its server field name equivalent.
   *
   * TODO Too many places where fields names are referenced when converting
   * from/to server names.  Need to consolidate.
   */
  public mapToSingleServerName(appFieldName: string) {

    // TODO map field names in constructor
    let name = '';

    // if (appFieldName === 'zip') {
    //   this._propertyNameConverterMap.get(appFieldName);
    // }

    name = appFieldName;
    switch (appFieldName) {
      case 'type':
        name = 'transaction_type_desc';
        break;
      case 'transactionId':
        name = 'transaction_id';
        break;
      case 'street':
        name = 'street_1';
        break;
      case 'street2':
        name = 'street_2';
        break;
      case 'zip':
        name = 'zip_code';
        break;
      case 'date':
        name = 'transaction_date';
        break;
      case 'amount':
        name = 'transaction_amount';
        break;
      case 'purposeDescription':
        name = 'purpose_description';
        break;
      case 'contributorEmployer':
        name = 'employer';
        break;
      case 'contributorOccupation':
        name = 'occupation';
        break;
      case 'memoCode':
        name = 'memo_code';
        break;
      case 'memoText':
        name = 'memo_text';
        break;
      case 'deletedDate':
        name = 'deleted_date';
        break;
      default:
        // name = name;;
    }
    return name ? name : '';

  }


  /**
   * Map front-end model fields to server fields.
   */
  public mapToServerFields(model: TransactionModel) {

    const serverObject: any = {};
    if (!model) {
      return serverObject;
    }

    serverObject.transaction_type_desc = model.type;
    serverObject.transaction_id = model.transactionId;
    serverObject.name =  model.name;
    serverObject.street_1 = model.street;
    serverObject.street_2 = model.street2;
    serverObject.city = model.city;
    serverObject.state = model.state;
    serverObject.zip_code = model.zip;
    serverObject.transaction_date = model.date;
    serverObject.transaction_amount = model.amount;
    serverObject.aggregate = model.aggregate;
    serverObject.purpose_description = model.purposeDescription;
    serverObject.employer = model.contributorEmployer;
    serverObject.occupation = model.contributorOccupation;
    serverObject.memo_code = model.memoCode;
    serverObject.memo_text = model.memoText;

    return serverObject;
  }

  // TODO remove once server is ready and mock data is no longer needed
  public mockApplyRestoredTransaction(response: any) {
    for (const trx of this.mockRecycleBinArray) {
      response.transactions.push(trx);
      response.totalAmount += trx.transaction_amount;
      response.totalTransactionCount++;
    }
  }


  /**
   * Some data from the server is formatted for display in the UI.  Users will search
   * on the reformatted data.  For the search filter to work against the formatted data,
   * the server array must also contain the formatted data.  They will be added later.
   * 
   * This may be neeeded.
   *
   * @param response the server data
   */
  public mockAddUIFileds(response: any) {
    if (!response) {
      return;
    }
    if (!response.transactions) {
      return;
    }
    for (const trx of response.transactions) {
      trx.transaction_amount_ui = `$${trx.transaction_amount}`;
      trx.transaction_date_ui = this._datePipe.transform(trx.transaction_date, 'MM/dd/yyyy');
      trx.deleted_date_ui = this._datePipe.transform(trx.deleted_date, 'MM/dd/yyyy');
      trx.zip_code_ui = this._zipCodePipe.transform(trx.zip_code);
    }
  }


  /**
   * This method handles filtering the transactions array and will be replaced
   * by a backend API.
   */
  public mockApplyFilters(response: any, filters: TransactionFilterModel) {

    if (!response.transactions) {
      return;
    }

    if (!filters) {
      return;
    }

    let isFilter = false;

    if (filters.keywords) {
      if (response.transactions.length > 0 && filters.keywords.length > 0) {
        isFilter = true;

        const fields = [ 'city', 'employer', 'occupation',
          'memo_code', 'memo_text', 'name', 'purpose_description', 'state',
          'street_1', 'transaction_id', 'transaction_type_desc', 'aggregate',
          'transaction_amount_ui', 'transaction_date_ui', 'deleted_date_ui', 'zip_code_ui'];

        for (let keyword of filters.keywords) {
          let filterType = FilterTypeEnum.contains;
          keyword = keyword.trim();
          if ((keyword.startsWith('"') && keyword.endsWith('"')) ||
              keyword.startsWith(`'`) && keyword.endsWith(`'`)) {
            filterType = FilterTypeEnum.exact;
            keyword = keyword.valueOf().substring(1, keyword.length - 1);
          }
          const filtered = this._filterPipe.transform(response.transactions, fields, keyword, filterType);
          response.transactions = filtered;
        }
      }
    }

    if (filters.filterStates) {
      if (filters.filterStates.length > 0) {
        isFilter = true;
        const fields = ['state'];
        let filteredStateArray = [];
        for (const state of filters.filterStates) {
          const filtered = this._filterPipe.transform(response.transactions, fields, state);
          filteredStateArray = filteredStateArray.concat(filtered);
        }
        response.transactions = filteredStateArray;
      }
    }

    if (filters.filterCategories) {
      if (filters.filterCategories.length > 0) {
        isFilter = true;
        const fields = ['transaction_type_desc'];
        let filteredCategoryArray = [];
        for (const category of filters.filterCategories) {
          const filtered = this._filterPipe.transform(response.transactions, fields, category);
          filteredCategoryArray = filteredCategoryArray.concat(filtered);
        }
        response.transactions = filteredCategoryArray;
      }
    }

    if (filters.filterAmountMin !== null && filters.filterAmountMax !== null) {
      isFilter = true;
      if (filters.filterAmountMin >= 0 && filters.filterAmountMax >= 0 &&
          filters.filterAmountMin <= filters.filterAmountMax) {
        const filteredAmountArray = [];
        for (const trx of response.transactions) {
          if (trx.transaction_amount) {
            if (trx.transaction_amount >= filters.filterAmountMin &&
              trx.transaction_amount <= filters.filterAmountMax) {
                filteredAmountArray.push(trx);
            }
          }
        }
        response.transactions = filteredAmountArray;
      }
    }

    if (filters.filterDateFrom && filters.filterDateTo) {
      const filterDateFromDate = new Date(filters.filterDateFrom);
      const filterDateToDate = new Date(filters.filterDateTo);
      const filteredDateArray = [];
      for (const trx of response.transactions) {
        if (trx.transaction_date) {
          const trxDate = new Date(trx.transaction_date);
          if (trxDate >= filterDateFromDate &&
              trxDate <= filterDateToDate) {
            isFilter = true;
            filteredDateArray.push(trx);
          }
        }
      }
      response.transactions = filteredDateArray;
    }

    if (filters.filterMemoCode === true) {
      isFilter = true;
      const filteredMemoCodeArray = [];
      for (const trx of response.transactions) {
        if (trx.memo_code) {
          if (trx.memo_code.length > 0) {
            filteredMemoCodeArray.push(trx);
          }
        }
      }
      response.transactions = filteredMemoCodeArray;
    }

    if (isFilter) {
      response.totalAmount = 0;
      response.totalTransactionCount = 0;
      for (const trx of response.transactions) {
        if (!trx.memo_code) {
          response.totalAmount += trx.transaction_amount;
        }
        response.totalTransactionCount++;
      }
    }
  }


  /**
   *
   * @param array
   * @param sortColumnName
   * @param descending
   */
  public sortTransactions(array: any, sortColumnName: string, descending: boolean) {
    const direction = descending ? -1 : 1;
    this._orderByPipe.transform(array, {property: sortColumnName, direction: direction});
    return array;
  }


  /**
   * Gets the transactions for the form.
   *
   * @param      {String}   formType      The form type of the transaction to get
   * @return     {Observable}             An Observable of type `any` containing the transactions
   */
  public getUserDeletedTransactions(formType: string): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions =  new HttpHeaders();
    let params = new HttpParams();
    const url = '';

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    params = params.append('formType', formType);

    // return this._http
    //  .get(
    //     `${environment.apiUrl}${url}`,
    //     {
    //       headers: httpOptions,
    //       params
    //     }
    //   );

    const mockResponse: GetTransactionsResponse = {
      transactions: this.mockRestoreTrxArray,
      totalAmount: 0,
      totalTransactionCount: this.mockRestoreTrxArray.length,

      // remove after API is renamed.
      itemsPerPage: 5,
      'total pages': 0
    };
    return Observable.of(mockResponse);
  }


  /**
   * Restore the transaction from the Recyling Bin back to the Transactions Table.
   *
   * @param trx the transaction to restore
   */
  public restoreTransaction(trx: TransactionModel): Observable<any> {


    // mocking the server API until it is ready.

    const index = this.mockRestoreTrxArray.findIndex(
      item => item.transaction_id === trx.transactionId);

    if (index !== -1) {
      this.mockRestoreTrxArray.splice(index, 1);
      this.mockRecycleBinArray.push(this.mapToServerFields(trx));
    }

    return Observable.of('');
  }


  /**
   * Delete transactions from the Recyling Bin.
   *
   * @param transactions the transactions to delete
   */
  public deleteRecycleBinTransaction(transactions: Array<TransactionModel>): Observable<any> {


    // mocking the server API until it is ready.

    for (const trx of transactions) {
      const index = this.mockRestoreTrxArray.findIndex(
        item => item.transaction_id === trx.transactionId);

      if (index !== -1) {
        this.mockRestoreTrxArray.splice(index, 1);
      }
    }

    return Observable.of('');
  }


  /**
   * Get US States.
   *
   * TODO replace with the appropriate API call when it is available.
   */
  public getStates(formType: string, transactionType: string): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    const url = '/core/get_dynamic_forms_fields';
    let httpOptions =  new HttpHeaders();
    let params = new HttpParams();

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    params = params.append('form_type', `F${formType}`);
    params = params.append('transaction_type', transactionType);

    return this._http
        .get(
          `${environment.apiUrl}${url}`,
          {
            headers: httpOptions,
            params
          }
        );
   }


  /**
   * Get transaction category types
   * 
   * @param formType
   */
  public getTransactionCategories(formType: string): Observable<any> {
    const token: string = JSON.parse(this._cookieService.get('user'));
    let httpOptions =  new HttpHeaders();
    let url = '';
    let params = new HttpParams();

    url = '/core/get_transaction_categories';

    httpOptions = httpOptions.append('Content-Type', 'application/json');
    httpOptions = httpOptions.append('Authorization', 'JWT ' + token);

    params = params.append('form_type', `F${formType}`);

    return this._http
       .get(
          `${environment.apiUrl}${url}`,
          {
            params,
            headers: httpOptions
          }
       );
  }


  private createMockTrx() {
    const t1: any = {};
    t1.aggregate = 1000;
    t1.transaction_amount = 1500;
    t1.city = 'New York';
    t1.employer = 'Exxon';
    t1.occupation = 'Lawyer';
    const date = new Date('2019-01-01');
    t1.transaction_date = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
    const deletedDate = new Date('2019-03-15');
    t1.deleted_date = deletedDate.getFullYear() + '-' + (deletedDate.getMonth() + 1) + '-' + deletedDate.getDate();
    t1.memo_code = 'Memo Code';
    t1.memo_text = 'The memo text';
    t1.name = 'Mr. John Doe';
    t1.purpose_description = 'The purpose of this is to...';
    t1.selected = false;
    t1.state = 'NY';
    t1.street_1 = '7th Avenue';
    t1.transaction_id = this.mockTransactionId;
    t1.transaction_type_desc = 'Individual';
    t1.zip_code = '22222';

    return t1;
  }

}
