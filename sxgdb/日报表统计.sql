# 渠道名	注册日期	注册客户数	下载客户数	申请授信	授信成功	A1	A2	A3	A4	用信成功	放款成功	放款金额
select *
from bz_daily_summary;
select *
from bz_customer;
select *
from bl_credit_loan;
select *
from fi_order;
select *
from fi_cash_order;

# 设置统计日期变量
set @statDate = DATE_SUB(CURDATE(), INTERVAL 1 DAY);

# 注册日期注册客户数
select ds.Fpartner_id,
       ds.Ftype,
       date_format(str_to_date(ds.Fday, '%Y%m%d'), '%Y-%m-%d')     Fday,
       CONVERT(ds.Fval, DECIMAL)                                   Fval,
       ds.Fupdate_time,
       pa.Fcode,
       pa.Fname,
       case when ds.Ftype = 'REGISTER' then '导单' else '未知' end typeName
from bz_daily_summary ds
         left join bz_partner pa on ds.Fpartner_id = pa.Fid
where Ftype = 'REGISTER'
  and date_format(str_to_date(ds.Fday, '%Y%m%d'), '%Y-%m-%d') = @statDate;


# 申请授信（总）
select date(bcl.Fcreate_time) statDate, bcl.Fpartner_id, bcl.Fpartner_name, count(*) applyCreditCnt
from bl_credit_loan bcl
where date(bcl.Fcreate_time) = @statDate
group by statDate, bcl.Fpartner_id
order by statDate desc;

# 消费分期申请授信
select date(bcl.Fcreate_time) statDate, bcl.Fpartner_id, bcl.Fpartner_name, count(*) applyCreditCnt
from bl_credit_loan bcl
where date(bcl.Fcreate_time) = @statDate
  and bcl.Fproduct_type = 'CREDIT_BILL'
group by statDate, bcl.Fpartner_id
order by statDate desc;

# 现金分期（备用金、周转金、零花钱等）申请授信
select date(bcl.Fcreate_time) statDate, bcl.Fpartner_id, bcl.Fpartner_name, count(*) applyCreditCnt
from bl_credit_loan bcl
where date(bcl.Fcreate_time) = @statDate
  and bcl.Fproduct_type = 'CASH_LOAN_SELF'
group by statDate, bcl.Fpartner_id
order by statDate desc;


# 授信成功
select date(bc.Fcreate_time)             statDate,
       bc.Fpartner_id,
       bc.Fpartner_name,
       count(*)                          grantCreditCnt,
       sum(IF(bcl.Fcust_label = 'A1', 1, 0)) A1Cnt,
       sum(IF(bcl.Fcust_label = 'A2', 1, 0)) A2Cnt,
       sum(IF(bcl.Fcust_label = 'A3', 1, 0)) A3Cnt,
       sum(IF(bcl.Fcust_label = 'A4', 1, 0)) A4Cnt
from bz_customer bc
         left join bz_credit_score_cust bcl on bcl.Fcust_id = bc.Fid
where bcl.Fcust_label in ('A1', 'A2', 'A3', 'A4')
  and date(bc.Fcreate_time) = @statDate
group by statDate, bc.Fpartner_id
order by statDate desc;


# 用信成功
select date(fo.Fcreate_time) statDate, fo.Fpartner_id, fo.Fpartner_name, count(*) usedCreditCnt
from fi_order fo
where date(fo.Fcreate_time) = @statDate
group by statDate, fo.Fpartner_id
order by statDate desc;


# 放款成功
select date(fco2.Fchnl_loan_finish_time) statDate,
       fco.Fpartner_id,
       fco.Fpartner_code,
       fco.Fpartner_name,
       count(*)                          loanSuccessCnt,
       sum(fco2.Famount)                 loanAmount
from fi_cash_order fco
         left join fi_capital_order fco2 on fco2.Fout_order_id = fco.Forder_id
where fco2.Fstatus = 'CASH_SUCC'
  and date(fco2.Fchnl_loan_finish_time) = @statDate
group by statDate, fco.Fpartner_id
order by statDate desc;