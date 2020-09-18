with "users" AS (
    SELECT 
        simi_users.identifier AS "name", 
    	array_agg(simi_groups.identifier) AS groups, 
	    array_agg(simi_roles."name") AS roles
    FROM 
        (SELECT id, identifier FROM simiiam_identity WHERE dtype = 'simiIAM_User') simi_users 
        LEFT JOIN 
	    simiiam_group_user_link group_user 
	        ON group_user.user_id = simi_users.id 
    	LEFT JOIN 
	    (SELECT id, identifier FROM simiiam_identity WHERE dtype = 'simiIAM_Group') simi_groups 
	        ON group_user.group_id = simi_groups.id
        LEFT JOIN 
    	simiiam_role_user_link role_user 
	        ON role_user.user_id = simi_users.id 
    	LEFT JOIN 
	    (SELECT id, "name" FROM simiiam_role) simi_roles 
	        ON role_user.role_id = simi_roles.id
    GROUP BY 
        simi_users.identifier
), 
"groups" AS (
    SELECT 
	    simi_groups.identifier AS "name", 
	    array_agg(simi_roles."name") AS roles
	FROM 
        (SELECT id, identifier FROM simiiam_identity WHERE dtype = 'simiIAM_Group') simi_groups 
        LEFT JOIN 
	    simiiam_role_group_link role_group 
	        ON role_group.group_id = simi_groups.id 
    	LEFT JOIN 
	    simiiam_role simi_roles
	        ON role_group.role_id = simi_roles.id
	GROUP BY 
	    simi_groups.identifier
),
"roles" AS (
    SELECT 
	    simi_roles.name AS role, 
	    json_object_agg('permission', json_object_agg('wms_services','values'))
	FROM 
	    simiiam_role simi_roles
)

SELECT 
    json_agg("users") AS users,  
	json_agg("groups") AS "groups" 
from 
    "users", 
	"groups";