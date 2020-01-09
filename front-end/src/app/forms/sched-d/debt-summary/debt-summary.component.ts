import {
  Component,
  OnInit,
  ViewEncapsulation,
  Output,
  EventEmitter,
  Input,
  SimpleChanges,
  OnChanges
} from '@angular/core';
import { trigger, transition, style, animate } from '@angular/animations';
import { PaginationInstance } from 'ngx-pagination';
import { TableService } from 'src/app/shared/services/TableService/table.service';
import { UtilService } from 'src/app/shared/utils/util.service';
import { DialogService } from 'src/app/shared/services/DialogService/dialog.service';
import { SortableColumnModel } from 'src/app/shared/services/TableService/sortable-column.model';
import { DebtSummaryService } from './service/debt-summary.service';
import { DebtSummaryModel } from './model/debt-summary.model';
import {
  ConfirmModalComponent,
  ModalHeaderClassEnum
} from 'src/app/shared/partials/confirm-modal/confirm-modal.component';
import { TransactionsService, GetTransactionsResponse } from '../../transactions/service/transactions.service';
import { ReportTypeService } from '../../form-3x/report-type/report-type.service';
import { TransactionModel } from '../../transactions/model/transaction.model';
import { mockChildPayments } from './mock.json';

export enum DebtSumarysActions {
  add = 'add',
  edit = 'edit'
}

@Component({
  selector: 'app-debt-summary',
  templateUrl: './debt-summary.component.html',
  styleUrls: ['./debt-summary.component.scss'],
  encapsulation: ViewEncapsulation.None,
  providers: [DebtSummaryService],
  animations: [
    trigger('fadeInOut', [
      transition(':enter', [style({ opacity: 0 }), animate(500, style({ opacity: 1 }))]),
      transition(':leave', [animate(0, style({ opacity: 0 }))])
    ])
  ]
})
export class DebtSummaryComponent implements OnInit, OnChanges {
  @Input()
  public forceChangeDetection: Date;

  @Input()
  public transactionType: string;

  @Input()
  public transactionTypeText: string;

  @Output()
  public status: EventEmitter<any> = new EventEmitter<any>();

  public debtModel: Array<DebtSummaryModel>;
  public totalAmount: number;
  public bulkActionDisabled = true;
  public bulkActionCounter = 0;

  // ngx-pagination config
  public maxItemsPerPage = 100;
  public directionLinks = false;
  public autoHide = true;
  public config: PaginationInstance;
  public numberOfPages = 0;

  private firstItemOnPage = 0;
  private lastItemOnPage = 0;
  public allDebtSelected: boolean;
  public p: number = 1;

  /**
   * Array of columns to be made sortable.
   */
  private sortableColumns: SortableColumnModel[] = [];

  /**
   * Identifies the column currently sorted by name.
   */
  private currentSortedColumnName: string;

  /**
   * Component constructor with service dependency service injections.
   *
   * @param _tableService
   * @param _utilService
   * @param _dialogService
   */
  constructor(
    private _tableService: TableService,
    private _utilService: UtilService,
    private _dialogService: DialogService,
    private _debtSummaryService: DebtSummaryService,
    private _transactionsService: TransactionsService
  ) {}

  /**
   * Initialize the component.
   */
  ngOnInit() {
    const paginateConfig: PaginationInstance = {
      id: 'forms__debt-summ-table-pagination',
      itemsPerPage: 3,
      currentPage: 1
    };
    this.config = paginateConfig;
    this.config.currentPage = 1;

    // TODO decide if sort settings are needed after leaving page.
    // Not supporting cachedVals as of original impl
    this.setSortableColumns();
    // this.getCachedValues();
    // this.cloneSortableColumns = this._utilService.deepClone(this.sortableColumns);

    this.getDebtSummaries();
  }

  /**
   * Get the debt summary data onChange.
   *
   * @param changes
   */
  public ngOnChanges(changes: SimpleChanges) {
    this.getDebtSummaries();
  }

