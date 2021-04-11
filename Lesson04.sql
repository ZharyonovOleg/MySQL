# Тема: CRUD / DML (data manipulation language)
# Команды: INSERT, SELECT, UPDATE, DELETE

# 1
insert ignore into users (id, firstname, lastname, email, phone)
values (1, 'Reuben', 'Nienow', 'arlo50@example.org', '9374071116');

# 2
insert ignore into `users`
set
    `firstname` = 'Kristina',
    `lastname` = 'Jast',
    `email` = 'kfbmklfj@vasya.ru',
    `phone` = '9549848949'
    ;
    

insert ignore into `users`
set
    `firstname` = 'Kristina'
;

## 3 вставка из другого источника
# insert ignore into users (firstname, lastname, email)
#select first_name, last_name, email
#from sakila.staff
#;


INSERT ignore INTO friend_requests (`initiator_user_id`, `target_user_id`, `status`)
VALUES ('1', '2', 'requested');

INSERT ignore INTO friend_requests (`initiator_user_id`, `target_user_id`, `status`)
VALUES ('1', '3', 'requested');

INSERT ignore INTO friend_requests (`initiator_user_id`, `target_user_id`, `status`)
VALUES ('1', '4', 'requested');

INSERT ignore INTO friend_requests (`initiator_user_id`, `target_user_id`, `status`)
VALUES ('1', '5', 'requested');



update friend_requests 
set status = 'approved'
where initiator_user_id = 1 and target_user_id = 2
;

update friend_requests 
set status = 'approved'
where initiator_user_id = 1 and target_user_id = 3
;

update friend_requests 
set status = 'declined'
where initiator_user_id = 1 and target_user_id = 4
;


delete from users
where firstname = 'Kristina' and id = 8
;
