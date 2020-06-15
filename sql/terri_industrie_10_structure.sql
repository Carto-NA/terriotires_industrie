/* TERRITOIRE d'INDUSTRIE V1.0 */
/* Creation de la structure des données (schéma, tables, séquences, triggers,...) */
/* terri_industrie_10_structure.sql */
/* PostgreSQL/PostGIS */
/* Conseil régional Nouvelle-Aquitaine - https://cartographie.nouvelle-aquitaine.fr/ */
/* Auteur : Tony VINCENT */

------------------------------------------------------------------------ 
-- Schéma : Création du schéma
------------------------------------------------------------------------

-- Schema: met_zon
CREATE SCHEMA IF NOT EXISTS met_zon;

COMMENT ON SCHEMA met_zon IS 'Schéma pour les zonages de territoire';


------------------------------------------------------------------------ 
-- Tables : Création des tables
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Table: ref_zonage.t_appartenance_geo_epci_terri_industrie

-- DROP TABLE ref_zonage.t_appartenance_geo_epci_terri_industrie;
CREATE TABLE ref_zonage.t_appartenance_geo_epci_terri_industrie
(
	id serial NOT NULL,
    	code_insee_epci character varying(9),
    	nom_epci character varying(150),
	code_terri_industrie character varying(15),
    	libelle_terri_industrie character varying(150),
    	ville_principale character varying(150),
    	numreg character varying(3),
    	nomreg character varying(150),
	annee_donnees character varying(4),
	date_import date,
	date_maj date,
	CONSTRAINT t_appartenance_geo_epci_terri_industrie_pkey PRIMARY KEY (id),
    	CONSTRAINT t_appartenance_geo_epci_terri_industrie_uniq UNIQUE (code_insee_epci, annee_donnees)
);

--
COMMENT ON TABLE ref_zonage.t_appartenance_geo_epci_terri_industrie IS 'Table d''appartenance des EPCI aux territoires d''industrie';

--
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.id IS 'Identifiant';
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.code_insee_epci IS 'Code INSEE de l''EPCI porteuse du territoire';
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.nom_epci IS 'Nom de l''EPCI porteuse du territoire';
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.libelle_terri_industrie IS 'Code du territoire d''industrie';
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.libelle_terri_industrie IS 'Nom du territoire d''industrie';
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.ville_principale IS 'Ville principale du territoire d''industrie';
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.numreg IS 'Code de la région';
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.nomreg IS 'Nom de la région';
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.annee_donnees IS 'Année de la données pour l''historisation';
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.date_import IS 'Date d''import de la donnée';
COMMENT ON COLUMN ref_zonage.t_appartenance_geo_epci_terri_industrie.date_maj IS 'Date de mise à jour de la donnée';


-- Ajout des données
INSERT INTO ref_zonage.t_appartenance_geo_epci_terri_industrie (
	code_insee_epci, nom_epci, libelle_terri_industrie, ville_principale, 
	numreg, nomreg, annee_donnees, date_import, date_maj
) 
SELECT  
	code_insee_, nom_de_l_ep, libelle_ter,  ville_princ,
	insee_reg, region, '2020', '09-06-2020', null
FROM z_maj.liste_territoiresindustrie141 t1
join ref_adminexpress.r_admexp_region_fr t2
on upper(unaccent_string(region)) = nom_reg;

-- Mise à jour des codes et des libellés
-- Angoulême Cognac
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie 
	SET code_terri_industrie='1600TI01',	libelle_terri_industrie='Angoulême Cognac',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Angoulême Cognac';
-- Rochefort
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie
	SET code_terri_industrie='1700TI01', libelle_terri_industrie='Rochefort',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Rochefort';
-- Niort Haut-Val-de-Sèvre
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie
	SET code_terri_industrie='7900TI01', libelle_terri_industrie='Niort Haut-Val-de-Sèvre',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Niortais';
-- Nord Poitou
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie 
	SET code_terri_industrie='7986TI01', libelle_terri_industrie='Nord Poitou',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Bressuire';
-- Grand Châtellerault
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie
	SET code_terri_industrie='8600TI01', libelle_terri_industrie='Grand Châtellerault',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Grand Châtellerault';
-- Limoges Métropole ELAN
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie
	SET code_terri_industrie='8700TI01', libelle_terri_industrie='Limoges Métropole ELAN',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Limoges Métropole';
-- Aubusson La Souterraine
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie
	SET code_terri_industrie='2300TI01', libelle_terri_industrie='Sud et Ouest Creuse',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Aubusson La Souterraine';
-- Bassin de Brive-Périgord
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie
	SET code_terri_industrie='2419TI01', libelle_terri_industrie='Bassin de Brive-Périgord',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Bassin de Brive - Périgord';
-- Périgord-Limousin
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie 
	SET code_terri_industrie='2487TI01', libelle_terri_industrie='Périgord-Limousin',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Interdépartemental Dordogne / Haute-Vienne';
-- Libournais
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie 
	SET code_terri_industrie='3300TI02', libelle_terri_industrie='Libournais',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Libournais';
-- Val de Garonne Guyenne Gascogne
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie
	SET code_terri_industrie='4733TI01', libelle_terri_industrie='Val de Garonne Guyenne Gascogne',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Val de Garonne Guyenne Gascogne';
-- Pays Adour Landes océanes
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie 
	SET code_terri_industrie='4700TI01', libelle_terri_industrie='Pays Adour Landes océanes',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Capbreton Dax';
