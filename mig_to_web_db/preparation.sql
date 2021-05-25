SET search_path = simi;

insert into SEC_GROUP (ID, CREATE_TS, VERSION, NAME, PARENT_ID)
values ('0fa2b1a5-1d68-4d69-9fbd-dff348347f93', now(), 0, 'Company', null);

insert into SEC_USER (ID, CREATE_TS, VERSION, LOGIN, LOGIN_LC, PASSWORD, PASSWORD_ENCRYPTION, NAME, GROUP_ID, ACTIVE)
values ('60885987-1b61-4247-94c7-dff348347f93', now(), 0, 'admin', 'admin',
'$2a$10$vQx8b8B7jzZ0rQmtuK4YDOKp7nkmUCFjPx6DMT.voPtetNHFOsaOu', 'bcrypt',
'Administrator', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93', true);

insert into SEC_USER (ID, CREATE_TS, VERSION, LOGIN, LOGIN_LC, PASSWORD, NAME, GROUP_ID, ACTIVE)
values ('a405db59-e674-4f63-8afe-269dda788fe8', now(), 0, 'anonymous', 'anonymous', null,
'Anonymous', '0fa2b1a5-1d68-4d69-9fbd-dff348347f93', true);

insert into SEC_USER_ROLE (ID, CREATE_TS, VERSION, USER_ID, ROLE_NAME)
values ('6736effb-9dfc-4430-973a-69868606b09c', current_timestamp, 0, '60885987-1b61-4247-94c7-dff348347f93', 'system-full-access');

insert into SEC_FILTER (ID, CREATE_TS, CREATED_BY, VERSION, COMPONENT, NAME, XML, USER_ID, GLOBAL_DEFAULT)
values ('b61d18cb-e79a-46f3-b16d-eaf4aebb10dd', now(), 'admin', 0, '[sec$User.browse].genericFilter', 'Search by role',
  '<?xml version="1.0" encoding="UTF-8"?><filter><and><c name="UrMxpkfMGn" class="com.haulmont.cuba.security.entity.Role" type="CUSTOM" locCaption="Role" entityAlias="u" join="join u.userRoles ur">ur.role.id = :component$genericFilter.UrMxpkfMGn32565<param name="component$genericFilter.UrMxpkfMGn32565">NULL</param></c></and></filter>',
  '60885987-1b61-4247-94c7-dff348347f93', false);