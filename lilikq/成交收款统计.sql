#总成交=总收款
select tc.name,
       tc.phone,
       to2.id orderId,
       dealType,
       dealCnt,
       totalAmount,
       totalMoney,
       to2.deal_status
from t_order to2
         inner join (select order_id,
                            any_value(deal_type) dealType,
                            count(*)             dealCnt,
                            sum(deal_amount)     totalAmount,
                            sum(collect_money)   totalMoney
                     from t_order_deal
                     where del_flag = 0
                     group by order_id) tod on to2.id = tod.order_id
         left join t_customer tc on to2.customer_id = tc.id
where to2.del_flag = 0
  and tod.totalAmount = tod.totalMoney
#   and tod.dealCnt = 1 and tod.dealType = 3
  and to2.deal_status = 0;
;
#总成交>总收款
select tc.name,
       tc.phone,
       to2.id orderId,
       dealType,
       dealCnt,
       totalAmount,
       totalMoney,
       to2.deal_status
from t_order to2
         inner join (select order_id,
                            any_value(deal_type) dealType,
                            count(*)             dealCnt,
                            sum(deal_amount)     totalAmount,
                            sum(collect_money)   totalMoney
                     from t_order_deal
                     where del_flag = 0
                     group by order_id) tod on to2.id = tod.order_id
         left join t_customer tc on to2.customer_id = tc.id
where to2.del_flag = 0
  and tod.totalAmount > tod.totalMoney;
#总成交<总收款
select tc.name,
       tc.phone,
       to2.id orderId,
       dealType,
       dealCnt,
       totalAmount,
       totalMoney,
       to2.deal_status
from t_order to2
         inner join (select order_id,
                            any_value(deal_type) dealType,
                            count(*)             dealCnt,
                            sum(deal_amount)     totalAmount,
                            sum(collect_money)   totalMoney
                     from t_order_deal
                     where del_flag = 0
                     group by order_id) tod on to2.id = tod.order_id
         left join t_customer tc on to2.customer_id = tc.id
where to2.del_flag = 0
  and tod.totalAmount < tod.totalMoney;

############################################按顺序执行##############################################
#全款
# 1、多条收款，状态不管如何，总成交=总收款，改成全款
update t_order to2,(select order_id,
                           count(*)             dealCnt,
                           any_value(deal_type) dealType,
                           sum(deal_amount)     totalAmount,
                           sum(collect_money)   totalMoney
                    from t_order_deal
                    where del_flag = 0
                    group by order_id) tod
set to2.deal_status = 1
where to2.id = tod.order_id
  and tod.totalAmount = tod.totalMoney
  and tod.dealCnt > 1;

#部分款
# 1、多条收款，状态不管如何，总成交>总收款，改成部分款
# 2、一条收款，状态不为定金的(即全款，部分款)，总成交>总收款，改成部分款
update t_order to2,(select order_id,
                           count(*)             dealCnt,
                           any_value(deal_type) dealType,
                           sum(deal_amount)     totalAmount,
                           sum(collect_money)   totalMoney
                    from t_order_deal
                    where del_flag = 0
                    group by order_id) tod
set to2.deal_status = 2
where to2.id = tod.order_id
  and tod.totalAmount > tod.totalMoney
  and (tod.dealCnt > 1 or (tod.dealCnt = 1 and tod.dealType <> 3));

#定金
# 1、一条收款且状态是定金，改成定金, 总成交=总收款？？？
update t_order to2,(select order_id,
                           count(*)             dealCnt,
                           any_value(deal_type) dealType,
                           sum(deal_amount)     totalAmount,
                           sum(collect_money)   totalMoney
                    from t_order_deal
                    where del_flag = 0
                    group by order_id) tod
set to2.deal_status = 3
where to2.id = tod.order_id
  and tod.totalAmount > tod.totalMoney
  and tod.dealCnt = 1
  and tod.dealType = 3;


