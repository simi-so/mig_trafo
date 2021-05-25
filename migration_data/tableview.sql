SELECT 
    product_data_set_view.id,
    tableds.id AS postgres_table_id, 
    case when gdi_data_set_view.searchable = 0
         then '1_no_search' 
         when gdi_data_set_view.searchable = 1 
         then '2_if_loaded' 
         when gdi_data_set_view.searchable = 2 
         then '3_always' 
     end AS search_type, 
    gdi_data_set_view.facet AS search_facet, 
    gdi_data_set_view.filter_word AS search_filter_word
FROM 
    simidata_data_set_view product_data_set_view, 
    simiproduct_data_product product_data_product,
	gdi_knoten.ows_layer,
	gdi_knoten.ows_layer_data,
	gdi_knoten.data_set,
	gdi_knoten.data_set_view gdi_data_set_view,
	(SELECT name, tableds.id, tableds.schema_and_table, database_id
	 FROM gdi_knoten.data_set data_set
	 LEFT JOIN 
	    (SELECT 
             postgres_table.id, 
	         schema_name||'.'||table_name AS schema_and_table, 
		     postgres_db_id AS database_id, 
		     postgres_table.remarks as gdi_oid
         FROM 
	         public.simidata_postgres_table postgres_table
	     left join
	         public.simidata_data_theme data_theme
	         on 
	         postgres_table.data_theme_id = data_theme.id 
	     ) tableds
	 ON 
	 data_set.gdi_oid = any (tableds.gdi_oid::int[]) 
	 where 
	     data_set.gdi_oid in (select gdi_oid_data_set from gdi_knoten.data_set_view dsv)
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