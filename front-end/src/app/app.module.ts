import { HttpClientModule } from '@angular/common/http';
import { APP_INITIALIZER, CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AngularEditorModule } from '@kolkov/angular-editor';
import { NgbActiveModal, NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NgSelectModule } from '@ng-select/ng-select';
import { ArchwizardModule } from 'angular-archwizard';
import { AngularFileUploaderModule } from 'angular-file-uploader';
import { ModalModule } from 'ngx-bootstrap';
import { CollapseModule } from 'ngx-bootstrap/collapse';
import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { CookieService } from 'ngx-cookie-service';
import { NgxEditorModule } from 'ngx-editor';
import { NgxPaginationModule } from 'ngx-pagination';
import { NgPipesModule } from 'ngx-pipes';
import { AccountComponent } from './account/account.component';
import { AppConfigService } from './app-config.service';
import { AppLayoutComponent } from './app-layout/app-layout.component';
import { AppComponent } from './app.component';
import { routing } from './app.routes';
import { ContributorsComponent } from './contributors/contributors.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { F3xComponent } from './forms/form-3x/f3x/f3x.component';
import { FinancialSummaryComponent } from './forms/form-3x/financial-summary/financial-summary.component';
import { IndividualReceiptComponent } from './forms/form-3x/individual-receipt/individual-receipt.component';
import { ReportTypeSidebarComponent } from './forms/form-3x/report-type-sidebar/report-type-sidebar.component';
import { ReportTypeComponent } from './forms/form-3x/report-type/report-type.component';
import { TransactionSidebarComponent } from './forms/form-3x/transaction-sidebar/transaction-sidebar.component';
import { TransactionTypeComponent } from './forms/form-3x/transaction-type/transaction-type.component';
import { F99Component } from './forms/form-99/f99/f99.component';
import { ReasonComponent } from './forms/form-99/reason/reason.component';
import { TypeComponent } from './forms/form-99/type/type.component';
import { FormsComponent } from './forms/forms.component';
import { TransactionsFilterTypeComponent } from './forms/transactions/filter/filter-type/transactions-filter-type.component';
import { TransactionsFilterComponent } from './forms/transactions/filter/transactions-filter.component';
import { TransactionsTableComponent } from './forms/transactions/transactions-table/transactions-table.component';
import { TrashConfirmComponent } from './forms/transactions/transactions-table/trash-confirm/trash-confirm.component';
import { TransactionsComponent } from './forms/transactions/transactions.component';
import { LoginComponent } from './login/login.component';
import { ProfileComponent } from './profile/profile.component';
import { ReportdetailsComponent } from './reports/reportdetails/reportdetails.component';
import { ReportheaderComponent } from './reports/reportheader/reportheader.component';
import { ReportsComponent } from './reports/reports.component';
import { ReportsFilterTypeComponent } from './reports/reportsidebar/filter-type/reports-filter-type.component';
import { ReportsidebarComponent } from './reports/reportsidebar/reportsidebar.component';
import { SettingsComponent } from './settings/settings.component';
import { ConfirmModalComponent } from './shared/partials/confirm-modal/confirm-modal.component';
import { HeaderComponent } from './shared/partials/header/header.component';
import { PreviewComponent } from './shared/partials/preview/preview.component';
import { SidebarComponent } from './shared/partials/sidebar/sidebar.component';
import { SignComponent } from './shared/partials/sign/sign.component';
import { StepsComponent } from './shared/partials/steps/steps.component';
import { SubmitComponent } from './shared/partials/submit/submit.component';
import { ValidateComponent } from './shared/partials/validate/validate.component';
import { FilterPipe } from './shared/pipes/filter/filter.pipe';
import { OrderByPipe } from './shared/pipes/order-by/order-by.pipe';
import { SafeHTMLPipe } from './shared/pipes/safeHTML/safe-html.pipe';
import { ZipCodePipe } from './shared/pipes/zip-code/zip-code.pipe';
import { CanDeactivateGuardService } from './shared/services/CanDeactivateGuard/can-deactivate-guard.service';
import { DialogService } from './shared/services/DialogService/dialog.service';
import { CanActivateGuard } from './shared/utils/can-activate/can-activate.guard';
import { ToolsCreateBackupComponent } from './tools-create-backup/tools-create-backup.component';
import { ToolsExportNamesComponent } from './tools-export-names/tools-export-names.component';
import { ToolsImportNamesComponent } from './tools-import-names/tools-import-names.component';
import { ToolsImportTransactionsComponent } from './tools-import-transactions/tools-import-transactions.component';
import { ToolsMergeNamesComponent } from './tools-merge-names/tools-merge-names.component';
import { ToolsComponent } from './tools/tools.component';
import { UsersComponent } from './users/users.component';
import { ContactsComponent } from './contacts/contacts.component';
import { ContactsTableComponent } from './contacts/contacts-table/contacts-table.component';
import { ContactsFilterComponent } from './contacts/filter/contacts-filter.component';
import { AddNewContactComponent } from './contacts/addnew/addnew_contacts.component';
import { TypeaheadComponent } from './shared/partials/typeahead/typeahead.component';
import { SubTransactionsTableComponent } from './forms/transactions/sub-transactions-table/sub-transactions-table.component';
import { DecimalPipe } from '@angular/common';
import { UtilService } from './shared/utils/util.service';
import { UserIdleModule } from 'angular-user-idle';
import { SchedFComponent } from './forms/sched-f/sched-f.component';

