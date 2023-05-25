#待联系
select tcp.user_id, count(tc.id) cnt
from t_clue tc
         left join t_clue_principal tcp on tc.id = tcp.clue_id
         left join (select clue_id, count(id) fu_cnt
                    from t_clue_followup
                    where del_flag = 0
                    group by clue_id) tcf on tcf.clue_id = tc.id
where tc.del_flag = 0
  and tcp.del_flag = 0
  and tc.status in (1)
  and tc.mark_tag not in (2, 3, 4, 5)
  and tcf.fu_cnt is null
group by tcp.user_id;

#待联系-优化后
select tcp.user_id, tu.username, count(lcluefollowup.id) cnt
from (select tc.id, count(tcf.id) fu_cnt
      from t_clue tc
               left join t_clue_followup tcf on tcf.clue_id = tc.id and tcf.del_flag = 0
      where tc.del_flag = 0
        and tc.status in (1)
        and tc.mark_tag not in (2, 3, 4, 5)
      group by tc.id) lcluefollowup
         left join t_clue_principal tcp on lcluefollowup.id = tcp.clue_id
         left join t_user tu on tcp.user_id = tu.id
where tcp.del_flag = 0
  and lcluefollowup.fu_cnt = 0
group by tcp.user_id;

#待联系-红点-优化后
select count(lcluefollowup.id)
from (select tc.id, count(tcf.id) fu_cnt
      from t_clue tc
               left join t_clue_followup tcf on tcf.clue_id = tc.id and tcf.del_flag = 0
      where tc.del_flag = 0
        and tc.status in (1)
        and tc.mark_tag not in (2, 3, 4, 5)
      group by tc.id) lcluefollowup
         left join t_clue_principal tcp on lcluefollowup.id = tcp.clue_id
         left join t_user tu on tcp.user_id = tu.id
where tcp.del_flag = 0
  and lcluefollowup.fu_cnt = 0;

#待回访-优化后
explain
select to2.created_by userId, tu.username, count(to2.id) cnt
from t_order to2
         left join t_user tu on to2.created_by = tu.id
where to2.del_flag = 0
  and (to2.rv_cnt is null or to2.rv_cnt = 0)
#   and date(to2.appointment_time) < date(date_add(curdate(), interval 0 day))
  and date(to2.appointment_time) < curdate()
group by to2.created_by;

#待提醒-优化后
select to2.created_by userId, tu.username, count(to2.id) cnt
from t_order to2
         left join t_user tu on to2.created_by = tu.id
where to2.del_flag = 0
  and to2.status in (4, 5)
#   and DATE_FORMAT(to2.appointment_time, '%Y-%m-%d') &lt;= DATE_FORMAT(date_add(curdate(), interval 1 day), '%Y-%m-%d')
  and date(to2.appointment_time) < date_add(curdate(), interval 1 day)
  and to2.remind_status not in (1)
group by to2.created_by;