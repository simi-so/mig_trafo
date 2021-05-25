SELECT 
    id, 
    false AS background --Was ist das genau? 
FROM 
    simiproduct_data_product
WHERE 
    id NOT IN (SELECT id FROM simiproduct_layer_group)
    AND
    id NOT IN (SELECT id FROM simiproduct_single_actor)
