alter table t_tenant
    add column type tinyint default 0 not null comment '租户类型：0总部，1机构' after tenant_name;

alter table t_hospital
    add column org_id int null comment '机构id' after id;

alter table t_medical_report
    add column hospital_id int null comment '医院id' after age;

alter table t_tenant
    modify type varchar(16) default 'a' not null comment '租户类型：a总部，b口腔机构';

alter table t_department
    modify type varchar(16) default 'a' null comment '组织（部门）类型，同租户类型t_tenant.type';

alter table t_menu
    modify menu_no varchar(32) not null comment '菜单no';

alter table t_menu
    modify parent_id varchar(32) not null comment '父菜单id';

alter table t_role_menu
    modify menu_id varchar(32) not null comment '菜单no';

#更新旧菜单，加上标识
update t_menu set menu_no = concat('a',menu_no),parent_id = concat('a',parent_id);
update t_role_menu set menu_id = concat('a',menu_id);

#医院菜单初始化数据


#初始化医院管理员角色
INSERT INTO t_role (role_name, role_permission_type, max_user, repel_roles, remark, role_visibility, role_tenants, tenant_id, enable_status, del_flag, created_date, created_by)
VALUES ('口腔机构管理员角色', 4, null, null, null, 2, null, 65, 1, 0, '2022-11-11 12:12:55', 1);

insert into t_role_menu(role_id, menu_id, del_flag, created_date)
select 10,menu_no,0,sysdate() from t_menu where menu_no like 'b%';

insert into t_role_tenant(role_id, tenant_id, del_flag, created_date)
select id,1,0,sysdate() from t_role where id not in (1,10);

insert into t_role_tenant(role_id, tenant_id, del_flag, created_date) value (10,65,0,sysdate());