select tu.username, created_name, ip, count(*) cnt
from t_sys_log tsl
         left join t_user tu on tsl.created_name = tu.account
where module = '系统登录'
  and tu.username is null
group by tu.username, created_name, ip
order by cnt desc;

select *
from t_user
where account = 15699183200;

select tu.username, created_name, DATE_FORMAT(tsl.created_date, '%Y-%m-%d') loginDate
from t_sys_log tsl
         left join t_user tu on tsl.created_name = tu.account
where module = '系统登录';


select tu.username, created_name, DATE_FORMAT(tsl.created_date, '%Y-%m-%d') loginDate, count(*) cnt
from t_sys_log tsl
         left join t_user tu on tsl.created_name = tu.account
where module = '系统登录'
  and tsl.created_name = 'admin'
group by tu.username, created_name, loginDate
order by loginDate desc;

select tu.username, created_name, tsl.created_date, ip
from t_sys_log tsl
         left join t_user tu on tsl.created_name = tu.account
where module = '系统登录'
  and tsl.created_name = 'admin'
order by tsl.created_date desc;

select SUBSTRING_INDEX(host, ':', 1) as ip, count(*)
from information_schema.processlist
group by ip;

select *
from information_schema.PROCESSLIST;

show global variables like '%general%';

set global general_log=off;