delete from t_clue where customer_id in (select t_customer.id from t_customer where activity_clue_id is not null);

delete from t_customer where activity_clue_id is not null;

update t_activity_clue set assign_status = 0,assign_user_id = null,assign_time = null where assign_user_id is not null;