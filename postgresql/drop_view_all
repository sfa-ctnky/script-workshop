alter table geoplan_sinir_5000 alter column poly type geometry(geometry,900916);

Copy (SELECT table_name, 'CREATE OR REPLACE VIEW '|| table_name || ' AS ' || view_definition || 'ALTER TABLE ' || table_name || ' OWNER TO postgres;' FROM   INFORMATION_SCHEMA.VIEWS WHERE view_definition like '%geoplan_sinir_5000.poly%') To 'C:\Users\Administrator\Desktop\log\test.csv' With CSV DELIMITER ',';

SELECT table_name FROM   INFORMATION_SCHEMA.VIEWS WHERE view_definition like '%geoplan_sinir_5000.poly%';

Drop view kbs_pls ;

alter table geoplan_sinir_5000 alter column poly type geometry(geometry,900916);

UPDATE geoplan_sinir_5000 SET poly=st_setsrid(poly,900916);

select st_srid(poly),* from geoplan_sinir_5000 ;
