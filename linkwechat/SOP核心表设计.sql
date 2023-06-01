create table we_sop_base
(
    id                        bigint auto_increment comment '主键' primary key,
    base_type                 tinyint(1) default 1 null comment 'sop基础类型(1:客户sop;2:客群sop)',
    business_type             tinyint(1) default 1 null comment 'sop业务类(1:新客sop;2:活动节日sop;3:客户转化sop;4:新群培育sop;5:周期营销sop;6:特定宣发sop)',
    sop_name                  varchar(40)          null comment 'sop名称',
    sop_state                 tinyint(1) default 1 null comment 'sop状态(1:执行中;2:暂停)',
    send_type                 tinyint(1)           null comment 'sop发送类型(1:企业微信发送;2:手动发送)',
    execute_we_user           json                 null comment '执行成员条件,如果为空,则为全部成员',
    execute_we_user_ids       text                 null comment '符合条件执行成员id,多个id逗号隔开',
    execute_customer_or_group json                 null comment '被执行的客户或群条件,如果为空,则为全部客户或群',
    execute_customer_swipe    json                 null comment '只有生效客户为部分客户的时候该条件有效，其他包括全部客户，全部群，部门群该字段都不适用，主要为了便于人群那块做计算',
    early_end                 tinyint(1) default 0 null comment '是否提前结束:1:提前结束;0:不提前结束',
    end_content               json                 null comment 'sop结束内容',
    create_by                 varchar(255)         null comment '创建人名称',
    create_by_id              bigint               null comment '创建人id',
    create_time               datetime             null comment '创建时间',
    update_by                 varchar(255)         null comment '更新人名称',
    update_by_id              bigint               null comment '更新人id',
    update_time               datetime             null comment '更新时间',
    del_flag                  tinyint    default 0 null comment '删除标识 0 有效 1删除'
) comment 'Sop base表' charset = utf8
                       row_format = DYNAMIC;

create table we_sop_attachments
(
    id               bigint auto_increment comment '主键id' primary key,
    sop_base_id      bigint                                  not null comment 'sop基础id',
    sop_push_time_id bigint                                  null comment '推送时间周期,如果该字段为空，则表示附件素材为sop完成以后需要执行的任务',
    source           tinyint(1) default 1                    null comment '来源 1:手动添加的 2:设置sop结束条件时附加的素材',
    msg_type         varchar(20)                             not null comment '消息类型 文本:text 图片:image 图文:link 小程序:miniprogram 视频:video 文件:file ',
    content          varchar(4000)                           null comment '消息内容',
    media_id         varchar(2000)                           null comment '媒体id',
    title            varchar(100)                            null comment '消息标题',
    description      varchar(512)                            null comment '消息描述',
    file_url         varchar(500)                            null comment '文件路径',
    link_url         varchar(500)                            null comment '消息链接',
    pic_url          varchar(500)                            null comment '消息图片地址',
    app_id           varchar(64)                             null comment '小程序appid',
    create_by        varchar(255) collate utf8mb4_unicode_ci null comment '创建人',
    create_by_id     bigint                                  null comment '创建人id',
    create_time      datetime   default CURRENT_TIMESTAMP    not null comment '创建时间',
    update_by        varchar(255) collate utf8mb4_unicode_ci null comment '更新人',
    update_by_id     bigint                                  null comment '更新人id',
    update_time      datetime                                null comment '修改时间',
    del_flag         tinyint(1) default 0                    not null comment '删除标识 0 有效 1删除'
) comment 'sop素材附件' charset = utf8mb4
                        row_format = DYNAMIC;

create index qr_id_IDX
    on we_sop_attachments (sop_base_id, del_flag);


