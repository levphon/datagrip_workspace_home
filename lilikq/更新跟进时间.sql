select clue_id, count(*)
from t_clue_followup tcf
group by clue_id;

select tc2.name 姓名, tc2.phone 手机号码, tc.enroll_time 报名时间, ltcf.fuCnt 跟进次数
from t_clue tc
         left join (select clue_id, count(*) fuCnt
                    from t_clue_followup tcf
                    where del_flag = 0
                    group by clue_id) ltcf on ltcf.clue_id = tc.id
         left join t_customer tc2 on tc2.id = tc.customer_id
where tc.del_flag = 0
  and ltcf.fuCnt is not null;

select tc.id, tc.status, tcf.issue_content, tcf.created_date, tc.first_followup_time
from t_clue tc,
     t_clue_followup tcf
where tc.id = tcf.clue_id
  and tcf.id in (select min(stcf.id) from t_clue_followup stcf group by stcf.clue_id);

select tc.id, tc.status, tcf.issue_content, tcf.created_date, tc.last_followup_time
from t_clue tc,
     t_clue_followup tcf
where tc.id = tcf.clue_id
  and tcf.id in (select max(stcf.id) from t_clue_followup stcf group by stcf.clue_id);


update t_clue tc, t_clue_followup tcf
set tc.first_followup_time = tcf.created_date
where tc.id = tcf.clue_id
  and tcf.id in (select min(stcf.id) from t_clue_followup stcf group by stcf.clue_id);

update t_clue tc, t_clue_followup tcf
set tc.last_followup_time = tcf.created_date
where tc.id = tcf.clue_id
  and tcf.id in (select max(stcf.id) from t_clue_followup stcf group by stcf.clue_id);

select * from t_clue where date_format(mark_time,'%Y-%m-%d %H:%i') = '2022-02-22 13:02';

update t_clue set mark_tag = null,mark_remark = null where date_format(mark_time,'%Y-%m-%d %H:%i') = '2022-02-22 13:02';

delete from t_clue_log where remark like '待预约客户第%';