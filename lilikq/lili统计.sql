select *
from t_hospital th;
select *
from t_city tc;
select *
from t_clue;
select *
from t_order;

#客户数
select DATE_FORMAT(tc.created_date, '%Y/%m') statMonth, count(*) cnt
from t_clue tc
where tc.del_flag = 0
group by DATE_FORMAT(tc.created_date, '%Y/%m')
order by DATE_FORMAT(tc.created_date, '%Y/%m');

#预约数
select DATE_FORMAT(to2.appointment_time, '%Y-%m') statMonth, count(*) cnt
from t_order to2
where to2.del_flag = 0
group by DATE_FORMAT(to2.appointment_time, '%Y-%m')
order by DATE_FORMAT(to2.appointment_time, '%Y-%m');

#成交数
select DATE_FORMAT(to2.created_date, '%Y-%m') statMonth, count(*) cnt
from t_order to2
where to2.del_flag = 0
  and to2.status = 8
group by DATE_FORMAT(to2.created_date, '%Y-%m')
order by DATE_FORMAT(to2.created_date, '%Y-%m');


select DATE_FORMAT(collectTime, '%Y-%m') statMonth, count(*) cnt
from (
         select order_id                id,
                any_value(collect_time) collectTime
         from t_order_deal tod
         group by order_id) mt
         left join t_order to2 on to2.id = mt.id
group by DATE_FORMAT(collectTime, '%Y-%m')
order by DATE_FORMAT(collectTime, '%Y-%m');


#机构数
select DATE_FORMAT(th.created_date, '%Y-%m') statMonth, count(*) cnt
from t_hospital th
where th.del_flag = 0
group by DATE_FORMAT(th.created_date, '%Y-%m')
order by DATE_FORMAT(th.created_date, '%Y-%m');

#城市数
select DATE_FORMAT(tc.created_date, '%Y-%m') statMonth, count(*) cnt
from t_city tc
where tc.del_flag = 0
group by DATE_FORMAT(tc.created_date, '%Y-%m')
order by DATE_FORMAT(tc.created_date, '%Y-%m');

#成交情况
select DATE_FORMAT(tod.collect_time, '%Y-%m') statMonth, sum(deal_amount), sum(collect_money)
from t_order_deal tod
where tod.del_flag = 0
group by DATE_FORMAT(tod.collect_time, '%Y-%m');

#按范围统计
select elt(INTERVAL (dealAmount, 0, 1000, 3000, 10000, 40000), '<1000', '1000-3000', '3000-10000', '10000-40000', '>40000') as label,
       count(*)                                                                                                                cnt
from (
         select order_id         id,
                sum(deal_amount) dealAmount
         from t_order_deal tod
         group by order_id) mt
         left join t_order to2 on to2.id = mt.id
where elt(INTERVAL (dealAmount, 0, 1000, 3000, 10000, 40000), '<1000', '1000-3000', '3000-10000', '10000-40000', '>40000') = '10000-40000'
GROUP BY label;

#按周统计
select DATE_FORMAT(created_date, '%Y-%U') weeks,
       SUM(deal_amount)                   dealAmount,
       SUM(collect_money)                 collectMoney
from t_order_deal
where collect_time >= DATE_SUB(now(), INTERVAL 3 MONTH)
group by weeks
order by weeks;

select WEEK(now());
select WEEK('2021-11-13');


select DATE_FORMAT(DATE_SUB(now(), INTERVAL 3 MONTH), '%Y-%U'), DATE_FORMAT(now(), '%Y-%U');

select DATE_FORMAT(now(), '%Y%U %W'), DATE_FORMAT(DATE_SUB(now(), INTERVAL 3 MONTH), '%Y%U %W'), STR_TO_DATE(DATE_FORMAT(now(), '%Y%U %W'), '%X%V %W');


#成交项目统计
select any_value(tp.name) label, count(tod.order_id) cnt
from t_order_deal tod
         left join t_order_deal_project todp on todp.od_id = tod.id
         left join t_project tp on tp.id = todp.project_id
where tod.deal_type in (1, 2, 3, 5)
group by label;

select any_value(tp.name) label, count(tod.order_id) cnt
from t_order_deal tod
         left join t_order_deal_project todp on todp.od_id = tod.id
         left join t_project tp on tp.id = todp.project_id and tp.del_flag = 0
where tod.del_flag = 0
  and tod.deal_type in (1, 2, 3, 5)
group by label


select elt(INTERVAL (tu.age, 0, 18, 30, 50, 65), '18岁以下', '18-30岁', '30-50岁', '50-65岁', '65岁以上') as label,
       count(*)                                                                                     cnt
from t_order to2
         left join t_customer tu on tu.id = to2.customer_id
where to2.del_flag = 0
  and to2.status = 8
# and elt(INTERVAL (dealAmount, 0, 1000, 3000, 10000, 40000), '1千以下', '1千-3千', '3千-1万', '1万-4万', '4万以上') = #{label}
GROUP BY label;