-- Pays Basque
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie
	SET code_terri_industrie='6400TI01', libelle_terri_industrie='Pays Basque',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Pays Basque';
-- Lacq-Pau - Tarbes
UPDATE ref_zonage.t_appartenance_geo_epci_terri_industrie 
	SET code_terri_industrie='6400TI02', libelle_terri_industrie='Lacq-Pau - Tarbes',
	date_maj='09-06-2020'
WHERE libelle_terri_industrie = 'Lacq-Pau - Tarbes';



------------------------------------------------------------------------
-- Table: met_zon.m_zon_terri_industrie_geo

-- DROP TABLE met_zon.m_zon_terri_industrie_geo;
CREATE TABLE met_zon.m_zon_terri_industrie_geo
(
	id serial NOT NULL,
	code_terri_industrie character varying(20),
    	libelle_terri_industrie character varying(150),
    	ville_principale character varying(150),
    	numreg character varying(3),
    	nomreg character varying(150),
	commentaires text,
	annee_donnees character varying(4),
	date_import date,
	date_maj date,
	geom_valide  boolean DEFAULT false,
	geom geometry(MultiPolygon,2154),
	CONSTRAINT m_zon_terri_industrie_geo_pkey PRIMARY KEY (id),
    	CONSTRAINT m_zon_terri_industrie_geo_uniq UNIQUE (code_insee_epci, annee_donnees)
);

--
COMMENT ON TABLE met_zon.m_zon_terri_industrie_geo IS 'Table d''appartenance des EPCI aux territoires d''industrie';

--
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.id IS 'Identifiant';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.code_terri_industrie IS 'Code du territoire d''industrie';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.libelle_terri_industrie IS 'Nom du territoire d''industrie';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.ville_principale IS 'Ville principale du territoire d''industrie';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.numreg IS 'Code de la région';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.nomreg IS 'Nom de la région';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.commentaires IS 'Commentaires';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.annee_donnees IS 'Année de la données pour l''historisation';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.date_import IS 'Date d''import de la donnée';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.date_maj IS 'Date de mise à jour de la donnée';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.geom_valide IS 'Géométrie validée';
COMMENT ON COLUMN met_zon.m_zon_terri_industrie_geo.geom IS 'Géométrie polygone';

-- Ajout des données
INSERT INTO met_zon.m_zon_terri_industrie_geo (
	code_terri_industrie, libelle_terri_industrie, numreg, nomreg, 
	annee_donnees, date_import, date_maj, geom
)
SELECT code_terri_industrie, libelle_terri_industrie, numreg, nomreg, 
 	annee_donnees, date_import, date_maj, ST_Multi(ST_Union(a.geom)) AS geom
   FROM ref_adminexpress.r_admexp_epci_fr a
   INNER JOIN ref_zonage.t_appartenance_geo_epci_terri_industrie b
   ON a.code_epci = b.code_insee_epci AND annee_donnees = '2020' and numreg = '75'
  GROUP BY code_terri_industrie, libelle_terri_industrie, numreg, nomreg, annee_donnees, date_import, date_maj;

------------------------------------------------------------------------ 
-- Vues : Création des vues
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Vue : 



------------------------------------------------------------------------ 
-- Fonction : Création des fonctions et déclencheurs
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Function :

-- Trigger



											   
-----------------------------------------------------------------------------------
-- Historisation des données, à faire début janvier
INSERT INTO met_eco.m_eco_methanisation_na_geo (
	proj_num, proj_nom, proj_methanaqtion, caract_portage_code, caract_portage, caract_type_code, caract_type, 
	caract_maturite_code, caract_maturite, caract_procede_code, caract_procede, caract_constructeur, 
	loc_numdep, loc_numcom, loc_nomcom, loc_code_postal, gis_tonnage, gis_majoritaire, gis_part_effluent_elevage, 
	nrj_primaire_produite, nrj_mode_valorisation, nrj_biomethane_produit, nrj_cog_puissance_elec, nrj_cog_elec_injectee, 
	nrj_cog_therm_valorisee, nrj_injec_debit_bio_injectee, nrj_injec_valorisee_injection, date_clefs_premier_contrat, 
	date_clefs_debut_construction, date_clefs_debut_exploitation, div_commentaires, geom_valide, geom, 
	nrj_cog_taux_therm_valorisee, nrj_cog_therm_produite, x_wgs84, y_wgs84, annee_donnees, date_import, date_maj
)
select 
	proj_num, proj_nom, proj_methanaqtion, caract_portage_code, caract_portage, caract_type_code, caract_type, 
	caract_maturite_code, caract_maturite, caract_procede_code, caract_procede, caract_constructeur, 
	loc_numdep, loc_numcom, loc_nomcom, loc_code_postal, gis_tonnage, gis_majoritaire, gis_part_effluent_elevage, 
	nrj_primaire_produite, nrj_mode_valorisation, nrj_biomethane_produit, nrj_cog_puissance_elec, nrj_cog_elec_injectee, 
	nrj_cog_therm_valorisee, nrj_injec_debit_bio_injectee, nrj_injec_valorisee_injection, date_clefs_premier_contrat, 
	date_clefs_debut_construction, date_clefs_debut_exploitation, div_commentaires, geom_valide, geom, 
	nrj_cog_taux_therm_valorisee, nrj_cog_therm_produite, x_wgs84, y_wgs84, cast(date_part('year', CURRENT_DATE) as varchar), now(), null
from met_eco.m_eco_methanisation_na_geo;
											   