  /**
   * Get the Debt Summaries for the Report
   */
  public getDebtSummaries(): void {
    this.debtModel = [];
    this.bulkActionCounter = 0;
    this.bulkActionDisabled = true;

    let sortedCol: SortableColumnModel = this._tableService.getColumnByName(
      this.currentSortedColumnName,
      this.sortableColumns
    );

    if (!sortedCol) {
      this.setSortDefault();
      sortedCol = this._tableService.getColumnByName(this.currentSortedColumnName, this.sortableColumns);
    }

    if (sortedCol) {
      if (sortedCol.descending === undefined || sortedCol.descending === null) {
        sortedCol.descending = false;
      }
    } else {
      sortedCol = new SortableColumnModel('', false, false, false, false);
    }

    this._debtSummaryService.getDebts(this.transactionType).subscribe((res: any) => {
      this.debtModel = [];

      const debtModelL = this._debtSummaryService.mapFromServerFields(res);
      this.debtModel = debtModelL;
      this.allDebtSelected = false;
    });
  }

  /**
   * Check/Uncheck all Debts in the table.
   */
  public changeAllDebtSummarysSelected() {
    // TODO Iterating over the model and setting the selected prop
    // works when we have server-side pagination as the model will only contain
    // Debt for the current page.

    // Until the server is ready for pagination,
    // we are getting the entire set of tranactions (> 500)
    // and must only count and set the selected prop for the items
    // on the current page.

    this.bulkActionCounter = 0;
    // for (const t of this.DebtModel) {
    //   t.selected = this.allDebtSelected;
    //   if (this.allDebtSelected) {
    //     this.bulkActionCounter++;
    //   }
    // }

    // TODO replace this with the commented code above when server pagination is ready.
    for (let i = this.firstItemOnPage - 1; i <= this.lastItemOnPage - 1; i++) {
      this.debtModel[i].selected = this.allDebtSelected;
      if (this.allDebtSelected) {
        this.bulkActionCounter++;
      }
    }
    this.bulkActionDisabled = !this.allDebtSelected;
  }

  /**
   * Check for multiple rows checked in the table
   * and disable/enable the bulk action button
   * accordingly.
   *
   * @param the event payload from the click
   */
  public checkForMultiChecked(e: any): void {
    if (e.target.checked) {
      this.bulkActionCounter++;
    } else {
      this.allDebtSelected = false;
      if (this.bulkActionCounter > 0) {
        this.bulkActionCounter--;
      }
    }
  }

  /**
   * Set the UI to show the default column sorted in the default direction.
   */
  private setSortDefault(): void {
    this.currentSortedColumnName = 'default';
  }

  /**
   * Wrapper method for the table service to set the class for sort column styling.
   *
   * @param colName the column to apply the class
   * @returns string of classes for CSS styling sorted/unsorted classes
   */
  public getSortClass(colName: string): string {
    return this._tableService.getSortClass(colName, this.currentSortedColumnName, this.sortableColumns);
  }

  /**
   * Change the sort direction of the table column.
   *
   * @param colName the column name of the column to sort
   */
  public changeSortDirection(colName: string): void {
    this.currentSortedColumnName = this._tableService.changeSortDirection(colName, this.sortableColumns);
    const direction = this._tableService.getBinarySortDirection(colName, this.sortableColumns);
    this.debtModel = this._debtSummaryService.sortDebtSummary(this.debtModel, this.currentSortedColumnName, direction);
  }

  /**
   * Get the SortableColumnModel by name.
   *
   * @param colName the column name in the SortableColumnModel.
   * @returns the SortableColumnModel matching the colName.
   */
  public getSortableColumn(colName: string): SortableColumnModel {
    for (const col of this.sortableColumns) {
      if (col.colName === colName) {
        return col;
      }
    }
    return new SortableColumnModel('', false, false, false, false);
  }

  /**
   * Set the Table Columns model.
   */
  private setSortableColumns(): void {
    const defaultSortColumns = [
      'name',
      'paymentDate',
      'beginningBalance',
      'incurredAmt',
      'paymentAmt',
      'closingBalance'
    ];
    const otherSortColumns = [];

    this.sortableColumns = [];
    for (const field of defaultSortColumns) {
      this.sortableColumns.push(new SortableColumnModel(field, false, true, true, false));
    }

    for (const field of otherSortColumns) {
      this.sortableColumns.push(new SortableColumnModel(field, false, false, false, true));
    }
  }

