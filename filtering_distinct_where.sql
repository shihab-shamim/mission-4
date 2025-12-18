create table products(
  product_id serial primary key,
  product_code integer unique,
  product_name varchar(50) not null,
  product_description text,
  price numeric(10,2) check (price > 0),
  discount_price real,
  stock integer check (stock > 0),
  is_available boolean default true
)

select distinct is_available from products;


select * from products where is_available=true; 
select * from products where is_available=false; 


select * from products where price<3000 and is_available=true;

select * from products where price>30000 or is_available=false;

select * from products where not is_available;


select * from products where price between 2000 and 10000;
select * from products where price in (2500.00);
select * from products where product_code in (1004,1002);



select * from products
where product_name like 'Laptop%';

select * from products
where product_name ilike 'usb%'
