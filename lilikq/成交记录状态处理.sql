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

#总成交<总收款   待处理
select tc.name     姓名,
       tc.phone    号码,
       dealCnt     收款次数,
       totalAmount 成交金额,
       totalMoney  收款金额
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
  and deal_status = 0
  and to2.status = 8
  and tod.totalAmount < tod.totalMoney;