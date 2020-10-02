SELECT 
    uuid_generate_v4() AS id, 
    version, 
    create_ts,
    created_by, 
    update_ts, 
    name AS db_name,
    connection AS ext1
FROM 
    gdi_knoten.data_source, 
    base_attr_v
WHERE 
    connection_type = 'database'
    AND 
    connection like 'postgresql%'