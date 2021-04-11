# 4
delete from messages
where created_at > NOW()
;

alter table profiles add column is_active BOOL default true;


# 3
update profiles 
set is_active = false
where birthday > '2003-04-11'
;