SELECT 
    id, 
    postgres_table_id, 
    search_type,
    search_facet,
    search_filter_word
FROM 
    public.simidata_table_view;
