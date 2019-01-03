CREATE SEQUENCE efile.forms_committee_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE efile.forms_committee_id_seq OWNER TO fecdbuser;
GRANT ALL ON SEQUENCE efile.forms_committee_id_seq TO fecdbuser;
GRANT ALL ON SEQUENCE efile.forms_committee_id_seq TO developer;


CREATE SEQUENCE efile.forms_committeeinfo_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE efile.forms_committeeinfo_id_seq OWNER TO fecdbuser;
GRANT ALL ON SEQUENCE efile.forms_committeeinfo_id_seq TO fecdbuser;
GRANT ALL ON SEQUENCE efile.forms_committeeinfo_id_seq TO developer;

--
-- forms_committeeinfo table.  Note: This is a temp table, we will be moving this table to a better location.
--
CREATE TABLE efile.forms_committeeinfo
(
    committeeid character varying(9)   NOT NULL,
    committeename character varying(200)   NOT NULL,
    street1 character varying(34)   NOT NULL,
    street2 character varying(34)  ,
    city character varying(30)   NOT NULL,
    state character varying(2)   NOT NULL,
    zipcode text   NOT NULL,
    treasurerlastname character varying(30)   NOT NULL,
    treasurerfirstname character varying(20)   NOT NULL,
    treasurermiddlename character varying(20)  ,
    treasurerprefix character varying(10)  ,
    treasurersuffix character varying(10)  ,
    created_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    isdeleted boolean NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    text text   NOT NULL,
    id integer NOT NULL DEFAULT nextval('efile.forms_committeeinfo_id_seq'::regclass),
    reason character varying(3)   NOT NULL,
    is_submitted boolean NOT NULL,
    additional_email_1 text  ,
    additional_email_2 text  ,
    email_on_file text   NOT NULL,
    signee character varying(30)   NOT NULL,
    file character varying(100)  ,
    coverage_end_date date,
    coverage_start_date date,
    form_type character varying(3)   NOT NULL,
    CONSTRAINT forms_committeeinfo_pkey PRIMARY KEY (id)
);

ALTER TABLE efile.forms_committeeinfo OWNER to fecdbuser;
GRANT ALL ON TABLE efile.forms_committeeinfo TO fecdbuser;
GRANT ALL ON TABLE efile.forms_committeeinfo TO developer;


CREATE INDEX idx_forms_committeeinfo_committeeid_like
    ON efile.forms_committeeinfo USING btree
    (committeeid   varchar_pattern_ops);

       
--
-- Forms_Committee table.  Note: This is a temp table, we will be moving this table to a better location.
--
CREATE TABLE efile.forms_committee (id INTEGER NOT NULL DEFAULT nextval('efile.forms_committee_id_seq'::regclass),
    committeeid character varying(9) NOT NULL,
    committeename character varying(200) NOT NULL,
    street1 character varying(34)   NOT NULL,
    street2 character varying(34)   NOT NULL,
    city character varying(30)   NOT NULL,
    state character varying(2)   NOT NULL,
    zipcode integer NOT NULL,
    treasurerlastname character varying(30)   NOT NULL,
    treasurerfirstname character varying(20)   NOT NULL,
    treasurermiddlename character varying(20)   NOT NULL,
    treasurerprefix character varying(10)   NOT NULL,
    treasurersuffix character varying(10)   NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    isdeleted boolean NOT NULL,
    email_on_file text   NOT NULL,
    CONSTRAINT forms_committee_pkey PRIMARY KEY (id)
);
 
ALTER TABLE efile.forms_committee OWNER to fecdbuser;
GRANT ALL ON TABLE efile.forms_committee TO fecdbuser;
GRANT ALL ON TABLE efile.forms_committee TO developer;

CREATE TABLE efile.forms_f99attachment
(
    id integer NOT NULL,
    bytes text  NOT NULL,
    filename character varying(255)  NOT NULL,
    mimetype character varying(50)   NOT NULL,
    CONSTRAINT forms_f99attachment_pkey PRIMARY KEY (id)
);

ALTER TABLE efile.forms_f99attachment OWNER to fecdbuser;
GRANT ALL ON TABLE efile.forms_f99attachment TO fecdbuser;
GRANT ALL ON TABLE efile.forms_f99attachment TO developer;
