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


-- inner join
-- ai vabe join korle user ar data niye asbe  posts a referance kore forenkey kore deoya ase 
-- common gola rakhbe bah condition match korche sei golake rakhbe

select distinct title,username from posts join users on posts.user_id=users.id; 

-- akhane post ar id soho asbe
select distinct  title,username,posts.id from posts   join users on posts.user_id=users.id;

-- left join  left a je table thakbe piroty pabe .. post ar moddhe users.id nah thakle null dibe 
select distinct * from posts  left join users on posts.user_id=users.id; 
select distinct * from posts  left outer join users on posts.user_id=users.id; 

-- right join  right a je table thakbe seta piroty pabe .. users ar sob kicho thakbe post nah tahkle faka rakhbe
select distinct * from posts  right join users on posts.user_id=users.id;
select distinct * from posts  right outer join users on posts.user_id=users.id;

-- full join  dile 2 table ar sob kicho dibe kono kicho nah thakle  null diye vore dibe 
select distinct * from posts  full  join users on posts.user_id=users.id;
select distinct * from posts  full outer join users on posts.user_id=users.id;

-- cross join  2 table ke cross kore akta table banabe
select  * from users cross join posts

-- natural join cross join ar kaj kore jokhon dekhe  common column ar data match korle rakhe dei  common column  thakte hbe
select  * from users natural join posts