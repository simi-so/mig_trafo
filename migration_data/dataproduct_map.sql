SELECT 
    uuid_generate_v4() AS id, 
    version, 
    create_ts,
    created_by, 
    update_ts, 
    'simiProduct_Map' AS dtype,
    name||'_map' AS identifier, 
    '0a866696-8903-c333-c2c7-db6b6fd8d628'::uuid AS pub_scope_id,  --MUSS NOCH ANGEPASST WERDEN (woher soll diese Information kommen?) 
    title AS title
FROM 
    base_attr_v, 
    gdi_knoten.map
