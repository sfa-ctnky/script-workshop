CREATE OR REPLACE FUNCTION update_to_arsiv_no()

  RETURNS trigger AS

$BODY$


 BEGIN

               IF(TG_OP='INSERT') THEN

               update emlak_arsa_belediye t set arsiv= (select   max(arsiv::integer)+1  from emlak_arsa_belediye)

               where  t.objectid=new.objectid;

               END IF;

               RETURN NEW;


 END;    

$BODY$

  LANGUAGE 'plpgsql' VOLATILE

  COST 100;

ALTER FUNCTION update_to_arsiv_no() OWNER TO postgres;
