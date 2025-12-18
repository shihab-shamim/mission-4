create table table_name(
  column_name datatype constraint
);
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
