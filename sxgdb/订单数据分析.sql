select count(*)
from fi_order;
select count(*)
from fi_cash_order;
select count(*)
from fi_capital_order;

# 平台订单（现金借款时生成记录） fi_cash_order和fi_order同步生成，所以记录数量一致
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

select fco2.Fcredit_loan_id        平台授信编号,
       fco2.Fout_order_id          平台订单外部业务单号,
       fco2.Fpartner_id            平台订单合作方编号,
       fco2.Fpartner_code          平台订单合作方号,
       fco2.Fpartner_name          平台订单合作方名,
       fco2.Fcust_id               平台订单客户编号,
       fco2.Fcust_phone            平台订单客户手机号,
       fco2.Fcust_name             平台订单客户名,
       fco2.Fstatus                平台订单状态,
       fco2.Fstatus_explain        平台订单状态描述,
       fco2.Fstage                 平台订单阶段状态,
       fco2.Fstage_explain         平台订单阶段状态描述,
       fco2.Famount                平台订单申请金额,
       fco2.Fintegral              平台订单使用积分,
       fco2.Fbank_card             平台订单银行卡信息JSON,
       fco2.Fverify_advise         平台订单信审结果,
       fco2.Frepay_type            平台订单还款方式,
       fco2.Fyear_rate             平台订单年利率,
       fco2.Fterm_type             平台订单期数单位,
       fco2.Fterm_type_value       平台订单期数单位值,
       fco2.Fterm                  平台订单期数,
       fco2.Fcontract_id           平台订单合同号,
       fco2.Fcontract_info         平台订单合同信息,
       fco2.Floan_amount           平台订单放款金额,
       fco2.Freceive_amount        平台订单到账金额,
       fco2.Floan_apply_time       平台订单放款申请时间,
       fco2.Floan_date             平台订单放款时间,
       fco2.Floan_pay_id           平台订单放款申请单号,
       fco2.Fchnl_merchant_id      平台订单渠道商户号,
       fco2.Fchnl_rsp_orderid      平台订单通道应答单号,
       fco2.Fchnl_loan_pay_id      平台订单通道放款支付单号,
       fco2.Fchnl_loan_finish_time 平台订单通道放款完成时间,

       fco.Forder_id               资方订单号,
       fco.Fout_order_id           资方外部订单号,
       fco.Famount                 资方订单申请金额,
       fco.Fyear_rate              资方订单年利率,
       fco.Fchnl_loan_pay_id       通道放款支付单号,
       fco.Fchnl_loan_finish_time  通道放款完成时间

from fi_capital_order fco
         left join fi_cash_order fco2 on fco.Fout_order_id = fco2.Forder_id
where fco.Fout_order_id = '211691054673313738ZY';