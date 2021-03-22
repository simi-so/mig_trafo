SELECT 
    table_ds.id AS id,
    coalesce(data_set.primary_key,'t_id',data_set.primary_key) AS id_field_name, 
	model_schema.id AS model_schema_id, 
	NULL AS description_model,
	now() AS cat_sync_stamp,
	data_set_view.geometry_column AS geo_field_name, 
	NULL AS geo_type, 
	NULL AS geo_epsg_code
FROM 
    simidata_table_ds AS table_ds
LEFT JOIN 
    gdi_knoten.data_set data_set
	ON 
	split_part(data_set.data_set_name,'.',2) = table_ds.table_name
	--AND 
	--data_set.description = table_ds.remarks
        AND 
	table_ds.ext3 = data_set.gdi_oid::text
LEFT JOIN 
    simidata_model_schema model_schema
	ON
    split_part(data_set_name,'.',1) = model_schema.schema_name
	AND 
	table_ds.ext1 = model_schema.schema_name
	AND 
	table_ds.ext2 = model_schema.postgres_db_id::text
LEFT JOIN 
    gdi_knoten.data_set_view data_set_view 
	ON 
	data_set_view.gdi_oid_data_set = data_set.gdi_oid
