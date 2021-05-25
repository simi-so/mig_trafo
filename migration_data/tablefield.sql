select 
    uuid_generate_v4() AS id,
    fields.* 
from (
    SELECT distinct on (data_set_view_attributes.name, postgres_table.id)
        base.version,
        base.create_ts,
        base.created_by,
        base.update_ts,
        data_set_view_attributes.name,
        data_set_view_attributes.description AS description_override,
        array_agg(data_set_view_attributes.gdi_oid) AS type_name,
        false AS mandatory,
        true AS cat_synced,
        postgres_table.id AS postgres_table_id, 
        CASE WHEN alias NOT LIKE '%json_attrs%' 
	    THEN alias END AS alias,
        CASE WHEN alias LIKE '%json_attrs%' 
	    THEN alias END AS display_props4_json,
        format AS wms_fi_format
    FROM 
        gdi_knoten.data_set_view_attributes data_set_view_attributes,
	    gdi_knoten.data_set_view data_set_view, 
	    public.simidata_postgres_table postgres_table,
        base_attr_v base
    WHERE 
        data_set_view.gdi_oid_data_set = any (postgres_table.remarks::int[])
        AND 
        data_set_view_attributes.gdi_oid_data_set_view = data_set_view.gdi_oid
    group by 
        base.version,
        base.create_ts,
        base.created_by,
        base.update_ts,
        data_set_view_attributes.description, 
        data_set_view_attributes.name,
        postgres_table.id,
        alias, 
        format
    ) fields