export class reportModel {
    id: string;
    report_id: string;
    form_type: string;
    amend_ind: string;
    amend_number: number;
    cmte_id: string;
    report_type: string;
    report_type_desc: string;
    cvg_start_date: string;
    cvg_end_date: string;
    due_date: string;
    superceded_report_id: string;
    previous_report_id: string;
    status: string;
    filed_date: string;
    fec_id: string;
    fec_accepted_date: string;
    fec_status: string;
    most_recent_flag: string;
    delete_ind: string;
    create_date: string;
    last_update_date: string;
    viewtype: string;
    selected; string;
  
    constructor(report: any) {
      this.id = report.id ? report.id : '';
      this.report_id = report.report_id ? report.report_id: '';
      this.form_type = report.form_type ? report.form_type : '';
      this.amend_ind = report.amend_ind ? report.amend_ind : '';
      this.amend_number = report.amend_number ? report.amend_amend_numberind : 0;
      this.cmte_id = report.cmte_id ? report.cmte_id : '';
      this.report_type = report.report_type ? report.report_type : '';
      this.report_type_desc = report.report_type_desc ? report.report_type_desc : '';
      this.cvg_start_date = report.cvg_start_date ? report.cvg_start_date : null;
      this.cvg_end_date = report.cvg_end_date ? report.cvg_end_date : null;
      this.due_date = report.due_date ? report.due_date : null;
      this.superceded_report_id = report.superceded_report_id ? report.superceded_report_id : null;
      this.previous_report_id = report.previous_report_id ? report.previous_report_id : null;
      this.status = report.status ? report.status : '';
      this.filed_date = report.filed_date ? report.filed_date : '';
      this.fec_accepted_date = report.fec_accepted_date ? report.fec_accepted_date : '';
      this.most_recent_flag = report.most_recent_flag ? report.most_recent_flag : '';
      this.delete_ind = report.delete_ind ? report.delete_ind : '';
      this.fec_status = report.fec_status ? report.fec_status : '';
      this.create_date = report.create_date ? report.create_date : '';
      this.last_update_date = report.last_update_date ? report.last_update_date : '';
      this.viewtype = report.viewtype ? report.viewtype : '';
      this.selected = report.selected;
    }
   }
