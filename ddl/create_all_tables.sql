-- begin SIMIIAM_ROLE
create table SIMIIAM_ROLE (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    NAME varchar(100) not null,
    REMARKS text,
    --
    primary key (ID)
);
-- end SIMIIAM_ROLE
-- begin SIMIIAM_PERMISSION
create table SIMIIAM_PERMISSION (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    LEVEL_ varchar(50) not null,
    DATA_SET_VIEW_ID uuid not null,
    ROLE_ID uuid not null,
    --
    primary key (ID)
);
-- end SIMIIAM_PERMISSION
-- begin SIMIEXTENDED_RELATION
create table SIMIEXTENDED_RELATION (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    RELATION_TYPE varchar(50) not null,
    DEPENDENCY_ID uuid not null,
    DATA_SET_VIEW_ID uuid not null,
    --
    primary key (ID)
);
-- end SIMIEXTENDED_RELATION
-- begin SIMIPRODUCT_DATA_PRODUCT_PUB_SCOPE
create table SIMIPRODUCT_DATA_PRODUCT_PUB_SCOPE (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    DISPLAY_TEXT varchar(100) not null,
    OVERALL_STATE integer not null,
    DEFAULT_VALUE boolean not null,
    FOR_DSV boolean not null,
    FOR_GROUP boolean not null,
    FOR_MAP boolean not null,
    PUB_TO_WMS boolean not null,
    PUB_TO_WGC boolean not null,
    PUB_TO_LOCATOR boolean not null,
    SORT integer not null,
    --
    primary key (ID)
);
-- end SIMIPRODUCT_DATA_PRODUCT_PUB_SCOPE
-- begin SIMIDATA_VIEW_FIELD
create table SIMIDATA_VIEW_FIELD (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    SORT integer not null,
    TABLE_FIELD_ID uuid not null,
    TABLE_VIEW_ID uuid not null,
    --
    primary key (ID)
);
-- end SIMIDATA_VIEW_FIELD
-- begin SIMIDATA_STYLEASSET
create table SIMIDATA_STYLEASSET (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    DATASET_SET_VIEW_ID uuid not null,
    IS_FOR_SERVER boolean not null,
    FILE_NAME varchar(255) not null,
    FILE_CONTENT bytea not null,
    --
    primary key (ID)
);
-- end SIMIDATA_STYLEASSET
-- begin SIMIDATA_POSTGRES_TABLE
create table SIMIDATA_POSTGRES_TABLE (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    ID_FIELD_NAME varchar(100) not null,
    DATA_THEME_ID uuid not null,
    DESCRIPTION_MODEL text,
    CAT_SYNC_STAMP timestamp not null,
    GEO_FIELD_NAME varchar(100),
    GEO_TYPE varchar(100),
    GEO_EPSG_CODE integer,
    TABLE_NAME varchar(100) not null,
    REMARKS text,
    --
    primary key (ID)
);
-- end SIMIDATA_POSTGRES_TABLE
-- begin SIMIDATA_POSTGRES_DB
create table SIMIDATA_POSTGRES_DB (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    DB_NAME varchar(100) not null,
    DB_SERVICE_URL varchar(255) not null,
    DEFAULT_VALUE boolean not null,
    --
    primary key (ID)
);
-- end SIMIDATA_POSTGRES_DB
-- begin SIMIDATA_TABLE_FIELD
create table SIMIDATA_TABLE_FIELD (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    NAME varchar(100) not null,
    DESCRIPTION_MODEL text,
    DESCRIPTION_OVERRIDE text,
    TYPE_NAME varchar(100) not null,
    MANDATORY boolean not null,
    STR_LENGTH integer,
    CAT_SYNCED boolean not null,
    POSTGRES_TABLE_ID uuid not null,
    ALIAS varchar(100),
    WMS_FI_FORMAT varchar(100),
    DISPLAY_PROPS4_JSON text,
    --
    primary key (ID)
);
-- end SIMIDATA_TABLE_FIELD
-- begin SIMIIAM_IDENTITY
create table SIMIIAM_IDENTITY (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    DTYPE varchar(31),
    --
    IDENTIFIER varchar(100) not null,
    REMARKS text,
    --
    primary key (ID)
);
-- end SIMIIAM_IDENTITY
-- begin SIMIDATA_RASTER_DS
create table SIMIDATA_RASTER_DS (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    PATH varchar(200) not null,
    REMARKS text,
    DESCRIPTION text,
    --
    primary key (ID)
);
-- end SIMIDATA_RASTER_DS
-- begin SIMIPRODUCT_DATA_PRODUCT
create table SIMIPRODUCT_DATA_PRODUCT (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    DTYPE varchar(31),
    --
    IDENTIFIER varchar(100) not null,
    DESCRIPTION text,
    PUB_SCOPE_ID uuid not null,
    KEYWORDS varchar(500),
    REMARKS text,
    SYNONYMS varchar(800),
    TITLE varchar(200),
    --
    primary key (ID)
);
-- end SIMIPRODUCT_DATA_PRODUCT
-- begin SIMIEXTENDED_DEPENDENCY
create table SIMIEXTENDED_DEPENDENCY (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    DTYPE varchar(31),
    --
    NAME varchar(100) not null,
    REMARKS text,
    --
    -- from simiExtended_CCCIntegration
    MAP_ID uuid,
    LOCATOR_LAYERS text,
    NOTIFY_LAYERS text,
    --
    -- from simiExtended_FeatureInfo
    DISPLAY_TEMPLATE text,
    SQL_QUERY text,
    PY_MODULE_NAME varchar(100),
    --
    primary key (ID)
);
-- end SIMIEXTENDED_DEPENDENCY
-- begin SIMIDATA_DATA_THEME
create table SIMIDATA_DATA_THEME (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    --
    SCHEMA_NAME varchar(100) not null,
    POSTGRES_DB_ID uuid not null,
    --
    primary key (ID)
);
-- end SIMIDATA_DATA_THEME
-- begin SIMIPRODUCT_EXTERNAL_MAP_SERVICE
create table SIMIPRODUCT_EXTERNAL_MAP_SERVICE (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    SERVICE_TYPE varchar(50) not null,
    URL varchar(255) not null,
    REMARKS text,
    --
    primary key (ID)
);
-- end SIMIPRODUCT_EXTERNAL_MAP_SERVICE
-- begin SIMIPRODUCT_PROPERTIES_IN_LIST
create table SIMIPRODUCT_PROPERTIES_IN_LIST (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    SORT integer not null,
    --
    VISIBLE boolean not null,
    PRODUCT_LIST_ID uuid not null,
    SINGLE_ACTOR_ID uuid not null,
    --
    primary key (ID)
);
-- end SIMIPRODUCT_PROPERTIES_IN_LIST
-- begin SIMIPRODUCT_PROPERTIES_IN_FACADE
create table SIMIPRODUCT_PROPERTIES_IN_FACADE (
    ID uuid,
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    VERSION integer not null,
    SORT integer not null,
    --
    DATA_SET_VIEW_ID uuid not null,
    FACADE_LAYER_ID uuid not null,
    --
    primary key (ID)
);
-- end SIMIPRODUCT_PROPERTIES_IN_FACADE
-- begin SIMIIAM_USER
create table SIMIIAM_USER (
    ID uuid,
    --
    FIRSTNAME varchar(100) not null,
    LASTNAME varchar(100) not null,
    --
    primary key (ID)
);
-- end SIMIIAM_USER
-- begin SIMIIAM_GROUP
create table SIMIIAM_GROUP (
    ID uuid,
    --
    PUB_AS_USER boolean not null,
    --
    primary key (ID)
);
-- end SIMIIAM_GROUP
-- begin SIMIPRODUCT_SINGLE_ACTOR
create table SIMIPRODUCT_SINGLE_ACTOR (
    ID uuid,
    --
    TRANSPARENCY integer not null,
    CUSTOM_LEGEND bytea,
    CUSTOM_LEGEND_SUFFIX varchar(100),
    --
    primary key (ID)
);
-- end SIMIPRODUCT_SINGLE_ACTOR
-- begin SIMIPRODUCT_PRODUCT_LIST
create table SIMIPRODUCT_PRODUCT_LIST (
    ID uuid,
    --
    primary key (ID)
);
-- end SIMIPRODUCT_PRODUCT_LIST
-- begin SIMIPRODUCT_FACADE_LAYER
create table SIMIPRODUCT_FACADE_LAYER (
    ID uuid,
    --
    primary key (ID)
);
-- end SIMIPRODUCT_FACADE_LAYER
-- begin SIMIDATA_DATA_SET_VIEW
create table SIMIDATA_DATA_SET_VIEW (
    ID uuid,
    --
    RAW_DOWNLOAD boolean not null,
    STYLE_SERVER text,
    STYLE_SERVER_UPLOADED timestamp,
    STYLE_DESKTOP text,
    STYLE_DESKTOP_UPLOADED timestamp,
    --
    primary key (ID)
);
-- end SIMIDATA_DATA_SET_VIEW
-- begin SIMIPRODUCT_EXTERNAL_MAP_LAYERS
create table SIMIPRODUCT_EXTERNAL_MAP_LAYERS (
    ID uuid,
    --
    IDENTIFIER_LIST varchar(255) not null,
    SERVICE_ID uuid not null,
    --
    primary key (ID)
);
-- end SIMIPRODUCT_EXTERNAL_MAP_LAYERS
-- begin SIMIPRODUCT_LAYER_GROUP
create table SIMIPRODUCT_LAYER_GROUP (
    ID uuid,
    --
    primary key (ID)
);
-- end SIMIPRODUCT_LAYER_GROUP
-- begin SIMIPRODUCT_MAP
create table SIMIPRODUCT_MAP (
    ID uuid,
    --
    BACKGROUND boolean not null,
    --
    primary key (ID)
);
-- end SIMIPRODUCT_MAP
-- begin SIMIDATA_RASTER_VIEW
create table SIMIDATA_RASTER_VIEW (
    ID uuid,
    --
    RASTER_DS_ID uuid not null,
    --
    primary key (ID)
);
-- end SIMIDATA_RASTER_VIEW
-- begin SIMIDATA_TABLE_VIEW
create table SIMIDATA_TABLE_VIEW (
    ID uuid,
    --
    POSTGRES_TABLE_ID uuid not null,
    SEARCH_TYPE varchar(50) not null,
    SEARCH_FACET varchar(100),
    SEARCH_FILTER_WORD varchar(100),
    --
    primary key (ID)
);
-- end SIMIDATA_TABLE_VIEW
-- begin SIMIIAM_GROUP_USER_LINK
create table SIMIIAM_GROUP_USER_LINK (
    GROUP_ID uuid,
    USER_ID uuid,
    primary key (GROUP_ID, USER_ID)
);
-- end SIMIIAM_GROUP_USER_LINK
-- begin SIMIIAM_ROLE_GROUP_LINK
create table SIMIIAM_ROLE_GROUP_LINK (
    GROUP_ID uuid,
    ROLE_ID uuid,
    primary key (GROUP_ID, ROLE_ID)
);
-- end SIMIIAM_ROLE_GROUP_LINK
-- begin SIMIIAM_ROLE_USER_LINK
create table SIMIIAM_ROLE_USER_LINK (
    USER_ID uuid,
    ROLE_ID uuid,
    primary key (USER_ID, ROLE_ID)
);
-- end SIMIIAM_ROLE_USER_LINK
-- begin SIMIIAM_ROLE
create unique index IDX_SIMIIAM_ROLE_UK_NAME on SIMIIAM_ROLE (NAME);
-- end SIMIIAM_ROLE
-- begin SIMIIAM_PERMISSION
alter table SIMIIAM_PERMISSION add constraint FK_SIMIIAM_PERMISSION_ON_DATA_SET_VIEW foreign key (DATA_SET_VIEW_ID) references SIMIDATA_DATA_SET_VIEW(ID) on delete CASCADE;
alter table SIMIIAM_PERMISSION add constraint FK_SIMIIAM_PERMISSION_ON_ROLE foreign key (ROLE_ID) references SIMIIAM_ROLE(ID) on delete CASCADE;
create unique index IDX_SIMI_PERMISSION_UNQ_DATA_SET_VIEW_ID_ROLE_ID on SIMIIAM_PERMISSION (DATA_SET_VIEW_ID, ROLE_ID);
create index IDX_SIMIIAM_PERMISSION_ON_DATA_SET_VIEW on SIMIIAM_PERMISSION (DATA_SET_VIEW_ID);
create index IDX_SIMIIAM_PERMISSION_ON_ROLE on SIMIIAM_PERMISSION (ROLE_ID);
-- end SIMIIAM_PERMISSION
-- begin SIMIEXTENDED_RELATION
alter table SIMIEXTENDED_RELATION add constraint FK_SIMIEXTENDED_RELATION_ON_DEPENDENCY foreign key (DEPENDENCY_ID) references SIMIEXTENDED_DEPENDENCY(ID) on delete CASCADE;
alter table SIMIEXTENDED_RELATION add constraint FK_SIMIEXTENDED_RELATION_ON_DATA_SET_VIEW foreign key (DATA_SET_VIEW_ID) references SIMIDATA_DATA_SET_VIEW(ID) on delete CASCADE;
create unique index IDX_SIMI_RELATION_UNQ on SIMIEXTENDED_RELATION (RELATION_TYPE, DEPENDENCY_ID, DATA_SET_VIEW_ID);
create index IDX_SIMIEXTENDED_RELATION_ON_DEPENDENCY on SIMIEXTENDED_RELATION (DEPENDENCY_ID);
create index IDX_SIMIEXTENDED_RELATION_ON_DATA_SET_VIEW on SIMIEXTENDED_RELATION (DATA_SET_VIEW_ID);
-- end SIMIEXTENDED_RELATION
-- begin SIMIDATA_VIEW_FIELD
alter table SIMIDATA_VIEW_FIELD add constraint FK_SIMIDATA_VIEW_FIELD_ON_TABLE_FIELD foreign key (TABLE_FIELD_ID) references SIMIDATA_TABLE_FIELD(ID) on delete CASCADE;
alter table SIMIDATA_VIEW_FIELD add constraint FK_SIMIDATA_VIEW_FIELD_ON_TABLE_VIEW foreign key (TABLE_VIEW_ID) references SIMIDATA_TABLE_VIEW(ID) on delete CASCADE;
create unique index IDX_SIMI_VIEW_FIELD_UNQ_TABLE_FIELD_ID_TABLE_VIEW_ID on SIMIDATA_VIEW_FIELD (TABLE_FIELD_ID, TABLE_VIEW_ID);
create index IDX_SIMIDATA_VIEW_FIELD_ON_TABLE_FIELD on SIMIDATA_VIEW_FIELD (TABLE_FIELD_ID);
create index IDX_SIMIDATA_VIEW_FIELD_ON_TABLE_VIEW on SIMIDATA_VIEW_FIELD (TABLE_VIEW_ID);
-- end SIMIDATA_VIEW_FIELD
-- begin SIMIDATA_STYLEASSET
alter table SIMIDATA_STYLEASSET add constraint FK_SIMIDATA_STYLEASSET_ON_DATASET_SET_VIEW foreign key (DATASET_SET_VIEW_ID) references SIMIDATA_DATA_SET_VIEW(ID) on delete CASCADE;
create index IDX_SIMIDATA_STYLEASSET_ON_DATASET_SET_VIEW on SIMIDATA_STYLEASSET (DATASET_SET_VIEW_ID);
-- end SIMIDATA_STYLEASSET
-- begin SIMIDATA_POSTGRES_TABLE
alter table SIMIDATA_POSTGRES_TABLE add constraint FK_SIMIDATA_POSTGRES_TABLE_ON_DATA_THEME foreign key (DATA_THEME_ID) references SIMIDATA_DATA_THEME(ID);
create unique index IDX_SIMI_POSTGRES_TABLE_UNQ on SIMIDATA_POSTGRES_TABLE (DATA_THEME_ID, TABLE_NAME);
create index IDX_SIMIDATA_POSTGRES_TABLE_ON_DATA_THEME on SIMIDATA_POSTGRES_TABLE (DATA_THEME_ID);
-- end SIMIDATA_POSTGRES_TABLE
-- begin SIMIDATA_POSTGRES_DB
create unique index IDX_SIMIDATA_POSTGRES_DB_UK_DB_SERVICE_URL on SIMIDATA_POSTGRES_DB (DB_SERVICE_URL);
create unique index IDX_SIMIDATA_POSTGRES_DB_UK_DB_NAME on SIMIDATA_POSTGRES_DB (DB_NAME);
-- end SIMIDATA_POSTGRES_DB
-- begin SIMIDATA_TABLE_FIELD
alter table SIMIDATA_TABLE_FIELD add constraint FK_SIMIDATA_TABLE_FIELD_ON_POSTGRES_TABLE foreign key (POSTGRES_TABLE_ID) references SIMIDATA_POSTGRES_TABLE(ID) on delete CASCADE;
create unique index IDX_SIMIDATA_TABLE_FIELD_UNQ_NAME_POSTGRES_TABLE_ID on SIMIDATA_TABLE_FIELD (NAME, POSTGRES_TABLE_ID);
create index IDX_SIMIDATA_TABLE_FIELD_ON_POSTGRES_TABLE on SIMIDATA_TABLE_FIELD (POSTGRES_TABLE_ID);
-- end SIMIDATA_TABLE_FIELD
-- begin SIMIIAM_IDENTITY
create unique index IDX_SIMIIAM_IDENTITY_UK_IDENTIFIER on SIMIIAM_IDENTITY (IDENTIFIER);
-- end SIMIIAM_IDENTITY
-- begin SIMIDATA_RASTER_DS
create unique index IDX_SIMIDATA_RASTER_DS_UK_PATH on SIMIDATA_RASTER_DS (PATH);
-- end SIMIDATA_RASTER_DS
-- begin SIMIPRODUCT_DATA_PRODUCT
alter table SIMIPRODUCT_DATA_PRODUCT add constraint FK_SIMIPRODUCT_DATA_PRODUCT_ON_PUB_SCOPE foreign key (PUB_SCOPE_ID) references SIMIPRODUCT_DATA_PRODUCT_PUB_SCOPE(ID);
create unique index IDX_SIMIPRODUCT_DATA_PRODUCT_UK_IDENTIFIER on SIMIPRODUCT_DATA_PRODUCT (IDENTIFIER);
create index IDX_SIMIPRODUCT_DATA_PRODUCT_ON_PUB_SCOPE on SIMIPRODUCT_DATA_PRODUCT (PUB_SCOPE_ID);
-- end SIMIPRODUCT_DATA_PRODUCT
-- begin SIMIEXTENDED_DEPENDENCY
alter table SIMIEXTENDED_DEPENDENCY add constraint FK_SIMIEXTENDED_DEPENDENCY_ON_MAP foreign key (MAP_ID) references SIMIPRODUCT_MAP(ID);
create index IDX_SIMIEXTENDED_DEPENDENCY_ON_MAP on SIMIEXTENDED_DEPENDENCY (MAP_ID);
-- end SIMIEXTENDED_DEPENDENCY
-- begin SIMIDATA_DATA_THEME
alter table SIMIDATA_DATA_THEME add constraint FK_SIMIDATA_DATA_THEME_ON_POSTGRES_DB foreign key (POSTGRES_DB_ID) references SIMIDATA_POSTGRES_DB(ID);
create unique index IDX_SIMIDATA_MODEL_SCHEMA_UNQ_SCHEMA_NAME_POSTGRES_DB_ID on SIMIDATA_DATA_THEME (SCHEMA_NAME, POSTGRES_DB_ID);
create index IDX_SIMIDATA_DATA_THEME_ON_POSTGRES_DB on SIMIDATA_DATA_THEME (POSTGRES_DB_ID);
-- end SIMIDATA_DATA_THEME
-- begin SIMIPRODUCT_EXTERNAL_MAP_SERVICE
create unique index IDX_SIMIPRODUCT_EXTERNAL_MAP_SERVICE_UK_URL on SIMIPRODUCT_EXTERNAL_MAP_SERVICE (URL) where DELETE_TS is null ;
-- end SIMIPRODUCT_EXTERNAL_MAP_SERVICE
-- begin SIMIPRODUCT_PROPERTIES_IN_LIST
alter table SIMIPRODUCT_PROPERTIES_IN_LIST add constraint FK_SIMIPRODUCT_PROPERTIES_IN_LIST_ON_PRODUCT_LIST foreign key (PRODUCT_LIST_ID) references SIMIPRODUCT_PRODUCT_LIST(ID) on delete CASCADE;
alter table SIMIPRODUCT_PROPERTIES_IN_LIST add constraint FK_SIMIPRODUCT_PROPERTIES_IN_LIST_ON_SINGLE_ACTOR foreign key (SINGLE_ACTOR_ID) references SIMIPRODUCT_SINGLE_ACTOR(ID) on delete CASCADE;
create unique index IDX_SIMI_PROPERTIES_IN_LIST_UNQ_PRODUCT_LIST_ID_SINGLE_ACTOR_ID on SIMIPRODUCT_PROPERTIES_IN_LIST (PRODUCT_LIST_ID, SINGLE_ACTOR_ID);
create index IDX_SIMIPRODUCT_PROPERTIES_IN_LIST_ON_PRODUCT_LIST on SIMIPRODUCT_PROPERTIES_IN_LIST (PRODUCT_LIST_ID);
create index IDX_SIMIPRODUCT_PROPERTIES_IN_LIST_ON_SINGLE_ACTOR on SIMIPRODUCT_PROPERTIES_IN_LIST (SINGLE_ACTOR_ID);
-- end SIMIPRODUCT_PROPERTIES_IN_LIST
-- begin SIMIPRODUCT_PROPERTIES_IN_FACADE
alter table SIMIPRODUCT_PROPERTIES_IN_FACADE add constraint FK_SIMIPRODUCT_PROPERTIES_IN_FACADE_ON_DATA_SET_VIEW foreign key (DATA_SET_VIEW_ID) references SIMIDATA_DATA_SET_VIEW(ID) on delete CASCADE;
alter table SIMIPRODUCT_PROPERTIES_IN_FACADE add constraint FK_SIMIPRODUCT_PROPERTIES_IN_FACADE_ON_FACADE_LAYER foreign key (FACADE_LAYER_ID) references SIMIPRODUCT_FACADE_LAYER(ID) on delete CASCADE;
create unique index IDX_SIMIPRODUCT_PROPERTIES_IN_FACADE_UNQ_DATA_SET_VIEW_ID_FACADE_LAYER_ID on SIMIPRODUCT_PROPERTIES_IN_FACADE (DATA_SET_VIEW_ID, FACADE_LAYER_ID);
create index IDX_SIMIPRODUCT_PROPERTIES_IN_FACADE_ON_DATA_SET_VIEW on SIMIPRODUCT_PROPERTIES_IN_FACADE (DATA_SET_VIEW_ID);
create index IDX_SIMIPRODUCT_PROPERTIES_IN_FACADE_ON_FACADE_LAYER on SIMIPRODUCT_PROPERTIES_IN_FACADE (FACADE_LAYER_ID);
-- end SIMIPRODUCT_PROPERTIES_IN_FACADE
-- begin SIMIIAM_USER
alter table SIMIIAM_USER add constraint FK_SIMIIAM_USER_ON_ID foreign key (ID) references SIMIIAM_IDENTITY(ID) on delete CASCADE;
-- end SIMIIAM_USER
-- begin SIMIIAM_GROUP
alter table SIMIIAM_GROUP add constraint FK_SIMIIAM_GROUP_ON_ID foreign key (ID) references SIMIIAM_IDENTITY(ID) on delete CASCADE;
-- end SIMIIAM_GROUP
-- begin SIMIPRODUCT_SINGLE_ACTOR
alter table SIMIPRODUCT_SINGLE_ACTOR add constraint FK_SIMIPRODUCT_SINGLE_ACTOR_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE;
-- end SIMIPRODUCT_SINGLE_ACTOR
-- begin SIMIPRODUCT_PRODUCT_LIST
alter table SIMIPRODUCT_PRODUCT_LIST add constraint FK_SIMIPRODUCT_PRODUCT_LIST_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE;
-- end SIMIPRODUCT_PRODUCT_LIST
-- begin SIMIPRODUCT_FACADE_LAYER
alter table SIMIPRODUCT_FACADE_LAYER add constraint FK_SIMIPRODUCT_FACADE_LAYER_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE;
-- end SIMIPRODUCT_FACADE_LAYER
-- begin SIMIDATA_DATA_SET_VIEW
alter table SIMIDATA_DATA_SET_VIEW add constraint FK_SIMIDATA_DATA_SET_VIEW_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE;
-- end SIMIDATA_DATA_SET_VIEW
-- begin SIMIPRODUCT_EXTERNAL_MAP_LAYERS
alter table SIMIPRODUCT_EXTERNAL_MAP_LAYERS add constraint FK_SIMIPRODUCT_EXTERNAL_MAP_LAYERS_ON_SERVICE foreign key (SERVICE_ID) references SIMIPRODUCT_EXTERNAL_MAP_SERVICE(ID);
alter table SIMIPRODUCT_EXTERNAL_MAP_LAYERS add constraint FK_SIMIPRODUCT_EXTERNAL_MAP_LAYERS_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE;
create index IDX_SIMIPRODUCT_EXTERNAL_MAP_LAYERS_ON_SERVICE on SIMIPRODUCT_EXTERNAL_MAP_LAYERS (SERVICE_ID);
-- end SIMIPRODUCT_EXTERNAL_MAP_LAYERS
-- begin SIMIPRODUCT_LAYER_GROUP
alter table SIMIPRODUCT_LAYER_GROUP add constraint FK_SIMIPRODUCT_LAYER_GROUP_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE;
-- end SIMIPRODUCT_LAYER_GROUP
-- begin SIMIPRODUCT_MAP
alter table SIMIPRODUCT_MAP add constraint FK_SIMIPRODUCT_MAP_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE;
-- end SIMIPRODUCT_MAP
-- begin SIMIDATA_RASTER_VIEW
alter table SIMIDATA_RASTER_VIEW add constraint FK_SIMIDATA_RASTER_VIEW_ON_RASTER_DS foreign key (RASTER_DS_ID) references SIMIDATA_RASTER_DS(ID);
alter table SIMIDATA_RASTER_VIEW add constraint FK_SIMIDATA_RASTER_VIEW_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE;
create index IDX_SIMIDATA_RASTER_VIEW_ON_RASTER_DS on SIMIDATA_RASTER_VIEW (RASTER_DS_ID);
-- end SIMIDATA_RASTER_VIEW
-- begin SIMIDATA_TABLE_VIEW
alter table SIMIDATA_TABLE_VIEW add constraint FK_SIMIDATA_TABLE_VIEW_ON_POSTGRES_TABLE foreign key (POSTGRES_TABLE_ID) references SIMIDATA_POSTGRES_TABLE(ID);
alter table SIMIDATA_TABLE_VIEW add constraint FK_SIMIDATA_TABLE_VIEW_ON_ID foreign key (ID) references SIMIPRODUCT_DATA_PRODUCT(ID) on delete CASCADE;
create index IDX_SIMIDATA_TABLE_VIEW_ON_POSTGRES_TABLE on SIMIDATA_TABLE_VIEW (POSTGRES_TABLE_ID);
-- end SIMIDATA_TABLE_VIEW
-- begin SIMIIAM_GROUP_USER_LINK
alter table SIMIIAM_GROUP_USER_LINK add constraint FK_SIMGROUSE_ON_GROUP foreign key (GROUP_ID) references SIMIIAM_GROUP(ID);
alter table SIMIIAM_GROUP_USER_LINK add constraint FK_SIMGROUSE_ON_USER foreign key (USER_ID) references SIMIIAM_USER(ID);
-- end SIMIIAM_GROUP_USER_LINK
-- begin SIMIIAM_ROLE_GROUP_LINK
alter table SIMIIAM_ROLE_GROUP_LINK add constraint FK_SIMROLGRO_ON_GROUP foreign key (GROUP_ID) references SIMIIAM_GROUP(ID);
alter table SIMIIAM_ROLE_GROUP_LINK add constraint FK_SIMROLGRO_ON_ROLE foreign key (ROLE_ID) references SIMIIAM_ROLE(ID);
-- end SIMIIAM_ROLE_GROUP_LINK
-- begin SIMIIAM_ROLE_USER_LINK
alter table SIMIIAM_ROLE_USER_LINK add constraint FK_SIMROLUSE_ON_USER foreign key (USER_ID) references SIMIIAM_USER(ID);
alter table SIMIIAM_ROLE_USER_LINK add constraint FK_SIMROLUSE_ON_ROLE foreign key (ROLE_ID) references SIMIIAM_ROLE(ID);
-- end SIMIIAM_ROLE_USER_LINK
-- SIMIPRODUCT_DATA_PRODUCT_PUB_SCOPE