  /**
   * Print a Debt.
   */
  public printDebt(debt: DebtSummaryModel): void {
    alert('Print Debt is not yet supported');
  }

  /**
   * Print all Debts selected by the user.
   */
  public printAllSelected(): void {
    alert('Print all Debts is not yet supported');
  }

  /**
   * Export all Debts selected by the user.
   */
  public exportAllSelected(): void {
    alert('Export all Debts is not yet supported');
  }

  /**
   * Show edit for a debt transaction.
   */
  public editDebt(debt: DebtSummaryModel, payment: boolean) {
    const emptyValidForm = {};

    const transactionModel: any = {
      transactionId: debt.transactionId,
      type: debt.transactionTypeDescription,
      transactionTypeIdentifier: debt.transactionTypeIdentifier,
      apiCall: '/sd/schedD' // should come from API
    };
    if (payment) {
      transactionModel.scrollDebtPaymentButtonIntoView = true;
    }

    this.status.emit({
      form: emptyValidForm,
      direction: 'next',
      step: 'step_3',
      previousStep: 'step_2',
      action: DebtSumarysActions.edit,
      scheduleType: 'sched_d',
      returnToDebtSummary: true,
      returnToDebtSummaryInfo: {
        transactionType: this.transactionType,
        transactionTypeText: this.transactionTypeText
      },
      transactionDetail: {
        transactionModel: transactionModel
      }
    });
  }

  public editDebtPayment(debtPayment: DebtSummaryModel) {
    const emptyValidForm = {};
    this.status.emit({
      form: emptyValidForm,
      direction: 'next',
      step: 'step_3',
      previousStep: 'step_2',
      action: DebtSumarysActions.edit,
      scheduleType: debtPayment.scheduleType,
      transactionDetail: {
        transactionModel: {
          transactionId: debtPayment.transactionId,
          type: debtPayment.transactionTypeDescription,
          transactionTypeIdentifier: debtPayment.transactionTypeIdentifier,
          apiCall: debtPayment.apiCall
        }
      }
    });
  }

  /**
   * Trash the transaction selected by the user.
   *
   * @param debt the Transaction to trash
   */
  public trashDebt(debt: DebtSummaryModel): void {
    const trx = new TransactionModel({});
    trx.transactionId = debt.transactionId;
    this._dialogService
      .confirm(
        'You are about to delete this transaction ' + debt.transactionId + '.',
        ConfirmModalComponent,
        'Caution!'
      )
      .then(res => {
        if (res === 'okay') {
          this._debtSummaryService.deleteDebt(debt).subscribe((res2: any) => {
            this.getDebtSummaries();
            this._dialogService.confirm(
              'Transaction has been successfully deleted and sent to the recycle bin. ' + debt.transactionId,
              ConfirmModalComponent,
              'Success!',
              false,
              ModalHeaderClassEnum.successHeader
            );
          });
        } else if (res === 'cancel') {
        }
      });
  }

  /**
   * Trash the debt payment.
   *
   * @param payment the payment to trash
   */
  public trashDebtPayment(payment: DebtSummaryModel): void {
    const trx = new TransactionModel({});
    trx.transactionId = payment.transactionId;
    this._dialogService
      .confirm(
        'You are about to delete this transaction ' + payment.transactionId + '.',
        ConfirmModalComponent,
        'Caution!'
      )
      .then(res => {
        if (res === 'okay') {
          this._transactionsService
            .trashOrRestoreTransactions('3X', 'trash', payment.reportId, [trx])
            .subscribe((res: GetTransactionsResponse) => {
              this.getDebtSummaries();
              this._dialogService.confirm(
                'Transaction has been successfully deleted and sent to the recycle bin. ' + payment.transactionId,
                ConfirmModalComponent,
                'Success!',
                false,
                ModalHeaderClassEnum.successHeader
              );
            });
        } else if (res === 'cancel') {
        }
      });
  }
}
