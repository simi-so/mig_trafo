SELECT 
    uuid_generate_v4() AS id, 
    version, 
    create_ts,
    created_by, 
    update_ts, 
	source.connection AS path,
	source.description AS remarks
FROM 
	gdi_knoten.data_source source,
	base_attr_v
WHERE 
    connection_type = 'directory'
