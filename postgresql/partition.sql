set MAX_PARALLEL_WORKERS_PER_GATHER = 0 ;
explain analyze select count(*) from parsel where st_area(poly) > 125 and st_area(poly) < 250;

set MAX_PARALLEL_WORKERS_PER_GATHER = 2 ;
explain analyze select count(*) from parsel where st_area(poly) > 125 and st_area(poly) < 250;

--explain analyze select * from parsel_part

set MAX_PARALLEL_WORKERS_PER_GATHER = 4 ;
explain analyze select count(*) from parsel where st_area(poly) > 125 and st_area(poly) < 250;

set MAX_PARALLEL_WORKERS_PER_GATHER = 6 ;
explain analyze select count(*) from parsel where st_area(poly) > 125 and st_area(poly) < 250;

set MAX_PARALLEL_WORKERS_PER_GATHER = 8 ;
explain analyze select count(*) from parsel where st_area(poly) > 125 and st_area(poly) < 250;

--partition--
CREATE TABLE public.parsel_part
(
    paftaadi character varying(255) COLLATE pg_catalog."default",
    tapu_mah_id_2 character varying(255) COLLATE pg_catalog."default",
    tapu_mah_adi character varying(255) COLLATE pg_catalog."default",
    adaparsel character varying(255) COLLATE pg_catalog."default",
    ada character varying(255) COLLATE pg_catalog."default",
    ada_eski_1 character varying(255) COLLATE pg_catalog."default",
    ada_eski_2 character varying(255) COLLATE pg_catalog."default",
    parsel character varying(255) COLLATE pg_catalog."default",
    parsel_eski_1 character varying(255) COLLATE pg_catalog."default",
    parsel_eski_2 character varying(255) COLLATE pg_catalog."default",
    mevkii character varying(255) COLLATE pg_catalog."default",
    alan numeric(10,2),
    parsel_durum_id integer,
    parsel_vasfi_id integer,
    arazi_tipi_id integer,
    on_cekme character varying(255) COLLATE pg_catalog."default",
    yan_cekme character varying(255) COLLATE pg_catalog."default",
    arka_cekme character varying(255) COLLATE pg_catalog."default",
    on_cephe character varying(255) COLLATE pg_catalog."default",
    parsel_derinligi character varying(255) COLLATE pg_catalog."default",
    sacak_seviyesi character varying(255) COLLATE pg_catalog."default",
    plan1000_id character varying(255) COLLATE pg_catalog."default",
    plansinir_id character varying(50) COLLATE pg_catalog."default",
    jeoloji_id character varying(255) COLLATE pg_catalog."default",
    subasman_kotu character varying(255) COLLATE pg_catalog."default",
    ulke_pafta_no character varying(255) COLLATE pg_catalog."default",
    ifraz_sarti_cephe character varying(255) COLLATE pg_catalog."default",
    ifraz_sarti_saha character varying(255) COLLATE pg_catalog."default",
    plan5000_id character varying(255) COLLATE pg_catalog."default",
    kisit_yuz character varying(255) COLLATE pg_catalog."default",
    imar_kisitlama_id character varying(255) COLLATE pg_catalog."default",
    tevhid_sarti_id character varying(255) COLLATE pg_catalog."default",
    terk_miktari character varying(255) COLLATE pg_catalog."default",
    harita_bilgisi_id character varying(255) COLLATE pg_catalog."default",
    aciklama character varying(255) COLLATE pg_catalog."default",
    bos_dolu character varying(255) COLLATE pg_catalog."default",
    komsuyollar character varying(255) COLLATE pg_catalog."default",
    geo_durum boolean NOT NULL DEFAULT true,
    orgid character varying(255) COLLATE pg_catalog."default",
    mahalleref character varying(255) COLLATE pg_catalog."default",
    parselref character varying(255) COLLATE pg_catalog."default",
    islemref character varying(255) COLLATE pg_catalog."default",
    adaref character varying(255) COLLATE pg_catalog."default",
    parseltip character varying(255) COLLATE pg_catalog."default",
    tapuyuzolcumu character varying(255) COLLATE pg_catalog."default",
    itirazdurumu character varying(255) COLLATE pg_catalog."default",
    itiraznedeni character varying(255) COLLATE pg_catalog."default",
    parseldurum character varying(255) COLLATE pg_catalog."default",
    nitelik character varying(255) COLLATE pg_catalog."default",
    davatip character varying(255) COLLATE pg_catalog."default",
    ciltno character varying(255) COLLATE pg_catalog."default",
    sayfano character varying(255) COLLATE pg_catalog."default",
    kutuksayfano character varying(255) COLLATE pg_catalog."default",
    dgirmeyen character varying(255) COLLATE pg_catalog."default",
    istimlak character varying(255) COLLATE pg_catalog."default",
    eskidop character varying(255) COLLATE pg_catalog."default",
    oka character varying(255) COLLATE pg_catalog."default",
    endeks character varying(255) COLLATE pg_catalog."default",
    nereden character varying(255) COLLATE pg_catalog."default",
    parseldurumu character varying(255) COLLATE pg_catalog."default",
    taks character varying(255) COLLATE pg_catalog."default",
    kaks character varying(255) COLLATE pg_catalog."default",
    kacak character varying(255) COLLATE pg_catalog."default",
    kacak_oran character varying(255) COLLATE pg_catalog."default",
    m_date date,
    m_status character varying(50) COLLATE pg_catalog."default",
    hmaks character varying(255) COLLATE pg_catalog."default",
    adaid integer,
    ncgeomvalidd character varying(255) COLLATE pg_catalog."default",
    m_log_user character varying(150) COLLATE pg_catalog."default",
    hat_tipi integer,
    imar_durum character varying(255) COLLATE pg_catalog."default",
    imar_uygulama integer,
    jeoloji_tip character varying(255) COLLATE pg_catalog."default",
    pafta_eski character varying(255) COLLATE pg_catalog."default",
    maks_kod bigint,
    maks_toplu_veri_gonder boolean,
    maks_toplu_veri_gonder_aciklama character varying(500) COLLATE pg_catalog."default",
    objectid_ integer,
    tapu_mah_id integer,
    poly geometry(Geometry,2321),
    nc_mahalleid integer,
    nc_aciklama_ilce_adi character varying(66) COLLATE pg_catalog."default",
    nc_kullanim character varying(200) COLLATE pg_catalog."default",
    nc_nizam character varying(200) COLLATE pg_catalog."default",
    nc_emsal character varying(200) COLLATE pg_catalog."default",
    nc_hmax character varying(200) COLLATE pg_catalog."default",
    nc_katsayisi integer,
    nc_aciklama character varying(255) COLLATE pg_catalog."default",
    nc_parselasyon_adi character varying(255) COLLATE pg_catalog."default",
    ilceref integer,
    tapuzeminref bigint,
    kontrol character varying(255) COLLATE pg_catalog."default",
    objectid integer NOT NULL DEFAULT nextval('parsel_objectid_seq'::regclass),
    nc_pfa_objectid bigint,
    silinecek character varying(50) COLLATE pg_catalog."default",
    tkgmilceref integer,
    tapumah_id integer,
    --CONSTRAINT parsel_ppkey PRIMARY KEY (objectid),
    CONSTRAINT enforce_sridp_poly CHECK (st_srid(poly) = 2321)
) PARTITION BY RANGE (m_date);


