 create table users(
   id serial primary key,
   username varchar(25) not null
 );

create table posts(
   id serial primary key,
   title text not null,
   user_id int references  users(id)
 );

insert into users (username) values
('shihab'),
('rahim'),
('karim'),
('hasan'),
('tamim'),
('sakib'),
('mamun'),
('rakib'),
('fahim'),
('sohel');

drop table posts;

insert into posts (title, user_id) values
('Learning PostgreSQL Basics', 1),
('Introduction to SQL Queries', 2),
('Understanding Foreign Keys', 3);

-- ai vabe join korle user ar data niye asbe  posts a referance kore forenkey kore deoya ase


select distinct title,username from posts join users on posts.user_id=users.id; 