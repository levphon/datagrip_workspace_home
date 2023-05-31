select tc.id                                                             as id,
       any_value(tc.channel)                                             as channel,
       any_value(tc.channel_name)                                        as channelName,
       any_value(tc.pricing_mode)                                        as pricingMode,
       any_value(tc.unit_price)                                          as unitPrice,
       any_value(tc.enable_status)                                       as enableStatus,
       ifnull(tet.stat_date, current_date())                             as statDate,
       count(distinct visit_id)                                          as uvCnt
#        (select count(account)
#         from t_cust_user tcu
#         where tcu.del_flag = 0
#           and tcu.channel = tc.channel
#           and date_format(tcu.created_date, '%Y-%m-%d') = tet.stat_date) as registerCnt
from t_channel tc
         left join t_event_tracking tet on tet.channel = tc.channel and trigger_type = 'entryStr'
where tc.del_flag = 0
  and tet.stat_date between '2022-10-20' and '2022-10-26'
group by tc.id, tet.stat_date
order by statDate desc;