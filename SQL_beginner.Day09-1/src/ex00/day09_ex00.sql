DROP table person_audit;
CREATE TABLE person_audit (
    created timestamptz(0) NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    type_event char(1) NOT NULL,
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar
);
ALTER TABLE person_audit
add constraint ch_type_event check (type_event in ('I', 'U', 'D'));
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $trg_person_insert_audit$ BEGIN IF (TG_OP = 'INSERT') THEN
INSERT INTO person_audit
SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow',
    'I',
    NEW.*;
END IF;
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;
CREATE TRIGGER trg_person_insert_audit
AFTER
INSERT ON person_audit FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();
SELECT *
FROM person_audit;