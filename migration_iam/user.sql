SELECT 
    id, 
    'dummy' AS firstname, 
    'dummy' AS lastname 
FROM 
    public.simiiam_identity
WHERE 
    dtype = 'simiIAM_User'