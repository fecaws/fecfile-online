CREATE OR REPLACE FUNCTION public.get_sub_transaction_json(
	p_form_type character varying,
	p_tran_identifier character varying)
    RETURNS json
    LANGUAGE 'plpgsql'
    VOLATILE 
AS $BODY$

declare
v_json JSON;
v_parent_tran_id integer;
v_tran_identifier character varying(90);
is_parent boolean;
is_earmark boolean;
begin
/* This will give the sub-transactions when you enter a parent or child transaction identifier*/

	select  COALESCE (parent_tran_id, null,0) into v_parent_tran_id 
    	from ref_transaction_types 
        	where form_type=p_form_type 
              and tran_identifier=p_tran_identifier;
			 
              
    if v_parent_tran_id > 0 then
    /*If this is a child then find parent*/
    	is_parent = false;
		select  tran_identifier  into v_tran_identifier from   ref_transaction_types 
        	where form_type=p_form_type and ref_tran_id=v_parent_tran_id;			
	else
    	is_parent = true;
        v_tran_identifier = p_tran_identifier;
    end if;
	
	if upper(p_tran_identifier) like '%EAR%' then
		is_earmark = true;
	else
		is_earmark = false;
	end if;		
    
	SELECT json_agg(json_build_object('transactionType', parent.tran_identifier, 
                                                         'transactionTypeDescription', parent.tran_desc, 
                                                         'scheduleType', parent.sched_type, 
                                                         'subTransactionType', child.tran_identifier, 
                                                         'subScheduleType', parent.sched_type,                                                         
                                                         'subTransactionTypeDescription', child.tran_desc,
                                      					'api_call',(case when parent.sched_type ='sched_a' then '/sa/schedA'
                                                                    	 when parent.sched_type ='sched_b' then '/sb/schedB'
                                                                    	else '/sa/schedA'
                                                                   end),
                                                         'isParent',is_parent,
									  					 'isEarmark',is_earmark
                                                        )) into v_json
           FROM ref_transaction_types parent
            JOIN ref_transaction_types child ON parent.ref_tran_id = child.parent_tran_id
            where parent.tran_identifier=v_tran_identifier
			 and parent.auto_generate = false;/* Excluding auto generated transactions*/
return v_json;
end;

$BODY$;

