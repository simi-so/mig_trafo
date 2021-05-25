update simidata_postgres_table set remarks = '';

update simidata_table_field set type_name = 'Stellvertreter';

delete from simidata_data_set_view where id in (select id from simiproduct_data_product where dtype = '1');
delete from simiproduct_single_actor where id in (select id from simiproduct_data_product where dtype = '1');
delete from simiproduct_data_product where dtype = '1';
