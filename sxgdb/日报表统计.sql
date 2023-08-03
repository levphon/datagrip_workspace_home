select *
from bz_daily_summary;

select distinct Ftype
from bz_daily_summary;

select *
from bz_customer;

select *
from bl_credit_loan;


# 渠道名	注册日期	注册客户数	下载客户数	申请授信	授信成功	A1	A2	A3	A4	用信成功	放款成功	放款金额

# 渠道名	注册日期	注册客户数
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
    where Ftype = 'REGISTER';


# Fcreate_time 申请授信
select bcl.Fpartner_id, bcl.Fpartner_name, date(bcl.Fcreate_time) statDate, count(*) applyCreditCnt
from bl_credit_loan bcl
where date(bcl.Fcreate_time) = current_date()
group by bcl.Fpartner_id, statDate;


# Fverify_time 授信成功
select bcl.Fpartner_id,
       bcl.Fpartner_name,
       date(bcl.Fverify_time)            statDate,
       count(*)                          grantCreditCnt,
       sum(IF(Frisk_level = 'A1', 1, 0)) A1Cnt,
       sum(IF(Frisk_level = 'A2', 1, 0)) A2Cnt,
       sum(IF(Frisk_level = 'A3', 1, 0)) A3Cnt,
       sum(IF(Frisk_level = 'A4', 1, 0)) A4Cnt
from bl_credit_loan bcl
where bcl.Frisk_level in ('A1', 'A2', 'A3', 'A4')
group by bcl.Fpartner_id, statDate;


# Floan_verify_time 用信成功
select bcl.Fpartner_id, bcl.Fpartner_name, date(bcl.Floan_verify_time) statDate, count(*) usedCreditCnt
from bl_credit_loan bcl
group by bcl.Fpartner_id, statDate;


# Floan_time 放款成功
select bcl.Fpartner_id, bcl.Fpartner_name, date(bcl.Floan_time) statDate, count(*) loanSuccessCnt
from bl_credit_loan bcl
group by bcl.Fpartner_id, statDate;