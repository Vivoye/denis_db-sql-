
-- Show all details about properties, orders and products.
select * from orders, products, propertyinfo;
select * from orders;
select * from products;
select * from propertyinfo;

-- Select the city and state column in propertyinfo table.
select "PropertyCity", "PropertyState" from propertyinfo;

--find the dates orders were made and the quantity of orders made
select "OrderDate", "Quantity" from orders;

--find the unique dates orders were made
select distinct "OrderDate" from orders; 

-- The different product category Denis has in his store
select * from products;
select distinct "ProductCategory" from products;

--The data from order table and sort it in ascending order of quantity
select * from orders;
select * from orders
order by "Quantity" asc;

--All products and their details and sort in ascending order of price
select * from products;
select * from products
order by "Price";

--All products and their details and sort in descending order of price
select * from products;
select * from products
order by "Price" desc;

-- Find the five most expensive products
select * from products
order by "Price" desc
limit 5;

--The name of the product whose Id is 50
select "ProductName", "ProductID" from products
where "ProductID" = 50;

-- The name and category of product whose id is 94
select * from products;
select "ProductID", "ProductName", "ProductCategory" from products
where "ProductID" = 94;

-- The name and category of product whose prices are above $200
select "ProductName", "ProductCategory", "Price" from products
where "Price" > 200;

--The name of the product whose prices are between $50 and $200
select "ProductName", "Price" from products
where "Price" between 50 and 200;

-- The productid of products sold between 07-01-2015 and 10-01-2015
select "ProductID", "OrderDate" from orders 
where "OrderDate" between '2015-01-07' and '2015-01-10';

select "ProductName", "ProductCategory" from products
where "ProductCategory" = 'Office Supplies';

-- Orders by property 14, 16, and 10
select * from orders;
select * from orders
where "PropertyID" in (14, 16, 10);

--What products have orders starting with "T"
--like
select * from products;
select "ProductName" from products
where "ProductName" like 'T%';

-- Total amount all products will be worth if there were just 2 of it in the store
select "ProductID", "Price", 2* "Price" as "Double_Price" 
from products;

--sum, avg, min, max, count
select sum(2 * "Price")as "Total_Price"
from products;

-- What is the average price of products?
select avg("Price") from products;

select round(avg("Price"), 2) from products;

-- The most expensive product and the least expensive product
select * from products;
select "ProductName", "Price" from products
order by "Price" desc
limit 1;

select "ProductName", "Price" from products
order by "Price" asc
limit 1;

select "ProductName", "Price" from products
where "Price" = (select min("Price") from products);

-- What products have names starting with “T”?