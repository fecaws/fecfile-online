import { MessageService } from 'src/app/shared/services/MessageService/message.service';
import { ApiService } from './../../../shared/services/APIService/api.service';
import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnInit, ViewEncapsulation, Input, OnDestroy } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbTypeaheadSelectItemEvent } from '@ng-bootstrap/ng-bootstrap';
import { Observable, Subject } from 'rxjs';
import { debounceTime, distinctUntilChanged, switchMap, takeUntil } from 'rxjs/operators';
import { TypeaheadService } from '../../../shared/partials/typeahead/typeahead.service';

@Component({
  selector: 'app-f1m-qualification',
  templateUrl: './f1m-qualification.component.html',
  styleUrls: ['./f1m-qualification.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  encapsulation: ViewEncapsulation.None
})
export class F1mQualificationComponent implements  OnInit , OnDestroy{

  @Input() candidateNumber:number;
  @Input() qualificationData: any;

  private onDestroy$ = new Subject();
  
  public form:FormGroup;
  public formPart2:FormGroup;
  public formFields :any = [];
  public subTransactionTableType: any;
  public subTransactions: any;
  public subTransactionInfo: any;
  public width = '23px';
  public tooltipPlaceholder = 'Placeholder text';
  public showPart2:boolean = false;

  public candidate_offices=[];
  public states=[];

  

  constructor(
    private _fb: FormBuilder,
    private _typeaheadService: TypeaheadService,
    private _apiService: ApiService,
    private _cd: ChangeDetectorRef,
    private _messageService: MessageService
  ) { 
      this._messageService.getMessage().takeUntil(this.onDestroy$).subscribe(message =>{
        if(message && message.formType === 'f1m-qualification' && message.action ==='resetAndIncrement'){
          this.resetFormAndIncrementCandidate();
        }
        else if(message && message.formType === 'f1m-qualification' && message.action === 'showPart2'){
          this.showPart2 = true;
          this._cd.detectChanges();
        }
      })

  }

  public ngOnInit() {
    this.initStates();
    this.initCandidateOffices();
    this.initForm();
    this.initiFormPart2();
  }

  public ngOnDestroy(){
    this.onDestroy$.next(true);
  }


  private initStates() {
    this._apiService.getStates().subscribe((resp : any) => {
      if(resp && resp.data && resp.data.states){
        this.states = resp.data.states;
        this._cd.detectChanges();
      }
    });
  }
  
  private initCandidateOffices() {
    this._apiService.getOfficesSought().subscribe((resp : any)=>{
      if(resp && resp.data && resp.data.officeSought){
        this.candidate_offices = resp.data.officeSought;
        this._cd.detectChanges();
      }
    });       
  }

  private resetFormAndIncrementCandidate() {
    this.form.reset();
    this.candidateNumber++;
    this.form.patchValue({candidate_number:this.candidateNumber},{onlySelf:true});
  }

  public isShowChildTransactions(){
    return true;
  }

  public initForm() {
    this.form = this._fb.group({
      candidate_id: new FormControl(null, [Validators.required, Validators.maxLength(9)]),
      cand_last_name: new FormControl(null, [Validators.required, Validators.maxLength(100)]),
      cand_first_name: new FormControl(null, [Validators.required, Validators.maxLength(100)]),
      cand_middle_name: new FormControl(null, [Validators.maxLength(100)]),
      cand_prefix: new FormControl(null, [ Validators.maxLength(100)]),
      cand_suffix: new FormControl(null, [ Validators.maxLength(100)]),
      cand_office: new FormControl(null, [Validators.required, Validators.maxLength(100)]),
      cand_office_state: new FormControl(null, [Validators.required, Validators.maxLength(100)]),
      cand_office_district: new FormControl(null, [Validators.required, Validators.maxLength(100)]),
      contribution_date: new FormControl(null, [Validators.required, Validators.maxLength(100)]),
      candidate_number: new FormControl(this.candidateNumber)
    });
  }

  initiFormPart2() {
    this.formPart2 = this._fb.group({
      registration_date: new FormControl(null, [Validators.required]),
      fifty_first_contributor_date: new FormControl(null, [Validators.required]),
      requirements_met_date: new FormControl(null, [Validators.required])
    });
  }



  /**
   * Search for entities when Candidate ID input value changes.
   */
  searchCandidateId = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        if (searchText.length < 3) {
          return Observable.of([]);
        } else {
          const searchTextUpper = searchText.toUpperCase();
          return this._typeaheadService.getContacts(searchTextUpper, 'cand_id');
        }
      })
    );

    /**
   * Search for Candidates when last name input value changes.
   */
  searchCandLastName = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        if (searchText) {
          return this._typeaheadService.getContacts(searchText, 'cand_last_name');
        } else {
          return Observable.of([]);
        }
      })
    );

  /**
   * Search for Candidate when first name input value changes.
   */
  searchCandFirstName = (text$: Observable<string>) =>
    text$.pipe(
      debounceTime(500),
      distinctUntilChanged(),
      switchMap(searchText => {
        if (searchText) {
          return this._typeaheadService.getContacts(searchText, 'cand_first_name');
        } else {
          return Observable.of([]);
        }
      })
    );

    /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the Candidate ID field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterCandidateId = (x: { beneficiary_cand_id: string }) => {
    if (typeof x !== 'string') {
      return x.beneficiary_cand_id;
    } else {
      return x;
    }
  };

    /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the last name field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterCandLastName = (x: { cand_last_name: string }) => {
    if (typeof x !== 'string') {
      return x.cand_last_name;
    } else {
      return x;
    }
  };

  /**
   * format the value to display in the input field once selected from the typeahead.
   *
   * For some reason this gets called for all typeahead fields despite the binding in the
   * template to the first name field.  In these cases return x to retain the value in the
   * input for the other typeahead fields.
   */
  formatterCandFirstName = (x: { cand_first_name: string }) => {
    if (typeof x !== 'string') {
      return x.cand_first_name;
    } else {
      return x;
    }
  };


