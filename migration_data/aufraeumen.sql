update simidata_postgres_table set remarks = NULL;

update simidata_table_field set type_name = 'Stellvertreter';

delete from simidata_data_set_view where id in (select id from simiproduct_data_product where dtype = '1');
delete from simiproduct_single_actor where id in (select id from simiproduct_data_product where dtype = '1');
delete from simiproduct_data_product where dtype = '1';

--Leere Strings auf NULL setzen
update simidata_table_field set alias = null where alias = '';
update simiproduct_data_product set title = null where title = '';
update simiproduct_data_product set remarks = null where remarks = '';
update simiproduct_data_product set synonyms = null where synonyms = '';
update simiproduct_data_product set keywords = null where keywords = '';
update simidata_data_set_view set style_desktop = null where style_desktop = '';
update simidata_data_set_view set style_server = null where style_server = '';
update simidata_table_field set wms_fi_format = null where wms_fi_format = '';
update simidata_table_field set display_props4_json = null where display_props4_json = '';

--Das upload-Datum der Styles muss auf "jetzt" gesetzt werden. 
update simidata_data_set_view set style_desktop_uploaded = now() where style_desktop is not null;
update simidata_data_set_view set style_server_uploaded = now() where style_server is not null;

--Ein komisches Strichlein bei der Feldbeschreibung muss noch raus. 
update simidata_table_field set description_override = null where description_override = '-';

--type_name muss wieder auf 100 Zeichen begrenzt werden
ALTER TABLE public.simidata_table_field ALTER COLUMN type_name TYPE varchar(100) USING type_name::varchar;


