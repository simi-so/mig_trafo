SELECT 
    datasetview.id,
	rasterds.id AS raster_ds_id
FROM 
	gdi_knoten.data_source source,
	gdi_knoten.data_set dataset,
	simidata_data_set_view datasetview, 
	simiproduct_data_product data_product,
	simidata_raster_ds rasterds
WHERE 
    datasetview.id = data_product.id 
    and 
    source.connection = rasterds.path
	AND 
	source.gdi_oid = dataset.gdi_oid_data_source
	AND 
	data_product.identifier = dataset.name
	AND 
	datasetview.id NOT IN (SELECT id FROM simidata_table_view)
