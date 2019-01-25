DO
$body$
DECLARE
    v_role text;
    k_roles text[] = '{
         "fecdbuser",
         "developer",
         "fecfile"
}';
BEGIN
    FOREACH v_role IN ARRAY k_roles LOOP
        IF NOT EXISTS (
                SELECT *
                FROM pg_catalog.pg_roles
                WHERE  rolname = v_role) THEN
            EXECUTE FORMAT('CREATE ROLE %s', v_role);
        END IF;
    END LOOP;
END
$body$;
