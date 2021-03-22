SELECT 
    uuid_generate_v4() AS id,
    base.version,
    base.create_ts,
    base.created_by,
    base.update_ts,
    data_set_view_attributes.gdi_oid AS ext1,
    data_set_view_attributes.name,
    data_set_view_attributes.description AS description_override,
    'Stellvertreter' AS type_name,
    false AS mandatory,
    true AS cat_synced,
    table_ds.id AS postgres_table_id
FROM 
    gdi_knoten.data_set_view_attributes data_set_view_attributes,
	gdi_knoten.data_set_view data_set_view, 
	public.simidata_table_ds table_ds,
    base_attr_v base
WHERE 
    data_set_view.gdi_oid_data_set = table_ds.ext3::bigint
	AND 
	data_set_view_attributes.gdi_oid_data_set_view = data_set_view.gdi_oid
