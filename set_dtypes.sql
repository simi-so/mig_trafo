UPDATE public.simidata_table_ds set dtype = 'simiData_PostgresTable'

UPDATE simiproduct_data_product set dtype = 'simiProduct_Map' 
WHERE id IN (SELECT id FROM simiproduct_map)

UPDATE simiproduct_data_product set dtype = 'simiProduct_LayerGroup' 
WHERE id IN (SELECT id FROM simiproduct_layer_group)

UPDATE simiproduct_data_product set dtype = 'simiProduct_FacadeLayer' 
WHERE id IN (SELECT id FROM simiproduct_facade_layer)

UPDATE simiproduct_data_product set dtype = 'simiData_RasterView' 
WHERE id IN (SELECT id FROM simidata_raster_view)

UPDATE simiproduct_data_product set dtype = 'simiData_TableView' 
WHERE id IN (SELECT id FROM simidata_table_view)
