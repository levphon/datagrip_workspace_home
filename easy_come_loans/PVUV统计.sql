# 产品只有UV，渠道有PV、UV、注册，登陆

#产品总点击量
select product_id, count(*)
from t_product_drainage
group by product_id;

#产品每天点击量
select product_id, date_format(created_date, '%Y-%m-%d') statDate, count(*)
from t_product_drainage
group by statDate, product_id
order by statDate desc;

#产品UV
select product_id, date_format(created_date, '%Y-%m-%d') statDate, count(distinct user_id)
from t_product_drainage
group by statDate, product_id
order by statDate desc;