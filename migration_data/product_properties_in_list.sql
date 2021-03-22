SELECT 
    uuid_generate_v4() AS id, 
    version, 
    create_ts,
    created_by, 
    update_ts, 
    sort, 
    transparency, 
    active AS visible, 
    id_layergroup AS product_list_id, 
    id_sublayer AS single_actor_id
FROM 
    base_attr_v, 
    old_and_new_groups_and_subs
WHERE 
    facade = false