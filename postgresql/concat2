CREATE OR REPLACE FUNCTION concat2(text, text) RETURNS text AS '

    SELECT CASE WHEN $1 IS NULL OR $1 = \'\' THEN $2

            WHEN $2 IS NULL OR $2 = \'\' THEN $1

            ELSE $1 || \' , \' || $2

            END;

'

LANGUAGE SQL;

 

CREATE AGGREGATE concatenate (

  sfunc = concat2,

  basetype = text,

  stype = text,

  initcond = ''

);

 

select spor_tesis_id, concatenate(kullanim)  from vw_test_hc group by spor_tesis_id


-- Function: concat2(text, text)

 

-- DROP FUNCTION concat2(text, text);

 

CREATE OR REPLACE FUNCTION concat2(text, text)

  RETURNS text AS

$BODY$

    SELECT CASE WHEN $1 IS NULL OR $1 = '' THEN $2

            WHEN $2 IS NULL OR $2 = '' THEN $1

            ELSE $1 || ' , ' || $2

            END;

$BODY$

  LANGUAGE sql VOLATILE

  COST 100;

ALTER FUNCTION concat2(text, text)

  OWNER TO postgres;
