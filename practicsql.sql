
ONLINE COURSE ENROLLMENT DATABASE
================================

STEP 1: TABLE CREATION
---------------------

students table
--------------
create table students (
  student_id int primary key,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(100),
  phone varchar(20),
  country varchar(50),
  enrollment_date date
);

courses table
-------------
create table courses (
  course_id int primary key,
  course_title varchar(150),
  category varchar(50),
  price numeric(10,2),
  instructor varchar(100),
  published_year int
);

enrollments table
-----------------
create table enrollments (
  enrollment_id int primary key,
  student_id int references students(student_id),
  course_id int references courses(course_id),
  enrollment_date date,
  progress_percentage int,
  paid_amount numeric(10,2)
);


STEP 2: DATA INSERT
------------------

students data
-------------
insert into students values
(1,'Rahim','Uddin','rahim@email.com','01711111111','Bangladesh','2023-01-10'),
(2,'Karim','Ahmed','karim@email.com',NULL,'Bangladesh','2023-01-15'),
(3,'Sara','Khan','sara@email.com','01822222222','Pakistan','2023-02-01'),
(4,'John','Smith','john@email.com',NULL,'USA','2023-02-10'),
(5,'Emma','Brown','emma@email.com','01933333333','UK','2023-02-20'),
(6,'Ayaan','Ali','ayaan@email.com',NULL,'India','2023-03-05'),
(7,'Lina','Rahman','lina@email.com','01644444444','Bangladesh','2023-03-12'),
(8,'Mark','Taylor','mark@email.com',NULL,'Australia','2023-03-25'),
(9,'Sophia','Lee','sophia@email.com','01555555555','USA','2023-04-01'),
(10,'Daniel','Martinez','daniel@email.com',NULL,'Spain','2023-04-10');

courses data
------------
insert into courses values
(1,'Complete SQL Bootcamp','Database',49.99,'John Carter',2021),
(2,'Advanced JavaScript','Programming',59.99,'Sarah Miller',2020),
(3,'Python for Data Science','Data Science',69.99,'David Kim',2022),
(4,'Web Development with React','Programming',54.99,'Emily Stone',2021),
(5,'Machine Learning Basics','AI',79.99,'Andrew Ng',2019),
(6,'Cloud Computing Fundamentals','Cloud',64.99,'James Allen',2020),
(7,'UI/UX Design Essentials','Design',39.99,'Laura Scott',2022),
(8,'DevOps for Beginners','DevOps',74.99,'Michael Brown',2023);

enrollments data
----------------
insert into enrollments values
(1,1,1,'2023-05-01',80,49.99),
(2,2,2,'2023-05-03',NULL,59.99),
(3,3,3,'2023-05-05',60,69.99),
(4,4,1,'2023-05-07',100,49.99),
(5,5,4,'2023-05-10',40,54.99),
(6,6,5,'2023-05-12',NULL,79.99),
(7,7,2,'2023-06-01',90,59.99),
(8,8,6,'2023-06-02',30,64.99),
(9,9,3,'2023-06-03',70,69.99),
(10,10,7,'2023-06-04',NULL,39.99),
(11,1,8,'2023-06-05',20,74.99),
(12,2,1,'2023-06-06',50,49.99),
(13,3,6,'2023-06-07',NULL,64.99),
(14,4,4,'2023-06-08',85,54.99),
(15,5,5,'2023-06-09',60,79.99);


PRACTICE QUERIES
----------------

1. Display students with phone (NULL -> Not Provided)
select first_name, last_name, coalesce(phone,'Not Provided') from students;

2. Top 5 courses by price
select * from courses order by price desc limit 5;

3. Page 2 (3 per page)
select * from courses limit 3 offset 3;

4. Increase Programming course price by 10%
update courses set price = price * 1.10 where category = 'Programming';

5. Delete enrollments with NULL progress
delete from enrollments where progress_percentage is null;

6. Total paid amount per category
select c.category, sum(e.paid_amount)
from enrollments e
join courses c on e.course_id = c.course_id
group by c.category;

7. Categories with avg price > 60
select category, avg(price)
from courses
group by category
having avg(price) > 60;

8. Student count per course
select c.course_title, count(e.student_id)
from courses c
join enrollments e on c.course_id = e.course_id
group by c.course_title;

9. Foreign key rule
Inserting enrollment with invalid student_id will cause FOREIGN KEY violation.

10. INNER JOIN student, course, paid
select s.first_name || ' ' || s.last_name, c.course_title, e.paid_amount
from enrollments e
join students s on e.student_id = s.student_id
join courses c on e.course_id = c.course_id;

11. LEFT JOIN (all students)
select s.first_name, c.course_title
from students s
left join enrollments e on s.student_id = e.student_id
left join courses c on e.course_id = c.course_id;

12. RIGHT JOIN (all courses)
select c.course_title, s.first_name
from students s
right join enrollments e on s.student_id = e.student_id
right join courses c on e.course_id = c.course_id;

13. FULL JOIN (students + courses)
select s.first_name, c.course_title
from students s
full join enrollments e on s.student_id = e.student_id
full join courses c on e.course_id = c.course_id;

14. Enrollments per year
select extract(year from enrollment_date), count(*)
from enrollments
group by extract(year from enrollment_date);

15. Average progress per course
select c.course_title, avg(e.progress_percentage)
from enrollments e
join courses c on e.course_id = c.course_id
group by c.course_title;
