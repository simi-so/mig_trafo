SELECT 
        --id_user,
	--olduser.name AS old_user_name,
	simi_user.id AS user_id,
	--id_role, 
	--oldrole.name AS old_role_name, 
	simi_role.id AS role_id
FROM 
    iam.user_role 
LEFT JOIN 
    iam.user olduser ON user_role.id_user = olduser.id
LEFT JOIN 
    iam.role oldrole ON user_role.id_role = oldrole.id
LEFT JOIN 
    simiiam_role simi_role ON oldrole.name = simi_role.name
LEFT JOIN 
    (SELECT id, identifier FROM simiiam_identity WHERE dtype = 'simiIAM_User') simi_user ON olduser.name = simi_user.identifier