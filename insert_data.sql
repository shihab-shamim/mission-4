insert into products
(product_code, product_name, product_description, price, discount_price, stock, is_available)
VALUES
(1001, 'Laptop Pro', 'High-end performance laptop', 95000.00, 90000.00, 8, true),
(1002, 'Gaming Mouse', 'RGB gaming mouse', 2500.00, 2200.00, 40, true),
(1003, 'Office Chair', 'Ergonomic office chair', 12000.00, 10000.00, 15, true),
(1004, 'USB Hub', '4 port USB hub', 1200.00, NULL, 60, true),
(1005, 'Mechanical Keyboard', 'Blue switch keyboard', 5500.00, 5000.00, 25, true);


select * from products;
select product_code, product_name, price, stock from products;
