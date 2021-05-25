CREATE OR REPLACE VIEW public."old_and_new_groups_and_subs"
 AS
SELECT  
    group_layer.gdi_oid_group_layer,
	ows_layer_gruppe.name AS group_name,
	data_product_layergroup.id AS id_layergroup,
	group_layer.gdi_oid_sub_layer, 
	ows_layer_sub.name AS sub_name,
	data_product_sublayer.id AS id_sublayer,
	group_layer.layer_order AS sort, 
	group_layer.layer_active AS active,
	ows_layer_sub.layer_transparency AS transparency,
	ows_layer_group.facade
FROM  
	gdi_knoten.ows_layer ows_layer_gruppe,
	gdi_knoten.ows_layer ows_layer_sub,
	gdi_knoten.group_layer, 
	gdi_knoten.ows_layer_group ows_layer_group, 
	simiproduct_data_product data_product_layergroup,
	simiproduct_data_product data_product_sublayer
WHERE 
    group_layer.gdi_oid_group_layer = ows_layer_gruppe.gdi_oid
	AND 
	group_layer.gdi_oid_sub_layer = ows_layer_sub.gdi_oid
	AND
	ows_layer_group.gdi_oid = ows_layer_gruppe.gdi_oid
	AND 
	ows_layer_gruppe.name = data_product_layergroup.identifier
	AND 
	ows_layer_sub.name = data_product_sublayer.identifier;

ALTER TABLE public."old_and_new_groups_and_subs"
    OWNER TO postgres;
COMMENT ON VIEW public."old_and_new_groups_and_subs"
    IS 'Alte und neue Layergruppen und sublayer zusammengezogen';