ALTER TABLE public.parsel_part
    OWNER to postgres;

   
------------------------------------------------------- child tables-------------------------------------------------------
CREATE TABLE parsel_2014_04
      PARTITION OF parsel_part FOR VALUES FROM ('2014-04-01') TO ('2014-04-30');
    CREATE INDEX geodurumu_2014_04
    ON public.parsel_2014_04 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B3213423312"
    ON public.parsel_2014_04 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2014_04
    ON public.parsel_2014_04 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE TABLE parsel_2014_05
      PARTITION OF parsel_part FOR VALUES FROM ('2014-04-30') TO ('2014-05-31');
    CREATE INDEX geodurumu_2014_05
    ON public.parsel_2014_05 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B3211233423312"
    ON public.parsel_2014_05 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2014_05
    ON public.parsel_2014_05 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE TABLE parsel_2014_06
      PARTITION OF parsel_part FOR VALUES FROM ('2014-05-31') TO ('2014-06-30');
    CREATE INDEX geodurumu_2014_06
    ON public.parsel_2014_06 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B321345223312"
    ON public.parsel_2014_06 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2014_06
    ON public.parsel_2014_06 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE TABLE parsel_2014_07
      PARTITION OF parsel_part FOR VALUES FROM ('2014-06-30') TO ('2014-07-31');
    CREATE INDEX geodurumu_2014_07
    ON public.parsel_2014_07 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B32112343423312"
    ON public.parsel_2014_07 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2014_07
    ON public.parsel_2014_07 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE TABLE parsel_2014_08
      PARTITION OF parsel_part FOR VALUES FROM ('2014-07-31') TO ('2014-08-31');
    CREATE INDEX geodurumu_2014_08
    ON public.parsel_2014_08 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B32313423312"
    ON public.parsel_2014_08 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2014_08
    ON public.parsel_2014_08 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE TABLE parsel_2014_09
      PARTITION OF parsel_part FOR VALUES FROM ('2014-08-31') TO ('2014-09-30');
    CREATE INDEX geodurumu_2014_09
    ON public.parsel_2014_09 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B3213432423312"
    ON public.parsel_2014_09 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2014_09
    ON public.parsel_2014_09 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE TABLE parsel_2014_10
      PARTITION OF parsel_part FOR VALUES FROM ('2014-10-01') TO ('2014-10-30');
    CREATE INDEX geodurumu_2014_10
    ON public.parsel_2014_10 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B321533423312"
    ON public.parsel_2014_10 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2014_10
    ON public.parsel_2014_10 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE TABLE parsel_2014_11
      PARTITION OF parsel_part FOR VALUES FROM ('2014-10-30') TO ('2014-11-30');
    CREATE INDEX geodurumu_2014_11
    ON public.parsel_2014_11 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B321325423312"
    ON public.parsel_2014_11 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2014_11
    ON public.parsel_2014_11 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE TABLE parsel_2014_12
      PARTITION OF parsel_part FOR VALUES FROM ('2014-12-01') TO ('2014-12-31');
    CREATE INDEX geodurumu_2014_12
    ON public.parsel_2014_12 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B3525213423312"
    ON public.parsel_2014_12 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2014_12
    ON public.parsel_2014_12 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE TABLE parsel_2015_01
      PARTITION OF parsel_part FOR VALUES FROM ('2014-12-31') TO ('2015-01-31');
    CREATE INDEX geodurumu_2015_01
    ON public.parsel_2015_01 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B321133423312"
    ON public.parsel_2015_01 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2015_01
    ON public.parsel_2015_01 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;

