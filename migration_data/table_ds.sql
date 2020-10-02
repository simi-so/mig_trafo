SELECT 
    uuid_generate_v4() AS id, 
    version, 
    create_ts,
    created_by, 
    update_ts, 
    split_part(data_set_name,'.',2) AS "table_name", 
    split_part(data_set_name,'.',1) AS ext1,
    database_ids.id AS ext2,
    data_set.gdi_oid AS ext3,
    data_set.description AS remarks
FROM 
    gdi_knoten.data_set data_set
LEFT JOIN 
    gdi_knoten.data_source data_source
	ON 
	data_set.gdi_oid_data_source = data_source.gdi_oid
LEFT JOIN 
    public.simidata_postgres_db postgres_db 
	ON 
	postgres_db.db_name = data_source.name 
LEFT JOIN 
    public.database_ids 
	ON 
	database_ids.gdi_oid = data_set.gdi_oid_data_source
WHERE 
    postgres_db.id IS NOT NULL