insert into SIMIPRODUCT_DATA_PRODUCT_PUB_SCOPE
    (ID, VERSION, CREATE_TS, CREATED_BY, UPDATE_TS, UPDATED_BY, DISPLAY_TEXT, OVERALL_STATE, DEFAULT_VALUE, FOR_DSV, FOR_GROUP, FOR_MAP, PUB_TO_WMS, PUB_TO_WGC, PUB_TO_LOCATOR, SORT)
values
    ('3db555be-7b10-5fb2-1c5d-61af147b3ee4', 1, NOW(), 'admin', NOW(), null, 'WGC, QGIS u. WMS', 10, true, true, true, false, true, true, true, 1),
    ('c849480f-40f7-5c33-b002-84da80fadc40', 1, NOW(), 'admin', NOW(), null, 'Nur WMS', 10, false, true, true, false, true, false, false, 10),
    ('cb94803d-03d3-dc1f-8f08-3a842f14bf45', 1, NOW(), 'admin', NOW(), null, 'WGC u. QGIS', 10, true, false, false, true, false, true, true, 20),
    ('0a866696-8903-c333-c2c7-db6b6fd8d628', 1, NOW(), 'admin', NOW(), null, 'Nicht (selbst) publiziert', 20, false, true, true, true, false, false, false, 30),
    ('55bdf0dd-d997-c537-f95b-7e641dc515df', 1, NOW(), 'admin', NOW(), null, 'Zu Löschen', 30, false, true, true, true, false, false, false, 40);
    
