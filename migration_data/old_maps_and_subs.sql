CREATE OR REPLACE VIEW public."old_and_new_maps_and_subs"
 AS
select 
    data_product_map.identifier as map_name,
    data_product_map.id as id_layergroup,
    data_product_layer.identifier as layer_name, 
    data_product_layer.id as id_sublayer,
    map_layer.layer_order as sort, 
    map_layer.layer_transparency as transparency, 
    map_layer.layer_active as visible
FROM  
	gdi_knoten."map" old_map,
	gdi_knoten.map_layer map_layer, 
	gdi_knoten.ows_layer ows_layer,
	simiproduct_data_product data_product_map,
	simiproduct_data_product data_product_layer
WHERE 
    old_map.gdi_oid = map_layer.gdi_oid_map 
	AND 
	map_layer.gdi_oid_ows_layer = ows_layer.gdi_oid 
	and 
	(old_map.name||'_map') = data_product_map.identifier
	AND 
	ows_layer.name = data_product_layer.identifier;

ALTER TABLE public."old_and_new_maps_and_subs"
    OWNER TO postgres;
COMMENT ON VIEW public."old_and_new_maps_and_subs"
    IS 'Alte und neue Maps und sublayer zusammengezogen';
