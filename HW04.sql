# 4
delete from messages
where created_at > NOW()
;

alter table profiles add column is_active BOOL default true;

