SELECT 
    uuid_generate_v4() AS id, 
    version, 
    create_ts,
    created_by, 
    update_ts, 
    CASE WHEN level_ = '1'
        THEN '1_read'
        when level_ = '2'
        then '2_read_write'
    end as level_,
	data_set_view_id, 
	role_id
FROM (
    SELECT 
        permissions.rolle,
		role.id AS role_id,
		permissions.data_set_view_name,
		data_set_view.id AS data_set_view_id,
		level_
	FROM 
    	gdi_knoten.permissions_v permissions 
    left join 
        public.simiproduct_data_product data_product 
        on 
        permissions.data_set_view_name = data_product.identifier 
	LEFT JOIN 
    	simidata_data_set_view data_set_view 
		ON 
		data_product.id = data_set_view.id
	LEFT JOIN 
    		simiiam_role role 
		ON 
		role.name = permissions.rolle
	) permissions_role, 
	base_attr_v