create table we_sop_execute_target
(
    id                               bigint auto_increment comment '主键' primary key,
    sop_base_id                      bigint               null comment 'sop主键',
    execute_we_user_id               varchar(64)          null comment '执行根据成员id，无论选择部门还是啥最终都落实到具体员工',
    execute_end_time                 datetime             null comment 'sop执行结束时间',
    target_type                      tinyint(1)           null comment '目标类型1:客户 2:群',
    target_id                        varchar(64)          null comment '目标id',
    execute_state                    tinyint(1) default 1 null comment 'sop执行的状态(1:进行中;2:提前结束;3:正常结束;4:异常结束)',
    execute_sub_state                tinyint(1) default 0 null comment '0:当前sop下一条任务信息都未推送(待推送);1:当前sop下信息推送完(已推送)',
    add_customer_or_create_group_time datetime             null comment '执行人添加该客户的时间或创建该群时间',
    create_by                        varchar(255)         null comment '创建人名称',
    create_by_id                     bigint               null comment '创建人id',
    create_time                      datetime             null comment '创建时间',
    update_by                        varchar(255)         null comment '更新人名称',
    update_by_id                     bigint               null comment '更新人id',
    update_time                      datetime             null comment '更新时间',
    del_flag                         tinyint    default 0 null comment '删除标识 0 有效 1删除'
) comment '目标执行对象表' charset = utf8
                           row_format = DYNAMIC;

create table we_sop_execute_target_attachments
(
    id                bigint auto_increment comment '主键' primary key,
    execute_target_id bigint               null comment '目标执行对象主键',
    sop_attachment_id bigint               null comment '执行内容的主键',
    push_time_type    tinyint              null comment '推送时间类型(1:特定时间推送，比如2022-08-21推送日期;2:周期推送，数字字符串型1-7，对应周一到周日;3:相对推送时间,数字字符串型，比如2022-08-21添加的客户，那么相对这个时间第一天推送，则值为1，但是对应的实际推送时间为，2022-08-22) 注:此处只供前端做展示',
    push_time_pre     varchar(255)         null comment '推送时间前缀，分为数字型跟日期格式行字符串 注:前端做展示',
    push_start_time   datetime             null comment '推送具体开始时间',
    push_end_time     datetime             null comment '推送具体结束时间',
    execute_time      datetime             null comment '实际推送时间执行完成时间',
    execute_state     tinyint(1) default 0 null comment '执行状态(0:未执行;1:已执行)',
    send_type         tinyint    default 1 null comment '1:企业微信发送;2:手动发送',
    is_push_on_time   tinyint(1)           null comment '是否准时推送(0:准时推送;1:迟到推送;)',
    is_tip            tinyint(1) default 0 null comment '是否发送:0:未发送;1:已发送全局提醒;2:已发送到期提醒',
    msg_id            varchar(64)          null comment '企业群发消息的id，可用于获取群发消息发送结果,手动发送方式没有',
    create_by         varchar(255)         null comment '创建人名称',
    create_by_id      bigint               null comment '创建人id',
    create_time       datetime             null comment '创建时间',
    update_by         varchar(255)         null comment '更新人名称',
    update_by_id      bigint               null comment '更新人id',
    update_time       datetime             null comment '更新时间',
    del_flag          tinyint    default 0 null comment '删除标识 0 有效 1删除'
) comment '目标执行内容' charset = utf8
                         row_format = DYNAMIC;

create table we_sop_push_time
(
    id              bigint auto_increment comment '主键' primary key,
    push_start_time time                 null comment '推送开时间',
    push_end_time   time                 null comment '推送结束时间',
    sop_base_id     bigint               null comment 'sop主键',
    push_time_type  tinyint              null comment '推送时间类型(1:特定时间推送，比如2022-08-21推送日期;2:周期推送，数字字符串型1-7，对应周一到周日;3:相对推送时间,数字字符串型，比如2022-08-21添加的客户，那么相对这个时间第一天推送，则值为1，但是对应的实际推送时间为，2022-08-22)',
    push_time_pre   varchar(255)         null comment '推送时间前缀，分为数字型跟日期格式行字符串',
    create_by       varchar(255)         null comment '创建人名称',
    create_by_id    bigint               null comment '创建人id',
    create_time     datetime             null comment '创建时间',
    update_by       varchar(255)         null comment '更新人名称',
    update_by_id    bigint               null comment '更新人id',
    update_time     datetime             null comment '更新时间',
    del_flag        tinyint(1) default 0 null comment '删除标识 0 有效 1删除'
) charset = utf8
  row_format = DYNAMIC;