select DATE_FORMAT(to2.created_date, '%Y/%m') label,
       count(*)                               cnt
from t_order to2
         left join t_customer tu on tu.id = to2.customer_id
where to2.del_flag = 0
  and to2.status = 8
GROUP BY label;

#到店率
select DATE_FORMAT(to2.appointment_time, '%Y/%m') label, count(*) cnt
from t_order to2
where to2.del_flag = 0
  and to2.status in (7, 8)
group by label
order by label;


#主诉成交
select DATE_FORMAT(collectTime, '%Y/%m') label, count(*) cnt
from (
         select itod.order_id, any_value(itod.collect_time) collectTime, group_concat(todp.project_id)
         from t_order_deal itod
                  left join t_order_deal_project todp on todp.od_id = itod.id
         where todp.project_id in (select tp.id from t_project tp where tp.del_type = 1)
         group by itod.order_id
     ) tod
         left join t_order to2 on to2.id = tod.order_id
group by label;


select DATE_FORMAT(to2.appointment_time, '%Y/%m') label, count(*) cnt
from t_order to2
         left join(
    select itc.id, group_concat(itcep.project_id)
    from t_clue itc
             left join t_clue_enroll_project itcep on itcep.clue_id = itc.id
    group by itc.id) tc on tc.id = to2.clue_id
where to2.del_flag = 0
#   and DATE_FORMAT(to2.appointment_time, '%Y/%m') = #{statMonth}
  and to2.status in (7, 8)
group by label
order by label;


select DATE_FORMAT(to2.appointment_time, '%Y/%m') label, count(*) cnt
from t_order to2

where to2.del_flag = 0
group by label
order by label;


select itc.id, group_concat(itcep.project_id)
from t_clue itc
         left join t_clue_enroll_project itcep on itcep.clue_id = itc.id
where itcep.project_id in (1)
group by itc.id;



select DATE_FORMAT(to2.appointment_time, '%Y/%m') label, count(*) cnt
from t_order to2
left join t_clue tc on tc.id = to2.clue_id
left join t_clue_enroll_project tcep on tcep.clue_id = tc.id
where to2.del_flag = 0
and tcep.project_id in (7)
and DATE_FORMAT(to2.appointment_time, '%Y/%m') = '2021/11'
group by label
order by label;



select tc.name,
       tc.gender,
       tc.city_name as      city,
       tc.phone,
       to2.city_name        appointmentCity,
       th.name              hospitalName,
       to2.appointment_time appointmentTime,
       mt.*,
       tu.username          principal
from (
         select order_id                id,
                sum(deal_amount)        totalDealAmount,
                sum(collect_money)      totalCollectMoney,
                any_value(collect_time) firstCollectTime
         from t_order_deal tod
         group by order_id) mt
         left join t_order to2 on to2.id = mt.id
         left join t_customer tc on tc.id = to2.customer_id
         left join t_hospital th on th.id = to2.hospital_id
         left join t_user tu on tu.id = to2.created_by;


select DATE_FORMAT(tod.collect_time, '%Y/%m/%d') label,
       SUM(deal_amount)                          dealAmount,
       SUM(collect_money)                        collectMoney
from t_order_deal tod
         left join t_order to2 on to2.id = tod.order_id
where tod.del_flag = 0
  and DATE_FORMAT(tod.collect_time, '%Y/%m/%d') = '2021/11/17'
  and to2.status in (6)
group by label
order by label;

select DATE_FORMAT(tod.collect_time, '%Y/%m') label,deal_amount
from t_order_deal tod
         left join t_order to2 on to2.id = tod.order_id
where tod.del_flag = 0
  and DATE_FORMAT(tod.collect_time, '%Y/%m') = '2021/11'
  and tod.deal_type in (6);


SELECT tc.id,
       tcr.id            customerId,
       tcr.city_name AS  city,
       tcr.name,
       tcr.phone,
       tcr.gender,
       tcr.age,
       tc.collect_info   collectInfo,
       tc.enroll_project enrollProject,
       tc.enroll_fee     enrollFee,
       tc.enroll_time    enrollTime,
       tc.updated_date   updatedDate,
       tc.status,
       tcp.username      principal
FROM t_clue tc
         LEFT JOIN t_customer tcr ON tcr.id = tc.customer_id
         LEFT JOIN (SELECT itcp.clue_id, GROUP_CONCAT(tu.username) username
                    FROM t_clue_principal itcp
                             LEFT JOIN t_user tu ON tu.id = itcp.user_id
                    WHERE itcp.del_flag = 0
                    GROUP BY itcp.clue_id) tcp ON tcp.clue_id = tc.id
WHERE tc.del_flag = 0
  AND tc.status IN (1)
  AND tc.id
ORDER BY tc.created_date DESC, tc.updated_date DESC
