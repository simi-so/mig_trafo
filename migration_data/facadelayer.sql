SELECT 
    simiproduct_data_product.id AS id 
FROM 
    (         SELECT ows_layer.gdi_oid,
                     ows_layer.layer_transparency,
                CASE
                    WHEN lower(ows_layer.name::text) = ANY (ARRAY['ch.so.agi.grundbuchplan_farbig'::text, 'ch.so.agi.grundbuchplan_sw'::text, 'ch.so.agi.hintergrundkarte_farbig'::text, 'ch.so.agi.hintergrundkarte_ortho'::text, 'ch.so.agi.hintergrundkarte_sw'::text]) THEN 'background'::text
                    ELSE 'foreground'::text
                END AS facet,
                CASE ows_layer_group.facade
                    WHEN true THEN 'facadelayer'::text
                    WHEN false THEN 'layergroup'::text
                    ELSE 'datasetview'::text
                END AS subclass,
            ows_layer.name AS ident,
            ows_layer.title AS display,
            ows_layer.synonyms,
            concat_ws(', '::text, ows_layer.keywords, 'karte', 'ebene', 'layer') AS keywords,
                CASE
                    WHEN ows_layer.ows_metadata IS NULL THEN false
                    WHEN btrim(ows_layer.ows_metadata::text) = ''::text THEN false
                    ELSE true
                END AS dset_info
           FROM gdi_knoten.ows_layer
             LEFT JOIN gdi_knoten.ows_layer_group ON ows_layer.gdi_oid = ows_layer_group.gdi_oid
	         LEFT JOIN gdi_knoten.ows_layer_data ON ows_layer.gdi_oid = ows_layer_data.gdi_oid 
	         LEFT JOIN gdi_knoten.data_set_view ON ows_layer_data.gdi_oid_data_set_view = data_set_view.gdi_oid
          WHERE (ows_layer.gdi_oid <> ALL (ARRAY[2::bigint, 4::bigint]))
	 ) product,
    simiproduct_data_product
    WHERE 
    product.ident = simiproduct_data_product.identifier
	AND product.subclass = 'facadelayer'
