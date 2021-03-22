SELECT 
    id, 
    version, 
    create_ts, 
    created_by, 
    update_ts, 
    updated_by, 
    delete_ts, 
    deleted_by, 
    ext1, 
    ext2, 
    ext3, 
    ext4, 
    ext5, 
    name, 
    description_model, 
    description_override, 
    type_name, 
    mandatory, 
    reg_ex_pattern, 
    str_length, 
    cat_synced, 
    postgres_table_id
FROM 
    public.simidata_table_field;