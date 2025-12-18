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
select upper(product_name) as product_upper_name, lower(product_name) as product_lower_name from products;

select length(product_name) from products;
