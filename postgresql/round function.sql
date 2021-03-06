CREATE OR REPLACE FUNCTION round(double precision, integer)
  RETURNS double precision AS
$BODY$

       select cast(round(cast($1 as numeric),$2) as double precision);

$BODY$
  LANGUAGE sql IMMUTABLE
  COST 100;
ALTER FUNCTION round(double precision, integer)
  OWNER TO postgres;
  
  --
