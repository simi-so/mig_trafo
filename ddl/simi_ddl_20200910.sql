-- public.simidata_postgres_db definition

-- Drop table

DROP TABLE IF EXISTS public.simidata_postgres_db CASCADE;

CREATE TABLE public.simidata_postgres_db (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	db_name varchar(100) NOT NULL,
	default_value bool NULL,
	CONSTRAINT simidata_postgres_db_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX idx_simidata_postgres_db_uk_db_name ON public.simidata_postgres_db USING btree (db_name) WHERE (delete_ts IS NULL);


-- public.simidata_raster_ds definition

-- Drop table

DROP TABLE IF EXISTS public.simidata_raster_ds CASCADE;

CREATE TABLE public.simidata_raster_ds (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	"path" varchar(200) NOT NULL,
	remarks text NULL,
	description text NULL,
	CONSTRAINT simidata_raster_ds_pkey PRIMARY KEY (id)
);


-- public.simidata_table_ds definition

-- Drop table

DROP TABLE IF EXISTS public.simidata_table_ds CASCADE;

CREATE TABLE public.simidata_table_ds (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	dtype varchar(31) NULL,
	table_name varchar(100) NOT NULL,
	remarks text NULL,
	CONSTRAINT simidata_table_ds_pkey PRIMARY KEY (id)
);


-- public.simiiam_identity definition

-- Drop table

DROP TABLE IF EXISTS public.simiiam_identity CASCADE;

CREATE TABLE public.simiiam_identity (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	dtype varchar(31) NULL,
	identifier varchar(100) NOT NULL,
	remarks text NULL,
	CONSTRAINT simiiam_identity_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX idx_simiiam_identity_uk_identifier ON public.simiiam_identity USING btree (identifier) WHERE (delete_ts IS NULL);


-- public.simiiam_role definition

-- Drop table

DROP TABLE IF EXISTS public.simiiam_role CASCADE;

CREATE TABLE public.simiiam_role (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	"name" varchar(100) NOT NULL,
	remarks text NULL,
	CONSTRAINT simiiam_role_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX idx_simiiam_role_uk_name ON public.simiiam_role USING btree (name) WHERE (delete_ts IS NULL);


-- public.simiproduct_data_product_pub_scope definition

-- Drop table

DROP TABLE IF EXISTS public.simiproduct_data_product_pub_scope CASCADE;

CREATE TABLE public.simiproduct_data_product_pub_scope (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	display_text varchar(100) NOT NULL,
	overall_state int4 NOT NULL,
	default_value bool NOT NULL,
	for_dsv bool NOT NULL,
	for_group bool NOT NULL,
	for_map bool NOT NULL,
	pub_to_wms bool NOT NULL,
	pub_to_wgc bool NOT NULL,
	pub_to_locator bool NOT NULL,
	sort int4 NOT NULL,
	CONSTRAINT simiproduct_data_product_pub_scope_pkey PRIMARY KEY (id)
);


-- public.simidata_external_table definition

-- Drop table

DROP TABLE IF EXISTS public.simidata_external_table CASCADE;

CREATE TABLE public.simidata_external_table (
	id uuid NOT NULL,
	CONSTRAINT simidata_external_table_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simidata_external_table_on_id FOREIGN KEY (id) REFERENCES simidata_table_ds(id) ON DELETE CASCADE
);


-- public.simidata_model_schema definition

-- Drop table

DROP TABLE IF EXISTS public.simidata_model_schema CASCADE;

CREATE TABLE public.simidata_model_schema (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	schema_name varchar(100) NOT NULL,
	model_name varchar(100) NULL,
	postgres_db_id uuid NOT NULL,
	CONSTRAINT simidata_model_schema_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simidata_model_schema_on_postgres_db FOREIGN KEY (postgres_db_id) REFERENCES simidata_postgres_db(id)
);
CREATE INDEX idx_simidata_model_schema_on_postgres_db ON public.simidata_model_schema USING btree (postgres_db_id);
CREATE UNIQUE INDEX idx_simidata_model_schema_unq_schema_name_postgres_db_id ON public.simidata_model_schema USING btree (schema_name, postgres_db_id) WHERE (delete_ts IS NULL);


-- public.simidata_postgres_table definition

-- Drop table

DROP TABLE IF EXISTS public.simidata_postgres_table CASCADE;

CREATE TABLE public.simidata_postgres_table (
	id uuid NOT NULL,
	id_field_name varchar(100) NOT NULL,
	model_schema_id uuid NOT NULL,
	description_model text NULL,
	description_override text NULL,
	cat_sync_stamp timestamp NOT NULL,
	geo_field_name varchar(100) NULL,
	geo_type varchar(100) NULL,
	geo_epsg_code int4 NULL,
	CONSTRAINT simidata_postgres_table_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simidata_postgres_table_on_id FOREIGN KEY (id) REFERENCES simidata_table_ds(id) ON DELETE CASCADE,
	CONSTRAINT fk_simidata_postgres_table_on_model_schema FOREIGN KEY (model_schema_id) REFERENCES simidata_model_schema(id)
);
CREATE INDEX idx_simidata_postgres_table_on_model_schema ON public.simidata_postgres_table USING btree (model_schema_id);


-- public.simidata_table_field definition

-- Drop table

DROP TABLE IF EXISTS public.simidata_table_field CASCADE;

CREATE TABLE public.simidata_table_field (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	"name" varchar(100) NOT NULL,
	description_model text NULL,
	description_override text NULL,
	type_name varchar(100) NOT NULL,
	mandatory bool NOT NULL,
	reg_ex_pattern varchar(512) NULL,
	str_length int4 NULL,
	cat_synced bool NOT NULL,
	remarks text NULL,
	remarks_model text NULL,
	postgres_table_id uuid NOT NULL,
	CONSTRAINT simidata_table_field_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simidata_table_field_on_postgres_table FOREIGN KEY (postgres_table_id) REFERENCES simidata_postgres_table(id)
);
CREATE INDEX idx_simidata_table_field_on_postgres_table ON public.simidata_table_field USING btree (postgres_table_id);
CREATE UNIQUE INDEX idx_simidata_table_field_unq_name_postgres_table_id ON public.simidata_table_field USING btree (name, postgres_table_id) WHERE (delete_ts IS NULL);


-- public.simiiam_group definition

-- Drop table

DROP TABLE IF EXISTS public.simiiam_group CASCADE;

CREATE TABLE public.simiiam_group (
	id uuid NOT NULL,
	pub_as_user bool NOT NULL,
	CONSTRAINT simiiam_group_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiiam_group_on_id FOREIGN KEY (id) REFERENCES simiiam_identity(id) ON DELETE CASCADE
);


-- public.simiiam_role_group_link definition

-- Drop table

DROP TABLE IF EXISTS public.simiiam_role_group_link CASCADE;

CREATE TABLE public.simiiam_role_group_link (
	group_id uuid NOT NULL,
	role_id uuid NOT NULL,
	CONSTRAINT simiiam_role_group_link_pkey PRIMARY KEY (group_id, role_id),
	CONSTRAINT fk_simrolgro_on_group FOREIGN KEY (group_id) REFERENCES simiiam_group(id),
	CONSTRAINT fk_simrolgro_on_role FOREIGN KEY (role_id) REFERENCES simiiam_role(id)
);


-- public.simiiam_user definition

-- Drop table

DROP TABLE IF EXISTS public.simiiam_user CASCADE;

CREATE TABLE public.simiiam_user (
	id uuid NOT NULL,
	firstname varchar(100) NOT NULL,
	lastname varchar(100) NOT NULL,
	CONSTRAINT simiiam_user_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiiam_user_on_id FOREIGN KEY (id) REFERENCES simiiam_identity(id) ON DELETE CASCADE
);


-- public.simiproduct_data_product definition

-- Drop table

DROP TABLE IF EXISTS public.simiproduct_data_product CASCADE;

CREATE TABLE public.simiproduct_data_product (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	dtype varchar(31) NULL,
	identifier varchar(100) NOT NULL,
	pub_scope_id uuid NOT NULL,
	keywords varchar(200) NULL,
	remarks text NULL,
	synonyms varchar(200) NULL,
	title varchar(200) NULL,
	released_at timestamp NULL,
	released_through varchar(100) NULL,
	CONSTRAINT simiproduct_data_product_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiproduct_data_product_on_pub_scope FOREIGN KEY (pub_scope_id) REFERENCES simiproduct_data_product_pub_scope(id)
);
CREATE INDEX idx_simiproduct_data_product_on_pub_scope ON public.simiproduct_data_product USING btree (pub_scope_id);
CREATE UNIQUE INDEX idx_simiproduct_data_product_uk_identifier ON public.simiproduct_data_product USING btree (identifier) WHERE (delete_ts IS NULL);


-- public.simiproduct_product_list definition

-- Drop table

DROP TABLE IF EXISTS public.simiproduct_product_list CASCADE;

CREATE TABLE public.simiproduct_product_list (
	id uuid NOT NULL,
	CONSTRAINT simiproduct_product_list_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiproduct_product_list_on_id FOREIGN KEY (id) REFERENCES simiproduct_data_product(id) ON DELETE CASCADE
);


-- public.simiproduct_single_actor definition

-- Drop table

DROP TABLE IF EXISTS public.simiproduct_single_actor CASCADE;

CREATE TABLE public.simiproduct_single_actor (
	id uuid NOT NULL,
	transparency int4 NOT NULL,
	CONSTRAINT simiproduct_single_actor_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiproduct_single_actor_on_id FOREIGN KEY (id) REFERENCES simiproduct_data_product(id) ON DELETE CASCADE
);


-- public.simiiam_group_user_link definition

-- Drop table

DROP TABLE IF EXISTS public.simiiam_group_user_link CASCADE;

CREATE TABLE public.simiiam_group_user_link (
	group_id uuid NOT NULL,
	user_id uuid NOT NULL,
	CONSTRAINT simiiam_group_user_link_pkey PRIMARY KEY (group_id, user_id),
	CONSTRAINT fk_simgrouse_on_group FOREIGN KEY (group_id) REFERENCES simiiam_group(id),
	CONSTRAINT fk_simgrouse_on_user FOREIGN KEY (user_id) REFERENCES simiiam_user(id)
);


-- public.simiiam_role_user_link definition

-- Drop table

DROP TABLE IF EXISTS public.simiiam_role_user_link CASCADE;

CREATE TABLE public.simiiam_role_user_link (
	user_id uuid NOT NULL,
	role_id uuid NOT NULL,
	CONSTRAINT simiiam_role_user_link_pkey PRIMARY KEY (user_id, role_id),
	CONSTRAINT fk_simroluse_on_role FOREIGN KEY (role_id) REFERENCES simiiam_role(id),
	CONSTRAINT fk_simroluse_on_user FOREIGN KEY (user_id) REFERENCES simiiam_user(id)
);


-- public.simiproduct_data_set_view definition

-- Drop table

DROP TABLE IF EXISTS public.simiproduct_data_set_view CASCADE;

CREATE TABLE public.simiproduct_data_set_view (
	id uuid NOT NULL,
	raw_download bool NOT NULL,
	"name" varchar(100) NULL,
	style_server text NULL,
	style_desktop text NULL,
	search_type int4 NOT NULL,
	search_facet varchar(100) NULL,
	search_filter_word varchar(100) NULL,
	CONSTRAINT simiproduct_data_set_view_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiproduct_data_set_view_on_id FOREIGN KEY (id) REFERENCES simiproduct_single_actor(id) ON DELETE CASCADE
);


-- public.simiproduct_facade_layer definition

-- Drop table

DROP TABLE IF EXISTS public.simiproduct_facade_layer CASCADE;

CREATE TABLE public.simiproduct_facade_layer (
	id uuid NOT NULL,
	CONSTRAINT simiproduct_facade_layer_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiproduct_facade_layer_on_id FOREIGN KEY (id) REFERENCES simiproduct_single_actor(id) ON DELETE CASCADE
);


-- public.simiproduct_layer_group definition

-- Drop table

DROP TABLE IF EXISTS public.simiproduct_layer_group CASCADE;

CREATE TABLE public.simiproduct_layer_group (
	id uuid NOT NULL,
	CONSTRAINT simiproduct_layer_group_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiproduct_layer_group_on_id FOREIGN KEY (id) REFERENCES simiproduct_product_list(id) ON DELETE CASCADE
);


-- public.simiproduct_map definition

-- Drop table

DROP TABLE IF EXISTS public.simiproduct_map CASCADE;

CREATE TABLE public.simiproduct_map (
	id uuid NOT NULL,
	background bool NOT NULL,
	wgc_url_value varchar(50) NOT NULL,
	CONSTRAINT simiproduct_map_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiproduct_map_on_id FOREIGN KEY (id) REFERENCES simiproduct_product_list(id) ON DELETE CASCADE
);


-- public.simiproduct_properties_in_facade definition

-- Drop table

DROP TABLE IF EXISTS public.simiproduct_properties_in_facade CASCADE;

CREATE TABLE public.simiproduct_properties_in_facade (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	sort int4 NOT NULL,
	transparency int4 NOT NULL,
	data_set_view_id uuid NULL,
	facade_layer_id uuid NULL,
	CONSTRAINT simiproduct_properties_in_facade_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiproduct_properties_in_facade_on_data_set_view FOREIGN KEY (data_set_view_id) REFERENCES simiproduct_data_set_view(id),
	CONSTRAINT fk_simiproduct_properties_in_facade_on_facade_layer FOREIGN KEY (facade_layer_id) REFERENCES simiproduct_facade_layer(id)
);
CREATE INDEX idx_simiproduct_properties_in_facade_on_data_set_view ON public.simiproduct_properties_in_facade USING btree (data_set_view_id);
CREATE INDEX idx_simiproduct_properties_in_facade_on_facade_layer ON public.simiproduct_properties_in_facade USING btree (facade_layer_id);
CREATE UNIQUE INDEX idx_simiproduct_properties_in_facade_unq_data_set_view_id_facad ON public.simiproduct_properties_in_facade USING btree (data_set_view_id, facade_layer_id) WHERE (delete_ts IS NULL);


-- public.simiproduct_properties_in_list definition

-- Drop table

DROP TABLE IF EXISTS public.simiproduct_properties_in_list CASCADE;

CREATE TABLE public.simiproduct_properties_in_list (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	sort int4 NOT NULL,
	transparency int4 NOT NULL,
	visible bool NOT NULL,
	product_list_id uuid NULL,
	single_actor_id uuid NULL,
	CONSTRAINT simiproduct_properties_in_list_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simiproduct_properties_in_list_on_product_list FOREIGN KEY (product_list_id) REFERENCES simiproduct_product_list(id),
	CONSTRAINT fk_simiproduct_properties_in_list_on_single_actor FOREIGN KEY (single_actor_id) REFERENCES simiproduct_single_actor(id)
);
CREATE UNIQUE INDEX idx_simi_properties_in_list_unq_product_list_id_single_actor_id ON public.simiproduct_properties_in_list USING btree (product_list_id, single_actor_id) WHERE (delete_ts IS NULL);
CREATE INDEX idx_simiproduct_properties_in_list_on_product_list ON public.simiproduct_properties_in_list USING btree (product_list_id);
CREATE INDEX idx_simiproduct_properties_in_list_on_single_actor ON public.simiproduct_properties_in_list USING btree (single_actor_id);


-- public.simidata_raster_view definition

-- Drop table

DROP TABLE IF EXISTS public.simidata_raster_view CASCADE;

CREATE TABLE public.simidata_raster_view (
	id uuid NOT NULL,
	raster_ds_id uuid NOT NULL,
	CONSTRAINT simidata_raster_view_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simidata_raster_view_on_id FOREIGN KEY (id) REFERENCES simiproduct_data_set_view(id) ON DELETE CASCADE,
	CONSTRAINT fk_simidata_raster_view_on_raster_ds FOREIGN KEY (raster_ds_id) REFERENCES simidata_raster_ds(id)
);
CREATE INDEX idx_simidata_raster_view_on_raster_ds ON public.simidata_raster_view USING btree (raster_ds_id);


-- public.simidata_table_view definition

-- Drop table

DROP TABLE IF EXISTS public.simidata_table_view CASCADE;

CREATE TABLE public.simidata_table_view (
	id uuid NOT NULL,
	where_clause varchar(200) NULL,
	geom_field_name varchar(100) NULL,
	geo_type varchar(100) NULL,
	geo_epsg_code int4 NULL,
	wgc_edit bool NOT NULL,
	postgres_table_id uuid NOT NULL,
	CONSTRAINT simidata_table_view_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simidata_table_view_on_id FOREIGN KEY (id) REFERENCES simiproduct_data_set_view(id) ON DELETE CASCADE,
	CONSTRAINT fk_simidata_table_view_on_postgres_table FOREIGN KEY (postgres_table_id) REFERENCES simidata_postgres_table(id)
);
CREATE INDEX idx_simidata_table_view_on_postgres_table ON public.simidata_table_view USING btree (postgres_table_id);


-- public.simidata_view_field definition

-- Drop table

DROP TABLE IF EXISTS public.simidata_view_field CASCADE;

CREATE TABLE public.simidata_view_field (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	ext1 text NULL,
	ext2 text NULL,
	ext3 text NULL,
	ext4 text NULL,
	ext5 text NULL,
	sort int4 NOT NULL,
	alias varchar(100) NULL,
	wms_fi_format varchar(100) NULL,
	display_props4_json text NULL,
	table_field_id uuid NOT NULL,
	table_view_id uuid NOT NULL,
	CONSTRAINT simidata_view_field_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simidata_view_field_on_table_field FOREIGN KEY (table_field_id) REFERENCES simidata_table_field(id),
	CONSTRAINT fk_simidata_view_field_on_table_view FOREIGN KEY (table_view_id) REFERENCES simidata_table_view(id)
);
CREATE UNIQUE INDEX idx_simi_view_field_unq_table_field_id_table_view_id ON public.simidata_view_field USING btree (table_field_id, table_view_id) WHERE (delete_ts IS NULL);
CREATE INDEX idx_simidata_view_field_on_table_field ON public.simidata_view_field USING btree (table_field_id);
CREATE INDEX idx_simidata_view_field_on_table_view ON public.simidata_view_field USING btree (table_view_id);