/**
   * Populate the fields in the form with the values from the selected Candidate.
   *
   * @param $event The mouse event having selected the contact from the typeahead options.
   */
  public handleSelectedCandidate($event: NgbTypeaheadSelectItemEvent) {
    // preventDefault this is used so NgbTypeAhead doesn't automatically save the whole object on modal close
    $event.preventDefault(); 
    const entity = $event.item;
    
    this.form.patchValue({'cand_last_name':entity.cand_last_name}, {onlySelf:true});
    this.form.patchValue({'cand_first_name':entity.cand_first_name}, {onlySelf:true});
    this.form.patchValue({'cand_middle_name':entity.cand_middle_name}, {onlySelf:true});
    this.form.patchValue({'cand_prefix':entity.cand_prefix}, {onlySelf:true});
    this.form.patchValue({'cand_suffix':entity.cand_suffix}, {onlySelf:true});
    this.form.patchValue({'candidate_id':entity.beneficiary_cand_id}, {onlySelf:true});
    this.form.patchValue({'cand_office':entity.cand_office}, {onlySelf:true});
    this.form.patchValue({'cand_office_state':entity.cand_office_state}, {onlySelf:true});
    this.form.patchValue({'cand_office_district':entity.cand_office_district}, {onlySelf:true});
  }

   /**
   * Format an entity to display in the Candidate ID type ahead.
   *
   * @param result formatted item in the typeahead list
   */
  public formatTypeaheadCandidateId(result: any) {
    const candidateId = result.beneficiary_cand_id ? result.beneficiary_cand_id.trim() : '';
    const lastName = result.cand_last_name ? result.cand_last_name.trim() : '';
    const firstName = result.cand_first_name ? result.cand_first_name.trim() : '';
    let office = result.cand_office ? result.cand_office.toUpperCase().trim() : '';
    if (office) {
      if (office === 'P') {
        office = 'Presidential';
      } else if (office === 'S') {
        office = 'Senate';
      } else if (office === 'H') {
        office = 'House';
      }
    }
    const officeState = result.cand_office_state ? result.cand_office_state.trim() : '';
    const officeDistrict = result.cand_office_district ? result.cand_office_district.trim() : '';

    return `${candidateId}, ${lastName}, ${firstName}, ${office}, ${officeState}, ${officeDistrict}`;
  }


   /**
   * Format an entity to display in the Candidate type ahead field.
   *
   * @param result formatted item in the typeahead list
   */
  public formatTypeaheadCandidate(result: any) {
    const lastName = result.cand_last_name ? result.cand_last_name.trim() : '';
    const firstName = result.cand_first_name ? result.cand_first_name.trim() : '';
    let office = result.cand_office ? result.cand_office.toUpperCase().trim() : '';
    if (office) {
      if (office === 'P') {
        office = 'Presidential';
      } else if (office === 'S') {
        office = 'Senate';
      } else if (office === 'H') {
        office = 'House';
      }
    }
    const officeState = result.cand_office_state ? result.cand_office_state.trim() : '';
    const officeDistrict = result.cand_office_district ? result.cand_office_district.trim() : '';

    return `${lastName}, ${firstName}, ${office}, ${officeState}, ${officeDistrict}`;
  }























}
