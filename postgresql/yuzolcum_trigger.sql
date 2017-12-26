Jun 1 at 10:56 AM

------yok ise round function eklenir

CREATE OR REPLACE FUNCTION round(double precision, integer)

  RETURNS double precision AS

$BODY$

 

       select cast(round(cast($1 as numeric),$2) as double precision);

 

$BODY$

  LANGUAGE sql IMMUTABLE

  COST 100;

ALTER FUNCTION round(double precision, integer)

  OWNER TO postgres;

 

------yuzolcum dolduran trigger

 

CREATE OR REPLACE FUNCTION fn_tbs_yuzolcum()

  RETURNS trigger AS

$BODY$

             

                

begin

 

 

                IF (TG_OP = 'INSERT') THEN

                 update tasinmaz_islem t  set yuzolcum=round( st_area(st_transform(t.poly,2320)),2)

 

where t.yuzolcum is null

and t.objectid=NEW.objectid ;

             

               return NEW;

         

                

end IF;

 

END;

$BODY$

  LANGUAGE plpgsql VOLATILE

  COST 100;

ALTER FUNCTION fn_tbs_yuzolcum()

  OWNER TO postgres;

 

 

 

--select round( st_area(st_transform(t.poly,2320)),2) from tasinmaz_islem t
