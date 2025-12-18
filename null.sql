-- null value gola  ase sei gola dekhabe 
select  * from person where age is  null

-- null value nai  sei gola dekhabe 

select  * from person where age is not null

--  email jodi  null thake tahole email ar jaigai  "not provided "asbe
SELECT username, COALESCE(email, 'not rovided') AS email
FROM person;