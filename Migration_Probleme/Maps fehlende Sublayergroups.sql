SELECT 
    map_product.identifier as map_name,
    layergroup.identifier as layergroup_name
FROM 
    base_attr_v, 
    old_and_new_maps_and_subs
left join 
    simiproduct_data_product as map_product 
    on 
    old_and_new_maps_and_subs.id_layergroup = map_product.id 
left join 
    simiproduct_data_product as layergroup 
    on 
    old_and_new_maps_and_subs.id_sublayer = layergroup.id 
where 
    id_sublayer not in (select id from simiproduct_single_actor)
order by 
    id_layergroup