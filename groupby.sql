--   username diye group korb oi  group ar avg age dibe 
select username , avg(age) from person group by username;
-- username a koto jono ase akta dibe
select username, count(*)  from person group by username

-- having diye jei course a  4 jon ar beshi ase sei gola dekhabe
select course,count(*) from person group by course  having count(*)>4

-- je county avg ge 21 ar beshi sei ta dibe 
select country,avg(age) person group by country  having avg(age) >21