CREATE OR REPLACE VIEW public.database_ids
 AS
SELECT 
    new_db.db_name AS name,
    new_db.id AS id, 
	old_db.gdi_oid AS gdi_oid
FROM 
    (SELECT id, db_name
	FROM public.simidata_postgres_db) new_db, 
	(SELECT gdi_oid, name
	    FROM gdi_knoten.data_source
     WHERE 
        connection_type = 'database'
	    AND 
	    connection LIKE 'postgresql%') old_db 
WHERE new_db.db_name = old_db.name;

ALTER TABLE public.database_ids
    OWNER TO postgres;
COMMENT ON VIEW public.database_ids
    IS 'Hilfs-View mit den IDs der Datenbanken aus der config_db und Simi';
    
CREATE OR REPLACE VIEW public."old_and_new_groups_and_subs"
 AS
SELECT  
    group_layer.gdi_oid_group_layer,
	ows_layer_gruppe.name AS group_name,
	data_product_layergroup.id AS id_layergroup,
	group_layer.gdi_oid_sub_layer, 
	ows_layer_sub.name AS sub_name,
	data_product_sublayer.id AS id_sublayer,
	group_layer.layer_order AS sort, 
	group_layer.layer_active AS active,
	ows_layer_sub.layer_transparency AS transparency,
	ows_layer_group.facade
