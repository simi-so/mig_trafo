SELECT 
    uuid_generate_v4() AS id, 
	version, 
	create_ts,
	created_by, 
	update_ts, 
	"name", 
        description AS remarks
FROM  
    iam."role", base_attr_v