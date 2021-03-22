CREATE OR REPLACE VIEW public.database_ids
 AS
SELECT 
    new_db.db_name AS name,
    new_db.id AS id, 
	old_db.gdi_oid AS gdi_oid
FROM 
    (SELECT id, db_name
	FROM public.simidata_postgres_db) new_db, 
	(SELECT gdi_oid, name
	    FROM gdi_knoten.data_source
     WHERE 
        connection_type = 'database'
	    AND 
	    connection LIKE 'postgresql%') old_db 
WHERE new_db.db_name = old_db.name;

ALTER TABLE public.database_ids
    OWNER TO postgres;
COMMENT ON VIEW public.database_ids
    IS 'Hilfs-View mit den IDs der Datenbanken aus der config_db und Simi';
