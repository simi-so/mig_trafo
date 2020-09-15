SELECT 
        --id_group,
	--oldgroup.name AS old_group_name,
	simi_group.id AS group_id,
	--id_role, 
	--oldrole.name AS old_role_name, 
	simi_role.id AS role_id
FROM 
    iam.group_role 
LEFT JOIN 
    iam.group oldgroup ON group_role.id_group = oldgroup.id
LEFT JOIN 
    iam.role oldrole ON group_role.id_role = oldrole.id
LEFT JOIN 
    simiiam_role simi_role ON oldrole.name = simi_role.name
LEFT JOIN 
    (SELECT id, identifier FROM simiiam_identity WHERE dtype = 'simiIAM_Group') simi_group ON oldgroup.name = simi_group.identifier