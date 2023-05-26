explain
select tc.id,
       tcr.id                                                                                    customerId,
       tcr.city_name                 as                                                          city,
       tcr.name,
       INSERT(tcr.phone, 4, 2, '**') as                                                          phone,
       tcr.gender,
       tcr.age,
       tcr.tag                       as                                                          tags,
       tc.mark_tag                                                                               markTag,
       tc.mark_time                                                                              markTime,
       tc.mark_remark                                                                            markRemark,
       tc.collect_info                                                                           collectInfo,
       tc.enroll_project                                                                         enrollProject,
       tc.enroll_fee                                                                             enrollFee,
       tc.enroll_time                                                                            enrollTime,
       tc.updated_date                                                                           updatedDate,
       tc.last_followup_time                                                                     lastFollowupTime,
       tc.overdue_date                                                                           overdueDate,
       DATEDIFF(tc.overdue_date, now())                                                          overdueDays,
       if(isnull(tc.overdue_date), 1, 0)                                                         nullsFirst,
       tc.status,
       tcp.username                                                                              principal,
       (select count(*) from t_clue_followup tcf where tcf.del_flag = 0 and tcf.clue_id = tc.id) followUpCnt
from t_clue tc
         left join t_customer tcr on tcr.id = tc.customer_id
         left join (select itcp.clue_id, group_concat(tu.username) username
                    from t_clue_principal itcp
                             left join t_user tu on tu.id = itcp.user_id
                    where itcp.del_flag = 0
                    group by itcp.clue_id) tcp on tcp.clue_id = tc.id
where tc.del_flag = 0;

#优化后
select tc.id,
       tcr.id                            customerId,
       tcr.city_name                 as  city,
       tcr.name,
       INSERT(tcr.phone, 4, 2, '**') as  phone,
       tcr.gender,
       tcr.age,
       tcr.tag                       as  tags,
       tc.mark_tag                       markTag,
       tc.mark_time                      markTime,
       tc.mark_remark                    markRemark,
       tc.collect_info                   collectInfo,
       tc.enroll_project                 enrollProject,
       tc.enroll_fee                     enrollFee,
       tc.enroll_time                    enrollTime,
       tc.updated_date                   updatedDate,
       tc.last_followup_time             lastFollowupTime,
       tc.overdue_date                   overdueDate,
       DATEDIFF(tc.overdue_date, now())  overdueDays,
       if(isnull(tc.overdue_date), 1, 0) nullsFirst,
       tc.status,
       group_concat(tu.username)     as  principal,
       count(tcf.id)                     followUpCnt
from t_clue tc
         left join t_customer tcr on tcr.id = tc.customer_id
         left join t_clue_followup tcf on tc.id = tcf.clue_id and tcf.del_flag = 0
         left join t_clue_principal tcp on tc.id = tcp.clue_id and tcp.del_flag = 0
         left join t_user tu on tu.id = tcp.user_id
where tc.del_flag = 0
group by tc.id;

select * from t_clue_principal where clue_id in (8,14);
select * from t_clue_followup where clue_id in (8,14);