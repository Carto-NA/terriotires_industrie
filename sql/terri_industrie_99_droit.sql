/* TERRI_INDUSTRIE V1.0 */
/* Creation des droits sur l'ensemble des objets */
/* terri_industrie_99_droit.sql */
/* PostgreSQL/PostGIS */
/* Conseil régional Nouvelle-Aquitaine - https://cartographie.nouvelle-aquitaine.fr/ */
/* Auteur : Tony VINCENT */

------------------------------------------------------------------------ 
-- Grant : Droits des éléments
------------------------------------------------------------------------

-- Tables : met_zon.m_zon_terri_industrie_geo
GRANT ALL ON TABLE ref_zonage.t_appartenance_geo_epci_terri_industrie TO "pre-sig-usr";
GRANT SELECT ON TABLE ref_zonage.t_appartenance_geo_epci_terri_industrie TO "pre-sig-ro";

-- Tables : met_zon.m_zon_terri_industrie_geo
GRANT ALL ON TABLE met_zon.m_zon_terri_industrie_geo TO "pre-sig-usr";
GRANT SELECT ON TABLE met_zon.m_zon_terri_industrie_geo TO "pre-sig-ro";