import { SchedH1Component } from './forms/form-3x/sched-h1/sched-h1.component';





const appInitializerFn = (appConfig: AppConfigService) => {
  return () => {
    return appConfig.loadAppConfig();
  };
};

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    DashboardComponent,
    ProfileComponent,
    HeaderComponent,
    SidebarComponent,
    FormsComponent,
    AppLayoutComponent,
    ReportsComponent,
    ContributorsComponent,
    ToolsComponent,
    TransactionsComponent,
    TransactionsTableComponent,
    TransactionsFilterComponent,
    TransactionsFilterTypeComponent,
    SubTransactionsTableComponent,
    TrashConfirmComponent,
    F99Component,
    TypeComponent,
    ReasonComponent,
    StepsComponent,
    PreviewComponent,
    ValidateComponent,
    SignComponent,
    TypeaheadComponent,
    SubmitComponent,
    AccountComponent,
    UsersComponent,
    SettingsComponent,
    ToolsImportTransactionsComponent,
    ToolsImportNamesComponent,
    ToolsExportNamesComponent,
    ToolsMergeNamesComponent,
    ToolsCreateBackupComponent,
    ConfirmModalComponent,
    TransactionSidebarComponent,
    F3xComponent,
    TransactionTypeComponent,
    ReportTypeComponent,
    ReportTypeSidebarComponent,
    FinancialSummaryComponent,
    OrderByPipe,
    ZipCodePipe,
    FilterPipe,
    IndividualReceiptComponent,
    ReportsidebarComponent,
    ReportheaderComponent,
    ReportdetailsComponent,
    SafeHTMLPipe,
    ReportsFilterTypeComponent,
    ContactsComponent,
    ContactsTableComponent,
    AddNewContactComponent,
    ContactsFilterComponent,
    SchedFComponent,
    SchedH1Component

  ],
  entryComponents: [ConfirmModalComponent, TrashConfirmComponent],
  imports: [
    BrowserModule,
    NgSelectModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    HttpModule,
    BrowserAnimationsModule,
    routing,
    AngularFileUploaderModule,
    ArchwizardModule,
    NgxEditorModule,
    TooltipModule.forRoot(),
    CollapseModule.forRoot(),
    AngularEditorModule,
    NgbModule.forRoot(),
    ModalModule.forRoot(),
    NgxPaginationModule,
    NgPipesModule,
    UserIdleModule.forRoot({ idle: 1200, timeout: 120, ping: 500000 })
  ],
  providers: [
    CookieService,
    CanActivateGuard,
    DialogService,
    CanDeactivateGuardService,
    AppConfigService,
    NgbActiveModal,
    {
      provide: APP_INITIALIZER,
      useFactory: appInitializerFn,
      multi: true,
      deps: [AppConfigService]
    },
    DecimalPipe,
    UtilService
  ],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
