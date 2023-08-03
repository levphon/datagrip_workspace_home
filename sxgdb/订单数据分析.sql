select count(*)
from fi_order;
select count(*)
from fi_cash_order;
select count(*)
from fi_capital_order;

# 平台订单（现金借款/分期时生成记录） fi_cash_order和fi_order同步生成，所以记录数量一致
select *
from fi_order;
select *
from fi_cash_order;

# CASH-现金分期 CONSUME-消费分期
select count(*)
from fi_cash_order
where Floan_type = 'CASH';
select count(*)
from fi_cash_order
where Floan_type = 'CONSUME';

select *
from fi_cash_order
where Floan_type = 'CASH';
select *
from fi_cash_order
where Floan_type = 'CONSUME';

# 查看转化订单类型
select distinct Floan_type
from fi_cash_order
where Forder_id in (select Fout_order_id from fi_capital_order);

# 查看转化订单
select *
from fi_cash_order
where Forder_id in (select Fout_order_id from fi_capital_order);

# 资方订单（资方贷款受托时生成记录）
select *
from fi_capital_order;
# 资方订单全由平台订单转化
select *
from fi_capital_order
where Fout_order_id in (select fi_cash_order.Forder_id from fi_cash_order);

# 放款成功订单
select *
from fi_capital_order
where Fstatus = 'CASH_SUCC';


# 放款成功订单
select fco.Fcredit_loan_id         平台授信编号,
       fco.Fout_order_id           平台订单外部业务单号,
       fco.Fpartner_id             平台订单合作方编号,
       fco.Fpartner_code           平台订单合作方号,
       fco.Fpartner_name           平台订单合作方名,
       fco.Fcust_id                平台订单客户编号,
       fco.Fcust_phone             平台订单客户手机号,
       fco.Fcust_name              平台订单客户名,
       fco.Fstatus                 平台订单状态,
       fco.Fstatus_explain         平台订单状态描述,
       fco.Famount                 平台订单申请金额,
       fco.Fintegral               平台订单使用积分,
       fco.Fverify_advise          平台订单信审结果,
       fco.Frepay_type             平台订单还款方式,
       fco.Fyear_rate              平台订单年利率,
       fco.Fterm_type              平台订单期数单位,
       fco.Fterm_type_value        平台订单期数单位值,
       fco.Fterm                   平台订单期数,
       fco.Floan_apply_time        平台订单放款申请时间,
       fco2.Forder_id              资方订单号,
       fco2.Fout_order_id          资方外部订单号,
       fco2.Famount                资方订单申请金额,
       fco2.Fyear_rate             资方订单年利率,
       fco2.Fchnl_loan_pay_id      通道放款支付单号,
       fco2.Fchnl_loan_finish_time 通道放款完成时间
from fi_cash_order fco
         left join fi_capital_order fco2 on fco2.Fout_order_id = fco.Forder_id
where fco2.Fstatus = 'CASH_SUCC'
order by fco.Fcreate_time desc;