CREATE TABLE parsel_2015_02
      PARTITION OF parsel_part FOR VALUES FROM ('2015-02-01') TO ('2015-02-28');
    CREATE INDEX geodurumu_2015_02
    ON public.parsel_2015_02 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B3213432ef423312"
    ON public.parsel_2015_02 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2015_02
    ON public.parsel_2015_02 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;      

CREATE TABLE parsel_2015_03
      PARTITION OF parsel_part FOR VALUES FROM ('2015-02-28') TO ('2015-03-31');
    CREATE INDEX geodurumu_2015_03
    ON public.parsel_2015_03 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B321342873312"
    ON public.parsel_2015_03 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2015_03
    ON public.parsel_2015_03 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default; 

CREATE TABLE parsel_2015_04
      PARTITION OF parsel_part FOR VALUES FROM ('2015-03-31') TO (MAXVALUE);
   CREATE INDEX geodurumu_2015_04
    ON public.parsel_2015_04 USING btree
    (geo_durum)
    TABLESPACE pg_default;
CREATE INDEX "gix4AB069B321346823312"
    ON public.parsel_2015_04 USING gist
    (poly)
    TABLESPACE pg_default;
CREATE INDEX index_2015_04
    ON public.parsel_2015_04 USING btree
    (parsel COLLATE pg_catalog."default")
    TABLESPACE pg_default;  

--orijinal worker sayısı
set MAX_PARALLEL_WORKERS_PER_GATHER = 2 ;
EXPLAIN ANALYZE select * from parsel where m_date = '2014-10-31'
EXPLAIN ANALYZE select * from parsel_part where m_date = '2014-10-31'

--partition sadece 2014'e uygulandı ancak 2017 sorgusu da hızlandı.
EXPLAIN ANALYZE select * from parsel where m_date = '2017-02-28'
EXPLAIN ANALYZE select * from parsel_part where m_date = '2017-02-28'

EXPLAIN ANALYZE select * from parsel where m_date > '2017-02-28'
EXPLAIN ANALYZE select * from parsel_part where m_date > '2017-02-28'


-- execution time 183009.036ms
set log_min_duration_statement = 0;
SET client_min_messages = log;
/**EXPLAIN ANALYZE**/ select count(*) from parsel_part,geoiller where il_adi = 'ANKARA' and st_intersects(parsel_part.poly,geoiller.poly) = true;

-- execution time 228234.883 ms
set log_min_duration_statement = 0;
SET client_min_messages = log;
/**EXPLAIN ANALYZE**/ select count(*) from parsel,geoiller where il_adi = 'ANKARA' and st_intersects(parsel.poly,geoiller.poly) = true;

    --insert into parsel_part select * from parsel where m_date is not null;  
    --select count(*) from parsel_part where st_isvalid(poly) = true
    --select max(m_date) maxi, min(m_date) mini from parsel
    --drop table parsel_part cascade
