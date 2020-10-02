SELECT 
    uuid_generate_v4() AS id, 
	FALSE AS raw_download, 
	data_set_view.name AS name, 
	NULL AS style_server, 
	NULL AS style_desktop, 
	1 AS search_type, 
	NULL AS search_facet, 
	filter_word AS search_filter_word
FROM 
    gdi_knoten.data_set_view