select tac.id,
       tac.name,
       tac.phone,
       tac.dental_problems,
       tac.intent_projects,
       any_value(tp.id)                         projectId,
       tac.created_date,
       group_concat(tacp.project_id) projectIds
from t_activity_clue tac
         left join t_activity_clue_project tacp on tac.id = tacp.activity_clue_id
         left join t_project tp on tac.intent_projects = tp.name
where tac.del_flag = 0
  and tacp.project_id is null
group by tac.id
order by tac.intent_projects;

insert into t_activity_clue_project(activity_clue_id, project_id, del_flag, created_date, created_by)
select tac.id, any_value(tp.id), 0, tac.created_date, tac.created_by
from t_activity_clue tac
         left join t_activity_clue_project tacp on tac.id = tacp.activity_clue_id
         left join t_project tp on tac.intent_projects = tp.name
where tac.del_flag = 0
  and tacp.project_id is null
group by tac.id
order by tac.intent_projects;