update simiproduct_data_product set pub_scope_id = '3db555be-7b10-5fb2-1c5d-61af147b3ee4' --WGC, QGIS u. WMS
where 
identifier in (
    select layer_name from gdi_knoten.wms_layer_v
)
and 
identifier in (
    select layer_name from gdi_knoten.wfs_layer_v
)
;
update simiproduct_data_product set pub_scope_id = 'c849480f-40f7-5c33-b002-84da80fadc40' --Nur WMS
where 
identifier in (
    select layer_name from gdi_knoten.wms_layer_v
)
and 
pub_scope_id != '3db555be-7b10-5fb2-1c5d-61af147b3ee4'
;
