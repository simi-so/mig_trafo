-- public.simi_data_product_pub_scope definition

-- Drop table

-- DROP TABLE public.simi_data_product_pub_scope;

CREATE TABLE public.simi_data_product_pub_scope (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
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
	CONSTRAINT simi_data_product_pub_scope_pkey PRIMARY KEY (id)
);


-- public.simi_identity definition

-- Drop table

-- DROP TABLE public.simi_identity;

CREATE TABLE public.simi_identity (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	dtype varchar(31) NULL,
	identifier varchar(100) NOT NULL,
	remarks text NULL,
	CONSTRAINT simi_identity_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX idx_simi_identity_uk_identifier ON public.simi_identity USING btree (identifier) WHERE (delete_ts IS NULL);


-- public.simi_role definition

-- Drop table

-- DROP TABLE public.simi_role;

CREATE TABLE public.simi_role (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	name varchar(100) NOT NULL,
	remarks text NULL,
	CONSTRAINT simi_role_pkey PRIMARY KEY (id)
);
CREATE UNIQUE INDEX idx_simi_role_uk_name ON public.simi_role USING btree (name) WHERE (delete_ts IS NULL);


-- public.simi_data_product definition

-- Drop table

-- DROP TABLE public.simi_data_product;

CREATE TABLE public.simi_data_product (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	dtype varchar(31) NULL,
	identifier varchar(100) NOT NULL,
	pub_scope_id uuid NOT NULL,
	keywords varchar(200) NULL,
	remarks text NULL,
	synonyms varchar(200) NULL,
	title varchar(200) NULL,
	released_at timestamp NULL,
	released_through varchar(100) NULL,
	CONSTRAINT simi_data_product_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simi_data_product_on_pub_scope FOREIGN KEY (pub_scope_id) REFERENCES simi_data_product_pub_scope(id)
);
CREATE INDEX idx_simi_data_product_on_pub_scope ON public.simi_data_product USING btree (pub_scope_id);
CREATE UNIQUE INDEX idx_simi_data_product_uk_identifier ON public.simi_data_product USING btree (identifier) WHERE (delete_ts IS NULL);


-- public.simi_group definition

-- Drop table

-- DROP TABLE public.simi_group;

CREATE TABLE public.simi_group (
	id uuid NOT NULL,
	pub_as_user bool NOT NULL,
	CONSTRAINT simi_group_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simi_group_on_id FOREIGN KEY (id) REFERENCES simi_identity(id) ON DELETE CASCADE
);


-- public.simi_product_list definition

-- Drop table

-- DROP TABLE public.simi_product_list;

CREATE TABLE public.simi_product_list (
	id uuid NOT NULL,
	CONSTRAINT simi_product_list_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simi_product_list_on_id FOREIGN KEY (id) REFERENCES simi_data_product(id) ON DELETE CASCADE
);


-- public.simi_role_group_link definition

-- Drop table

-- DROP TABLE public.simi_role_group_link;

CREATE TABLE public.simi_role_group_link (
	group_id uuid NOT NULL,
	role_id uuid NOT NULL,
	CONSTRAINT simi_role_group_link_pkey PRIMARY KEY (group_id, role_id),
	CONSTRAINT fk_rolgro_on_group FOREIGN KEY (group_id) REFERENCES simi_group(id),
	CONSTRAINT fk_rolgro_on_role FOREIGN KEY (role_id) REFERENCES simi_role(id)
);


-- public.simi_single_actor definition

-- Drop table

-- DROP TABLE public.simi_single_actor;

CREATE TABLE public.simi_single_actor (
	id uuid NOT NULL,
	CONSTRAINT simi_single_actor_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simi_single_actor_on_id FOREIGN KEY (id) REFERENCES simi_data_product(id) ON DELETE CASCADE
);


-- public.simi_user definition

-- Drop table

-- DROP TABLE public.simi_user;

CREATE TABLE public.simi_user (
	id uuid NOT NULL,
	firstname varchar(100) NOT NULL,
	lastname varchar(100) NOT NULL,
	CONSTRAINT simi_user_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simi_user_on_id FOREIGN KEY (id) REFERENCES simi_identity(id) ON DELETE CASCADE
);


-- public.simi_group_user_link definition

-- Drop table

-- DROP TABLE public.simi_group_user_link;

CREATE TABLE public.simi_group_user_link (
	group_id uuid NOT NULL,
	user_id uuid NOT NULL,
	CONSTRAINT simi_group_user_link_pkey PRIMARY KEY (group_id, user_id),
	CONSTRAINT fk_grouse_on_group FOREIGN KEY (group_id) REFERENCES simi_group(id),
	CONSTRAINT fk_grouse_on_user FOREIGN KEY (user_id) REFERENCES simi_user(id)
);


-- public.simi_layer_group definition

-- Drop table

-- DROP TABLE public.simi_layer_group;

CREATE TABLE public.simi_layer_group (
	id uuid NOT NULL,
	CONSTRAINT simi_layer_group_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simi_layer_group_on_id FOREIGN KEY (id) REFERENCES simi_product_list(id) ON DELETE CASCADE
);


-- public.simi_map definition

-- Drop table

-- DROP TABLE public.simi_map;

CREATE TABLE public.simi_map (
	id uuid NOT NULL,
	background bool NOT NULL,
	wgc_url_value varchar(50) NOT NULL,
	CONSTRAINT simi_map_pkey PRIMARY KEY (id),
	CONSTRAINT fk_simi_map_on_id FOREIGN KEY (id) REFERENCES simi_product_list(id) ON DELETE CASCADE
);


-- public.simi_properties_in_list definition

-- Drop table

-- DROP TABLE public.simi_properties_in_list;

CREATE TABLE public.simi_properties_in_list (
	id uuid NOT NULL,
	"version" int4 NOT NULL,
	create_ts timestamp NULL,
	created_by varchar(50) NULL,
	update_ts timestamp NULL,
	updated_by varchar(50) NULL,
	delete_ts timestamp NULL,
	deleted_by varchar(50) NULL,
	sort int4 NOT NULL,
	transparency int4 NOT NULL,
	visible bool NOT NULL,
	product_list_id uuid NULL,
	single_actor_id uuid NULL,
	CONSTRAINT simi_properties_in_list_pkey PRIMARY KEY (id),
	CONSTRAINT uk_simi_properties_in_list_on_product_list_id_single_actor_id UNIQUE (product_list_id, single_actor_id),
	CONSTRAINT fk_simi_properties_in_list_on_product_list FOREIGN KEY (product_list_id) REFERENCES simi_product_list(id),
	CONSTRAINT fk_simi_properties_in_list_on_single_actor FOREIGN KEY (single_actor_id) REFERENCES simi_single_actor(id)
);
CREATE INDEX idx_simi_properties_in_list_on_product_list ON public.simi_properties_in_list USING btree (product_list_id);
CREATE INDEX idx_simi_properties_in_list_on_single_actor ON public.simi_properties_in_list USING btree (single_actor_id);


-- public.simi_role_user_link definition

-- Drop table

-- DROP TABLE public.simi_role_user_link;

CREATE TABLE public.simi_role_user_link (
	user_id uuid NOT NULL,
	role_id uuid NOT NULL,
	CONSTRAINT simi_role_user_link_pkey PRIMARY KEY (user_id, role_id),
	CONSTRAINT fk_roluse_on_role FOREIGN KEY (role_id) REFERENCES simi_role(id),
	CONSTRAINT fk_roluse_on_user FOREIGN KEY (user_id) REFERENCES simi_user(id)
);