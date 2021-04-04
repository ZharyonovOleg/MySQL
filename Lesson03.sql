drop database if exists vk;
create database vk;
use vk;

drop table if exists users;
create table users(
    id BIGINT unsigned not null auto_increment primary key,
    firstname varchar(100),
    lastname varchar(100) COMMENT 'Фамилия',
    email varchar(255) unique,
    password_hash varchar(255),
    phone BIGINT unsigned unique 
) COMMENT 'Пользователи';


# 1 x 1

drop table if exists profiles;
create table profiles(
    user_id BIGINT unsigned not null primary key,
    gender char(1),
    hometown varchar(100),
    created_at DATETIME default NOW()
) COMMENT 'Профили';


alter table profiles add constraint fk_profiles_user_id
foreign key (user_id) references users(id) # Определение внешнего ключа, то есть user_id ссылается на id в таблице users
on update cascade
on delete restrict;


alter table profiles add column birthday DATETIME; # Добавляем колонку в существующую таблицу
alter table profiles modify column birthday DATE; # Меняем тип данных для существующей колонки в существующей таблице
# alter table profiles rename column birthday to date_of_birth; # Переименование существующей колонки в существующей таблице
# alter table profiles drop column date_of_birth; # Удаление существующей колонки в существующей таблице


# 1 x m

drop table if exists messages;
create table messages(
    id SERIAL,
    from_user_id BIGINT unsigned not null,
    to_user_id BIGINT unsigned not null,
    body TEXT,
    created_at DATETIME default NOW(),
    
    foreign key (from_user_id) references users(id),
    foreign key (to_user_id) references users(id)
);

drop table if exists friend_requests;
create table friend_requests(
    # id SERIAL,
    initiator_user_id BIGINT unsigned not null,
    target_user_id BIGINT unsigned not null,
    # status TINYINT(1),
    # status SET(1),
    status ENUM('requested', 'approved', 'decline', 'unfriend'),
    created_at DATETIME default NOW(),
    updated_at DATETIME on update NOW(),
    
    primary key (initiator_user_id, target_user_id), # Первичный ключ немного подругому
    foreign key (initiator_user_id) references users(id),
    foreign key (target_user_id) references users(id),
    check (initiator_user_id != target_user_id) # Проверка, чтобы не написать самому себе
);

drop table if exists communities;
create table communities(
    id SERIAL,
    name VARCHAR(255),
    admin_user_id BIGINT unsigned not null,
    
    index (name),
    foreign key (admin_user_id) references users(id)
);


# M x M

drop table if exists users_communities;
create table users_communities(
    user_id BIGINT unsigned not null,
    community_id BIGINT unsigned not null,
    
    foreign key (user_id) references users(id),
    foreign key (community_id) references communities(id)
);


drop table if exists media_types;
create table media_types(
    id SERIAL,
    name VARCHAR(255)
);


drop table if exists media;
create table media(
    id SERIAL,
    user_id BIGINT unsigned not null,
    # media_type ENUM('text', 'video', 'audio', 'photo', 'gif'),
    media_id BIGINT unsigned not null,
    body VARCHAR(255),
    # file BLOB,
    filename VARCHAR(255),
    metadata JSON,
    created_at DATETIME default NOW(),
    updated_at DATETIME on update NOW(),
        
    foreign key (user_id) references users(id),
    foreign key (media_id) references media_types(id)
);


drop table if exists likes;
create table likes(
    id SERIAL,
    user_id BIGINT unsigned not null,
    media_id BIGINT unsigned not null,
    
    foreign key (user_id) references users(id),
    foreign key (media_id) references media(id)
);