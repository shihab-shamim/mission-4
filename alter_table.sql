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


alter table products
rename to products_items;

alter table products_items
rename to products;

alter table products
add column total_price integer check (total_price > 0);

alter table products
drop column total_price;

alter table products
alter column total_price type numeric(5,2);


alter table products
add constraint total_price check(total_price > 100);
