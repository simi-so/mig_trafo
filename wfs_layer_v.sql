CREATE OR REPLACE VIEW gdi_knoten.wfs_layer_v
AS select 
    ows_layer.name as layer_name, 
    data_set_view."name" as data_set_view_name
from 
    gdi_knoten.group_layer group_layer
left join 
    gdi_knoten.ows_layer ows_layer 
    on 
    group_layer.gdi_oid_sub_layer = ows_layer.gdi_oid 
left join 
    gdi_knoten.ows_layer_data ows_layer_data 
    on 
    ows_layer_data.gdi_oid = ows_layer. gdi_oid
left join 
    gdi_knoten.data_set_view data_set_view
    on 
    data_set_view.gdi_oid = ows_layer_data.gdi_oid_data_set_view 
where 
    gdi_oid_group_layer = 4 -- 4 = WFS-Layer
;
COMMENT ON VIEW gdi_knoten.wms_layer_v IS 'In WFS verfügbare Layer';
GRANT SELECT ON TABLE gdi_knoten.wms_layer_v TO "admin";
GRANT INSERT ON TABLE gdi_knoten.wms_layer_v TO "admin";
GRANT UPDATE ON TABLE gdi_knoten.wms_layer_v TO "admin";
GRANT DELETE ON TABLE gdi_knoten.wms_layer_v TO "admin";
GRANT TRUNCATE ON TABLE gdi_knoten.wms_layer_v TO "admin";
GRANT REFERENCES ON TABLE gdi_knoten.wms_layer_v TO "admin";
GRANT TRIGGER ON TABLE gdi_knoten.wms_layer_v TO "admin";
GRANT SELECT ON TABLE gdi_knoten.wms_layer_v TO gretl;
GRANT INSERT ON TABLE gdi_knoten.wms_layer_v TO gretl;
GRANT UPDATE ON TABLE gdi_knoten.wms_layer_v TO gretl;
GRANT DELETE ON TABLE gdi_knoten.wms_layer_v TO gretl;
GRANT TRUNCATE ON TABLE gdi_knoten.wms_layer_v TO gretl;
GRANT REFERENCES ON TABLE gdi_knoten.wms_layer_v TO gretl;
GRANT TRIGGER ON TABLE gdi_knoten.wms_layer_v TO gretl;
GRANT SELECT ON TABLE gdi_knoten.wms_layer_v TO postgres;
GRANT INSERT ON TABLE gdi_knoten.wms_layer_v TO postgres;
GRANT UPDATE ON TABLE gdi_knoten.wms_layer_v TO postgres;
GRANT DELETE ON TABLE gdi_knoten.wms_layer_v TO postgres;
GRANT TRUNCATE ON TABLE gdi_knoten.wms_layer_v TO postgres;
GRANT REFERENCES ON TABLE gdi_knoten.wms_layer_v TO postgres;
GRANT TRIGGER ON TABLE gdi_knoten.wms_layer_v TO postgres;
