use vk;

drop table if exists dislikes;
create table dislikes(
    id SERIAL,
    user_id BIGINT unsigned not null,
    media_id BIGINT unsigned not null,
    
    foreign key (user_id) references users(id),
    foreign key (media_id) references media(id)
);


drop table if exists reposts;
create table reposts(
    id SERIAL,
    user_id BIGINT unsigned not null,
    media_id BIGINT unsigned not null,
        
    foreign key (user_id) references users(id),
    foreign key (media_id) references media(id)
);


drop table if exists countries;
create table countries(
    id SERIAL,
    user_id BIGINT unsigned not null,
    name VARCHAR(100),
        
    foreign key (user_id) references users(id)
);
# Может быть в лайках и тому подобных таблицах нужно добавлять столбец "Сообщения"? Либо в таблицу "Сообщения" добавить столбцы лайки и т.п.?