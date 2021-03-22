SELECT 
    id, 
    false AS background, 
    RTRIM(identifier, '_map') AS wgc_url_value
FROM 
    simiproduct_data_product
WHERE 
    id NOT IN (SELECT id FROM simiproduct_layer_group)
    AND
    id NOT IN (SELECT id FROM simiproduct_single_actor)