SELECT 
    uuid_generate_v4() AS id, 
    version, 
    create_ts,
    created_by, 
    update_ts, 
    split_part(data_set_name,'.',1) AS "schema_name", 
    postgres_db.id AS postgres_db_id
FROM 
    (SELECT DISTINCT ON (split_part(data_set_name,'.',1), gdi_oid_data_source) * FROM gdi_knoten.data_set) data_set
LEFT JOIN 
    gdi_knoten.data_source data_source
	ON 
	data_set.gdi_oid_data_source = data_source.gdi_oid
LEFT JOIN 
    public.simidata_postgres_db postgres_db 
	ON 
	postgres_db.db_name = data_source.name 
WHERE 
    postgres_db.id IS NOT NULL