#全款
# 2、没有处理的，状态为全款的，总成交=总收款，改成全款
update t_order to2,(select order_id,
                           count(*)             dealCnt,
                           any_value(deal_type) dealType,
                           sum(deal_amount)     totalAmount,
                           sum(collect_money)   totalMoney
                    from t_order_deal
                    where del_flag = 0
                    group by order_id) tod
set to2.deal_status = 1
where to2.id = tod.order_id
  and tod.totalAmount = tod.totalMoney
  and to2.deal_status = 0
  and tod.dealType = 1;

select application  应用,
       module       模块,
       action       动作,
       remark       备注,
       belong_org,
       ip,
       result,
       created_name 操作账号,
       created_date 操作时间
from t_sys_log
where 1 = 1
#   and ip in ('113.118.71.139', '113.118.69.154', '113.118.67.64', '113.118.65.225', '116.24.10.32')
  and created_date > '2022-07-01 00:00:00';

select *
from t_sys_log
where ip = '116.24.10.32';

select *
from t_user
where account = '13534245024';


select tso.id,
       tso.city,
       tso.city_name            cityName,
       tso.hospital_id          hospitalId,
       th.name                  hospitalName,
       tu.username as           principal,
       tso.created_date         outputTime,
       sum(tfs.settle_current)  oughtSettleAmount,
       tso.actual_settle_amount actualSettleAmount,
       tso.collection_time      collectionTime,
       tso.transfer_voucher     transferVoucher,
       tso.invoice_need         invoiceNeed,
       tso.invoice_progress     invoiceProgress,
       tso.status,
       tso.remark
from t_settlement_output tso
         inner join t_settlement_output_details tsod on tsod.output_id = tso.id
         left join t_settlement tfs on tsod.settlement_id = tfs.id
         left join t_hospital th on th.id = tso.hospital_id
         left join t_user tu on tu.id = tso.principal
where tfs.del_flag = 0
  and tso.del_flag = 0
group by tso.id
order by tso.id desc


select tfs.id,
       to2.appointment_time appointmentTime,
       tfs.deal_amount      dealAmount,
       tfs.collect_money    collectMoney,
       tu.username          principal
from t_settlement_output_details tsod
         left join t_settlement tfs on tsod.settlement_id = tfs.id
         left join t_order to2 on tsod.order_id = to2.id
         left join t_user tu on tu.id = to2.created_by
where tsod.del_flag = 0
  and tsod.order_id = 8752
order by tsod.created_date desc;

select tfs.id,
       to2.appointment_time appointmentTime,
       tfs.deal_amount      dealAmount,
       tfs.collect_money    collectMoney,
       tu.username          principal
from t_settlement tfs
         left join t_order to2 on tfs.order_id = to2.id
         left join t_user tu on tu.id = to2.created_by
where tfs.del_flag = 0
  and tfs.order_id = 8752
order by tfs.created_date desc;

alter table t_activity_clue
    add column assign_user_id int null comment '分配人id' after assign_time;

alter table t_activity_clue
    add column has_main_projects tinyint default 0 comment '是否主诉线索:0否，1是' after intent_projects;

select tau.id,
       td.department_name                   as  departmentName,
       tu.username                         as username,
       tu.account                          as account,
       any_value(ltac.totalClueCnt)        as totalClueCnt,
       any_value(ltac.mainProjectClueCnt)  as mainProjectClueCnt,
       any_value(ltac.otherProjectClueCnt) as otherProjectClueCnt
from t_assignment_user tau
         left join t_user tu on tau.user_id = tu.id
         left join t_department td on tu.department_id = td.id
         left join (select assign_user_id,
                           count(*)                                   totalClueCnt,
                           count(if(has_main_projects = 1, id, null)) mainProjectClueCnt,
                           count(if(has_main_projects = 0, id, null)) otherProjectClueCnt
                    from t_activity_clue
                    where del_flag = 0
                    group by assign_user_id) ltac on tau.id = ltac.assign_user_id
where tau.del_flag = 0
group by tau.id
order by tau.id desc;