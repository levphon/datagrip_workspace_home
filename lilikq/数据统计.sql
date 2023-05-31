--         #新增客户
select DATE_FORMAT(tc.enroll_time, '%Y-%m-%d') statDate, count(*) newCustomerCnt
from t_clue tc
where tc.del_flag = 0
  and DATE_FORMAT(tc.enroll_time, '%Y-%m-%d') between '2022-02-01' and '2022-02-13'
group by statDate;

--         #新增预约
select DATE_FORMAT(to2.created_date, '%Y-%m-%d') statDate, count(*) newAppointmentCnt
from t_order to2
         left join t_clue tc on tc.id = to2.clue_id
where to2.del_flag = 0
  and DATE_FORMAT(to2.created_date, '%Y-%m-%d') between '2022-02-01' and '2022-02-13'
group by statDate;

--         #预约
select DATE_FORMAT(to2.appointment_time, '%Y-%m-%d') statDate, count(*) appointmentCnt
from t_order to2
         left join t_clue tc on tc.id = to2.clue_id
where to2.del_flag = 0
  and to2.appointment_time < now()
  and DATE_FORMAT(to2.appointment_time, '%Y-%m-%d') between '2022-02-01' and '2022-02-13'
group by statDate;

--         #新增到店、成交
select DATE_FORMAT(to2.appointment_time, '%Y-%m-%d') statDate,
       sum(IF(to2.status = 7, 1, 0))                 arrivedUndealCnt,
       sum(IF(to2.status = 8, 1, 0))                 arrivedDealCnt
from t_order to2
         left join t_clue tc on tc.id = to2.clue_id
where to2.del_flag = 0
  and tc.del_flag = 0
  and to2.status in (7, 8)
  and DATE_FORMAT(to2.appointment_time, '%Y-%m-%d') between '2022-02-01' and '2022-02-13'
group by statDate;

--         #新增成交金额、收款金额
select DATE_FORMAT(tod.collect_time, '%Y-%m-%d') statDate,
       sum(deal_amount)                          dealAmount,
       sum(collect_money)                        collectMoney
from t_order_deal tod
         left join t_order to2 on to2.id = tod.order_id
         left join t_clue tc on tc.id = to2.clue_id
where tod.del_flag = 0
  and to2.del_flag = 0
  and tc.del_flag = 0
  and DATE_FORMAT(tod.collect_time, '%Y-%m-%d') between '2022-02-01' and '2022-02-13'
group by statDate;

--         #跟进次数
select DATE_FORMAT(tcf.created_date, '%Y-%m-%d') statDate, count(clue_id) followUpCnt
from t_clue_followup tcf
where del_flag = 0
  and DATE_FORMAT(tcf.created_date, '%Y-%m-%d') between '2022-02-01' and '2022-02-13'
group by statDate;

#标记
select DATE_FORMAT(tc.mark_time, '%Y-%m-%d')            statDate,
       sum(case when tc.mark_tag = 3 then 1 else 0 end) invalidCustomerCnt,
       sum(case when tc.mark_tag = 4 then 1 else 0 end) drainCustomerCnt,
       sum(case when tc.mark_tag = 5 then 1 else 0 end) addOpenSeaCustomerCnt
from t_clue tc
where del_flag = 0
  and tc.mark_tag in (3, 4, 5)
  and DATE_FORMAT(tc.mark_time, '%Y-%m-%d') between '2022-02-01' and '2022-02-13'
group by statDate, mark_tag;

select date_add(curdate(),interval -6 month);
select DATE_FORMAT(date_add(curdate(), interval -6 month), '%Y-%m');

select count(*)
from t_clue_log
where created_by = 1
  and DATE_FORMAT(created_date, '%Y-%m-%d') = DATE_FORMAT(date_add(curdate(), interval -0 day), '%Y-%m-%d');


#跟进次数
select tcf.created_by, count(clue_id) followUpCnt
from t_clue_followup tcf
where del_flag = 0
  and DATE_FORMAT(tcf.created_date, '%Y-%m-%d') between '2021-10-01' and '2022-02-13'
group by tcf.created_by;

#标记
select created_by, sum(invalidCustomerCnt), sum(drainCustomerCnt), sum(addOpenSeaCustomerCnt)
from (
         select tc.created_by,
                sum(case when tc.mark_tag = 3 then 1 else 0 end) invalidCustomerCnt,
                sum(case when tc.mark_tag = 4 then 1 else 0 end) drainCustomerCnt,
                sum(case when tc.mark_tag = 5 then 1 else 0 end) addOpenSeaCustomerCnt
         from t_clue tc
         where del_flag = 0
           and tc.mark_tag in (3, 4, 5)
           and DATE_FORMAT(tc.mark_time, '%Y-%m-%d') between '2021-10-01' and '2022-02-14'
         group by tc.created_by, tc.mark_tag
     ) otc
group by created_by;

select * from t_clue where id = 15421;
select * from t_clue_followup where clue_id = 15421;

update t_clue set updated_date = sysdate(),last_followup_time = sysdate() where id = 40;

alter table t_clue
    add column overdue_date datetime null comment '到期时间' after last_followup_time;

update t_clue set overdue_date = null where overdue_date is not null;

select tc.id,tc2.name,overdue_date,enroll_time, DATEDIFF(overdue_date, now())
from t_clue tc
left join t_customer tc2 on tc.customer_id = tc2.id
where overdue_date is not null;