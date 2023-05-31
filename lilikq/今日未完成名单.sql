#待联系
select tu.id userId, tu.username, count(tc.id) cnt
from t_clue tc
         left join t_clue_principal tcp on tc.id = tcp.clue_id
         left join t_user tu on tcp.user_id = tu.id
         left join (select clue_id, count(id) fu_cnt
                    from t_clue_followup
                    where del_flag = 0
                    group by clue_id) tcf on tcf.clue_id = tc.id
where tc.del_flag = 0
  and tcp.del_flag = 0
  and tc.status in (1)
  and tc.mark_tag not in (2, 3, 4, 5)
  and tcf.fu_cnt is null
group by tu.id;

#待更新
select to2.created_by userId, tu.username, count(to2.id) cnt, date(date_add(curdate(), interval -1 day)) aaa
from t_order to2
         left join t_user tu on to2.created_by = tu.id
where to2.del_flag = 0
  and to2.status in (5)
  and date(to2.appointment_time) < date(date_add(curdate(), interval 0 day))
group by to2.created_by;

#待回访
select to2.created_by userId, tu.username, count(to2.id) cnt, date(date_add(curdate(), interval 0 day)) aaa
from t_order to2
         left join t_user tu on to2.created_by = tu.id
where to2.del_flag = 0
  and (to2.rv_cnt is null or to2.rv_cnt = 0)
  and date(to2.appointment_time) < date(date_add(curdate(), interval 0 day))
group by to2.created_by;

#待提醒
select to2.created_by userId, tu.username, count(to2.id) cnt, date(date_add(curdate(), interval 1 day)) aaa
from t_order to2
         left join t_user tu on to2.created_by = tu.id
where to2.del_flag = 0
  and to2.status in (4, 5)
  and date(to2.appointment_time) < date(date_add(curdate(), interval 1 day))
  and to2.remind_status not in (1)
group by to2.created_by;

#待办理
select tut.created_by userId, tu.username, count(*) cnt, date(date_add(curdate(), interval 0 day)) aaa
from t_user_todo tut
         left join t_user tu on tut.created_by = tu.id
where tut.del_flag = 0
  and tut.status = 0
  and date(tut.notify_time) < date(date_add(curdate(), interval 0 day))
group by tut.created_by;

#待跟进
select tca.created_by userId, tu.username, count(clue_id) cnt, date(date_add(curdate(), interval 0 day)) aaa
from t_customer_assign tca
         left join t_user tu on tca.created_by = tu.id
where tca.del_flag = 0
  and tca.followup_time is null
  and date(tca.created_date) < date(date_add(curdate(), interval 0 day))
group by tca.created_by;