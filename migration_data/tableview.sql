SELECT 
    product_data_set_view.id,
    NULL AS where_clause,
    gdi_data_set_view.geometry_column AS geom_field_name,
    NULL AS geo_type,
    NULL AS geo_epsg_code,
    false AS wgc_edit,
    tableds.id AS postgres_table_id
FROM 
    simiproduct_data_set_view product_data_set_view, 
    simiproduct_data_product product_data_product,
	gdi_knoten.ows_layer,
	gdi_knoten.ows_layer_data,
	gdi_knoten.data_set,
	gdi_knoten.data_set_view gdi_data_set_view,
	(SELECT name, tableds.id, tableds.schema_and_table, database_id
	 FROM gdi_knoten.data_set data_set
	 LEFT JOIN 
	    (SELECT 
             id, 
	         ext1||'.'||table_name AS schema_and_table, 
		     ext2 AS database_id
             FROM 
	         public.simidata_table_ds table_ds
	     ) tableds
	 ON 
	 tableds.schema_and_table = data_set.data_set_name
	 ) tableds, 
	 database_ids
WHERE 
    product_data_set_view.id = product_data_product.id
    and 
	ows_layer.name = product_data_product.identifier
	AND 
    ows_layer_data.gdi_oid = ows_layer.gdi_oid
	AND 
	ows_layer_data.gdi_oid_data_set_view = gdi_data_set_view.gdi_oid
	AND 
	data_set.gdi_oid = gdi_data_set_view.gdi_oid_data_set
	AND 
	tableds.name = product_data_product.identifier
	AND 
	data_set.gdi_oid_data_source = database_ids.gdi_oid
	AND
	tableds.database_id::uuid = database_ids.id
ORDER BY id
