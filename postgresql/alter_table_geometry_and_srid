alter TABLE "TASDIGER" alter column "Poly" type geometry(GEOMETRY)
 
alter TABLE "TASDIGER" alter column "Poly" type geometry(geometry,2321)
 
select * from "WFSMAHALLE"
 
SELECT geometrytype("Poly") as g FROM "WFSMAHALLE" group by g
 
SELECT st_Srid("Poly") as g FROM "TASDIGER" group by g
 
update  "TASDIGER" set "Poly" =st_setsrid("Poly",2321)
 
SELECT * FROM geometry_columns
select * from "TASDIGER"
 
