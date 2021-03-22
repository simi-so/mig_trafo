SELECT 
    single_actor.id AS id, 
	case 
	    when data_set_view.name in (select data_set_view_name from gdi_knoten.wfs_layer_v)
	    then true 
	    else FALSE 
	end AS raw_download,  
	qgs_style AS style_server, 
	client_qgs_style AS style_desktop, 
	1 AS search_type, --Muss im definitiven noch korrigiert werden!!!
	NULL AS search_facet, 
	filter_word AS search_filter_word
FROM 
    simiproduct_data_product product, 
    simiproduct_single_actor single_actor,
    gdi_knoten.data_set_view data_set_view
LEFT JOIN 
    gdi_knoten.ows_layer_data ows_layer_data
	ON 
	ows_layer_data.gdi_oid_data_set_view = data_set_view.gdi_oid
WHERE 
    product.id = single_actor.id 
    AND 
    product.identifier = data_set_view.name

