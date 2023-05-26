explain
select tac.id,
       tac.activity_id                  activityId,
       ta.name                          activityName,
       tac.name,
       INSERT(tac.phone, 4, 2, '**') as phone,
       tac.dental_problems              dentalProblems,
       tac.intent_projects              intentProjects,
       tac.city_name                    city,
       tac.gender,
       tac.age,
       tac.wx_account                   wxAccount,
       tcs.name                         channelSource,
       tas.name                         adSource,
       ta.city_name                     activityCity,
       tac.enroll_time                  enrollTime,
       tac.ip
from t_activity_clue tac
         left join t_activity ta on tac.activity_id = ta.id
         left join t_channel_source tcs on tac.channel_source = tcs.id
         left join t_ad_source tas on tac.ad_source = tas.id
where tac.del_flag = 0;

alter table t_activity_clue add index idx_activity_id(activity_id);
alter table t_activity_clue add index idx_channel_source(channel_source);
alter table t_activity_clue add index idx_ad_source(ad_source);