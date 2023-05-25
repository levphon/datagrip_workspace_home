#待优化
select tu.id                               userId,
       tu.username,
       td.department_name                  department,
       tlj1.appointmentCnt                 todayAppointCnt,
       tlj11.appointmentCnt                todayNewAppointCnt,
       tlj2.appointmentCnt                 monthAppointCnt,
       tlj3.followupCnt                    todayFollowCnt,
       tlj5.followupCnt                    monthFollowCnt,
       tlj3.followPeople                   todayFollowPeople,
       tlj4.followPeople                   monthFollowPeople,
       (tlj5.followupCnt / day(curdate())) averageDailyFollowupPeople
from t_assignment_user tau
         left join t_user tu on tau.user_id = tu.id
         left join t_department td on tu.department_id = td.id
         left join (select to2.created_by, count(*) appointmentCnt
                    from t_order to2
                             left join t_clue tc on tc.id = to2.clue_id
                    where to2.del_flag = 0
                      and DATE_FORMAT(to2.appointment_time, '%Y-%m-%d') = curdate()
                    group by created_by) tlj1 on tlj1.created_by = tu.id
         left join (select to2.created_by, count(*) appointmentCnt
                    from t_order to2
                             left join t_clue tc on tc.id = to2.clue_id
                    where to2.del_flag = 0
                      and DATE_FORMAT(to2.created_date, '%Y-%m-%d') = curdate()
                    group by created_by) tlj11 on tlj11.created_by = tu.id
         left join (select to2.created_by, count(*) appointmentCnt
                    from t_order to2
                             left join t_clue tc on tc.id = to2.clue_id
                    where to2.del_flag = 0
                      and DATE_FORMAT(to2.appointment_time, '%Y-%m') = DATE_FORMAT(curdate(), '%Y-%m')
                    group by created_by) tlj2 on tlj2.created_by = tu.id

         left join (select tcf.created_by, count(*) followupCnt, count(distinct clue_id) followPeople
                    from t_clue_followup tcf
                    where tcf.del_flag = 0
                      and DATE_FORMAT(tcf.created_date, '%Y-%m-%d') = curdate()
                    group by created_by) tlj3 on tlj3.created_by = tu.id

         left join (select tcf.created_by, count(*) followupCnt, count(distinct clue_id) followPeople
                    from t_clue_followup tcf
                    where tcf.del_flag = 0
                      and DATE_FORMAT(tcf.created_date, '%Y-%m') = DATE_FORMAT(curdate(), '%Y-%m')
                    group by created_by) tlj4 on tlj4.created_by = tu.id
         left join (select created_by, sum(followupCnt) as followupCnt
                    from (select tcf.created_by,
                                 date(tcf.created_date),
                                 count(distinct clue_id) followupCnt
                          from t_clue_followup tcf
                                   left join t_user tu on tcf.created_by = tu.id
                          where tcf.del_flag = 0
                            and DATE_FORMAT(tcf.created_date, '%Y-%m') = DATE_FORMAT(curdate(), '%Y-%m')
                          group by created_by, date(tcf.created_date)) otcf
                    group by created_by) tlj5 on tlj5.created_by = tu.id
where tau.del_flag = 0
  and tu.del_flag = 0
order by tu.id;

#优化后
select tu.id                                  userId,
       tu.username,
       td.department_name                     department,
       tlj1.todayAppointCnt,
       tlj1.todayNewAppointCnt,
       tlj1.monthAppointCnt,
       tlj2.todayFollowCnt,
       tlj2.monthFollowCnt,
       tlj3.todayFollowPeople,
       tlj3.monthFollowPeople,
       (tlj2.monthFollowCnt / day(curdate())) averageDailyFollowupPeople
from t_assignment_user tau
         left join t_user tu on tau.user_id = tu.id
         left join t_department td on tu.department_id = td.id

         left join (select to2.created_by,
                           COUNT(DISTINCT CASE WHEN DATE(to2.appointment_time) = CURDATE() THEN to2.id END) AS todayAppointCnt,
                           COUNT(DISTINCT CASE WHEN DATE(to2.created_date) = CURDATE() THEN to2.id END)     AS todayNewAppointCnt,
                           COUNT(DISTINCT CASE
                                              WHEN DATE_FORMAT(to2.appointment_time, '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m')
                                                  THEN to2.id END)                                          AS monthAppointCnt
                    from t_order to2
                    where to2.del_flag = 0
                      and (DATE_FORMAT(to2.appointment_time, '%Y-%m') = DATE_FORMAT(curdate(), '%Y-%m') or date(to2.created_date) = curdate())
                    group by to2.created_by) tlj1 on tlj1.created_by = tu.id

         left join (select created_by,
                           sum(todayFollowCnt) as todayFollowCnt,
                           sum(monthFollowCnt) as monthFollowCnt
                    from (SELECT tcf.created_by,
                                 DATE(tcf.created_date)                                               AS statDate,
                                 COUNT(CASE WHEN DATE(tcf.created_date) = CURDATE() THEN clue_id END) AS todayFollowCnt,
                                 COUNT(DISTINCT clue_id)                                              AS monthFollowCnt
                          FROM t_clue_followup tcf
                          WHERE tcf.del_flag = 0
                            AND tcf.created_date >= DATE_FORMAT(CURDATE(), '%Y-%m-01')
                            AND tcf.created_date < DATE_ADD(DATE_FORMAT(CURDATE(), '%Y-%m-01'), INTERVAL 1 MONTH)
                          GROUP BY tcf.created_by, statDate) otcf
                    group by created_by) tlj2 on tlj2.created_by = tu.id

         left join (select tcf.created_by,
                           COUNT(DISTINCT CASE WHEN DATE(tcf.created_date) = CURDATE() THEN tcf.clue_id END) AS todayFollowPeople,
                           COUNT(DISTINCT tcf.clue_id)                                                          monthFollowPeople
                    from t_clue_followup tcf
                    where tcf.del_flag = 0
                      AND tcf.created_date >= DATE_FORMAT(CURDATE(), '%Y-%m-01')
                      AND tcf.created_date < DATE_ADD(DATE_FORMAT(CURDATE(), '%Y-%m-01'), INTERVAL 1 MONTH)
                    group by created_by) tlj3 on tlj3.created_by = tu.id
where tau.del_flag = 0
  and tu.del_flag = 0
order by tu.id;