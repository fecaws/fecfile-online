<section>
	<div class="reports-container">
	    <div class="grid-row">
	      <div class="grid-row__col grid-row__col--12">
					<h1 class="text-left">Reports</h1>
					<table class="table-striped" style="width:100%">
					<thead>
						<tr text-align="left">
							<th text-align="left">Form</th>
							<th text-align="left">Status</th>
							<th text-align="right">FEC ID</th>
							<th text-align="left">Coverage Start Date</th>
							<th text-align="left">Coverage End Date</th>
							<th text-align="left">Report</th>
							<th text-align="left">Filed Date</th>
							<th text-align="left">Actions</th>
						</tr>
					</thead>	
					<tbody>
						<tr *ngFor="let report of reports || async">
							<td text-align="left">{{report.form_type}}</td>
							<td text-align="left">{{report.is_submitted ? 'Submitted' :'Save'}}</td>
							<td text-align="right" >{{report.is_submitted ? report.id : ''}}</td>
							<td text-align="left">{{report.coverage_start_date | date: 'MM/dd/yyyy'}}</td>
							<td text-align="left">{{report.coverage_end_date | date: 'MM/dd/yyyy'}}</td>
							<td text-align="left">{{report.ReportType}}</td>
							<td text-align="left">{{report.created_at | date: 'MM/dd/yyyy'}}</td>
							<td></td>
						</tr>
					</tbody>
					</table>
	      </div>
	    </div>		
	</div>
 <div>
	<footer>
        <div class="footer">
          <div class="legal-disclaimer">
            <button
              type="button"
              class="btn btn-link"
              (click)="open()"
            >
              Legal Disclaimer
            </button>
          </div>
          <div class="legal-text" [hidden]="!showLegalDisclaimer">
            <p>
              Please be advised that knowingly and willfully making any materially false, fictitious, or fraudulent statement or representation to a federal
              government agency, including the Federal Election Commission, is punishable under the provisions of 18 U.S.C. § 1001. The Commission may report
              apparent violations to the appropriate law enforcement authorities. 52 U.S.C. § 30107(a)(9).
            </p>          
          </div>          
        </div>
      </footer>
 </div>	
</section>