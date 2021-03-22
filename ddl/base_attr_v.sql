CREATE OR REPLACE VIEW public.base_attr_v
 AS
SELECT 
  1 AS "version",
  'admin' AS created_by,
  now() AS  create_ts, 
  now() AS update_ts
FROM 
  generate_series(1,1) 
;

ALTER TABLE public.base_attr_v
    OWNER TO postgres;