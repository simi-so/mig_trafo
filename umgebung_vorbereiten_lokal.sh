pg_restore -h localhost -p 54323 -U postgres -d config Dropbox/Arbeit/Simi/soconfig_geodb.rootso.org.dmp --clean

psql -h localhost -p 54323 -d config -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/mig/simi_ddl_20200924.sql

psql -h localhost -p 54323 -d config -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/mig/base_attr_v.sql

psql -h localhost -p 54323 -d config -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/database_ids_view.sql 

psql -h localhost -p 54323 -d config -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/simiproduct_data_product_pub_scope.sql 

psql -h localhost -p 54323 -d config -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/erweitere_synonyms.sql

psql -h localhost -p 54323 -d config -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/wms_layer_v.sql

psql -h localhost -p 54323 -d config -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/wfs_layer_v.sql

psql -h localhost -p 54323 -d config -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/old_groups_and_subs.sql

psql -h localhost -p 54323 -d config -U postgres -c "SET ROLE postgres" -q -f Dropbox/Arbeit/Simi/mig_trafo/permissions_view.sql
