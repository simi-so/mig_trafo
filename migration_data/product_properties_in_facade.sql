SELECT 
    uuid_generate_v4() AS id, 
    version, 
    create_ts,
    created_by, 
    update_ts, 
    sort, 
    transparency, 
    id_sublayer AS data_set_view_id, 
    id_layergroup AS facade_layer_id
FROM 
    base_attr_v, 
    old_and_new_groups_and_subs
WHERE 
    facade = true
AND 
    id_sublayer IN (SELECT id FROM simiproduct_data_set_view)