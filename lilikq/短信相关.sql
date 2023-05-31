select * from t_user where account = '17318001392';
select * from t_user where username = '张秀兰';

        select count(to2.id)
        from t_order to2
        where to2.del_flag = 0
          and (to2.rv_cnt is null or to2.rv_cnt = 0)
          and to2.created_by = 1;

select * from t_department where id = 2;

select tml.id,
       to2.clue_id      clueId,
       tcr.city_name as city,
       tcr.id           customerId,
       tcr.name         customerName,
       tcr.phone        customerPhone,
       tcr.gender,
       tml.created_date sendTime,
       tml.content,
       tml.status,
       tu.username      principal
from t_message_log tml
         left join t_order to2 on to2.id = tml.biz_id and tml.biz_type = 7
         left join t_customer tcr on tcr.id = to2.customer_id
         left join t_user tu on tu.id = tml.created_by
where tml.del_flag = 0
order by tml.created_date desc;



select * from t_order to2
left join t_customer tcr on tcr.id = to2.customer_id
where tcr.phone = 18924989025;


select tml.id, tml.to_user, tml.content, to2.id, tcr.id
from t_message_log tml,
     t_order to2,
     t_customer tcr
where tml.to_user = tcr.phone
  and to2.customer_id = tcr.id
  and tml.to_user <> 18924989025;

#短信关联预约订单
update t_message_log tml,t_order to2,t_customer tcr
set tml.biz_type = 7,
    tml.biz_id   = to2.id
where tml.to_user = tcr.phone
  and to2.customer_id = tcr.id
  and tml.biz_id is null;

