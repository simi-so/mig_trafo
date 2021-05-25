select distinct on (model_schema.id, split_part(data_set_name,'.',2))
    uuid_generate_v4() AS id,
    1 AS version,
    coalesce(data_set.primary_key,'t_id',data_set.primary_key) AS id_field_name, 
	model_schema.id AS data_theme_id, 
	NULL AS description_model,
	now() AS cat_sync_stamp,
	data_set_view.geometry_column AS geo_field_name, 
	NULL AS geo_type, 
	NULL AS geo_epsg_code, 
    split_part(data_set_name,'.',2) AS "table_name", 
    data_set.gdi_oid AS remarks
FROM 
    (select
         array_agg(gdi_oid) as gdi_oid,
         min(gdi_oid) as min_gdi_oid, --Problem: Muss mit data_set_view verknüpft werden. um Geometriespalte aus zu lesen. Die ist aber bei allen views des selben Datensatzes so.
         data_set_name, 
         gdi_oid_data_source, 
         min(primary_key) AS primary_key
     from 
         gdi_knoten.data_set
     where 
         gdi_oid in (select gdi_oid_data_set from gdi_knoten.data_set_view) 
     group by 
         data_set_name, 
         gdi_oid_data_source
     )data_set
LEFT JOIN 
    public.database_ids 
	ON 
	database_ids.gdi_oid = data_set.gdi_oid_data_source
LEFT JOIN 
    simidata_data_theme model_schema
	ON
    split_part(data_set_name,'.',1) = model_schema.schema_name
	AND 
	database_ids.id::text = model_schema.postgres_db_id::text
LEFT JOIN 
    gdi_knoten.data_set_view data_set_view 
	ON 
	data_set_view.gdi_oid_data_set = data_set.min_gdi_oid
where 
    model_schema.id is not null 
