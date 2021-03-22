SELECT 
    uuid_generate_v4() AS id, 
    version, 
    create_ts,
    created_by, 
    update_ts, 
    1 AS dtype, --MUSS NOCH ANGEPASST WERDEN!!!
    ident AS identifier, 
    '0a866696-8903-c333-c2c7-db6b6fd8d628'::uuid AS pub_scope_id,  --MUSS NOCH ANGEPASST WERDEN (woher soll diese Information kommen?)
    keywords AS keywords,
    synonyms AS synonyms, 
	display AS title
FROM 
    (         SELECT ows_layer.gdi_oid,
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
    base_attr_v