-- View: gdi_knoten.permissions_v

-- DROP VIEW gdi_knoten.permissions_v;

CREATE OR REPLACE VIEW gdi_knoten.permissions_v
 AS
 SELECT a.rolle,
    a.data_set_view_name,
    max(a.level_) AS level_
   FROM ( SELECT DISTINCT role.name AS rolle,
            gdi_resource.name AS data_set_view_name,
                CASE
                    WHEN permission.write = false THEN 1
                    ELSE 2
                END AS level_
           FROM iam.resource_permission permission
             LEFT JOIN iam.role role ON role.id = permission.id_role
             LEFT JOIN gdi_knoten.gdi_resource gdi_resource ON permission.gdi_oid_resource = gdi_resource.gdi_oid
          WHERE gdi_resource.table_name = ANY (ARRAY['data_set_edit'::text, 'data_set_view'::text])) a
  GROUP BY a.rolle, a.data_set_view_name;

ALTER TABLE gdi_knoten.permissions_v
    OWNER TO postgres;
COMMENT ON VIEW gdi_knoten.permissions_v
    IS 'Permission_view für die Migration nach Simi';


