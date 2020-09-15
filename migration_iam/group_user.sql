SELECT 
    --id_group,
	--oldgroup.name AS old_group_name,
	simi_group.id AS group_id,
	--id_user, 
	--olduser.name AS old_user_name, 
	simi_user.id AS user_id
FROM 
    iam.group_user 
LEFT JOIN 
    iam.group oldgroup ON group_user.id_group = oldgroup.id
LEFT JOIN 
    iam.user olduser ON group_user.id_user = olduser.id
LEFT JOIN 
    (SELECT id, identifier FROM simiiam_identity WHERE dtype = 'simiIAM_User') simi_user ON olduser.name = simi_user.identifier
LEFT JOIN 
    (SELECT id, identifier FROM simiiam_identity WHERE dtype = 'simiIAM_Group') simi_group ON oldgroup.name = simi_group.identifier