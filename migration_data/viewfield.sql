SELECT 
    uuid_generate_v4() AS id,
    base.version,
    base.create_ts,
    base.created_by,
    base.update_ts, 
    old_attributes.attribute_order AS sort,
    tablefield.id AS table_field_id,
    data_set_view.id AS table_view_id
FROM 
    simidata_table_field tablefield,
	gdi_knoten.data_set_view_attributes old_attributes, 
	gdi_knoten.data_set_view old_data_set_view,
	simidata_data_set_view data_set_view,
	simiproduct_data_product data_product,
    base_attr_v base
WHERE 
    data_set_view.id = data_product.id 
    and 
    old_attributes.gdi_oid = any(tablefield.type_name::int[])
    AND 
    old_attributes.gdi_oid_data_set_view = old_data_set_view.gdi_oid
    AND
    data_product.identifier = old_data_set_view.name