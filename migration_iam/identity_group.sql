SELECT 
    uuid_generate_v4() AS id, 
	version, 
	create_ts,
	created_by, 
	update_ts, 
	'simiIAM_Group' AS dtype,
	"name" AS identifier, 
        description AS remarks
FROM  
    iam."group", base_attr_v