FROM  
	gdi_knoten.ows_layer ows_layer_gruppe,
	gdi_knoten.ows_layer ows_layer_sub,
	gdi_knoten.group_layer, 
	gdi_knoten.ows_layer_group ows_layer_group, 
	simiproduct_data_product data_product_layergroup,
	simiproduct_data_product data_product_sublayer
WHERE 
    group_layer.gdi_oid_group_layer = ows_layer_gruppe.gdi_oid
	AND 
	group_layer.gdi_oid_sub_layer = ows_layer_sub.gdi_oid
	AND
	ows_layer_group.gdi_oid = ows_layer_gruppe.gdi_oid
	AND 
	ows_layer_gruppe.name = data_product_layergroup.identifier
	AND 
	ows_layer_sub.name = data_product_sublayer.identifier;

ALTER TABLE public."old_and_new_groups_and_subs"
    OWNER TO postgres;
COMMENT ON VIEW public."old_and_new_groups_and_subs"
    IS 'Alte und neue Layergruppen und sublayer zusammengezogen';
    
CREATE OR REPLACE VIEW public."old_and_new_maps_and_subs"
 AS
select 
    data_product_map.identifier as map_name,
    data_product_map.id as id_layergroup,
    data_product_layer.identifier as layer_name, 
    data_product_layer.id as id_sublayer,
    map_layer.layer_order as sort, 
    map_layer.layer_transparency as transparency, 
    map_layer.layer_active as visible
FROM  
	gdi_knoten."map" old_map,
	gdi_knoten.map_layer map_layer, 
	gdi_knoten.ows_layer ows_layer,
	simiproduct_data_product data_product_map,
	simiproduct_data_product data_product_layer
WHERE 
    old_map.gdi_oid = map_layer.gdi_oid_map 
	AND 
	map_layer.gdi_oid_ows_layer = ows_layer.gdi_oid 
	and 
	(old_map.name||'_map') = data_product_map.identifier
	AND 
	ows_layer.name = data_product_layer.identifier;

ALTER TABLE public."old_and_new_maps_and_subs"
    OWNER TO postgres;
COMMENT ON VIEW public."old_and_new_maps_and_subs"
    IS 'Alte und neue Maps und sublayer zusammengezogen';
   
ALTER TABLE public.simidata_table_field ALTER COLUMN type_name TYPE varchar(1000) USING type_name::varchar;

    
