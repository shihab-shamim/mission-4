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


select max(price) as max_price, min (price) as min_price,avg(price) as avg_price from products;

select sum(price) as total_price from products;

select count(*) from products;
