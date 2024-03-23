-- Extract the following information from Denis_DB:

-- Find the different properties that have made orders.
select * from orders;
select * from propertyinfo;
select distinct "PropertyID" from orders;

-- Find the five least expensive products 
select * from products;
select "ProductID" "ProductName", "Price" from products
order by "Price" asc
limit 5;

-- All properties in alphabetical order of their city names.
select * from propertyinfo;
select * from propertyinfo
order by "PropertyCity";

-- The name and category of the most expensive product
select * from products;
select "ProductName", "ProductCategory", "Price" from products
order by "Price" desc
limit 1;

-- The name and category of product whose price is $300
select * from products;
select "ProductName", "ProductCategory", "Price" from products
where "Price" = 300;

-- Orders by properties that are not 14, 16, and 10
select * from orders;
select * from orders
where "PropertyID" Not In (14,16,10);

-- Total amount all products will be worth if there were just 5 of it in the store
select * from products;
select "ProductName", "Price", 5*("Price") as "Times_Five" from products;
select sum (5*("Price")) as Total_Amount from products;

-- What is the most purchased product?
select * from orders;
select "ProductID", Sum("Quantity")as "Number_Purchased" from orders
group by "ProductID"
Order by "Number_Purchased" desc;

select orders."ProductID", "ProductName", sum("Quantity") as "Number_Purchased"
from orders 
join products
on orders."ProductID" = products."ProductID"
group by orders."ProductID", "ProductName"
order by "Number_Purchased" desc
limit 1;

-- What is the least purchased product?
select * from orders;
select "ProductID", sum("Quantity")as "Number_Purchased" from orders
group by "ProductID"
order by "Number_Purchased";

-- What is the average price of products for each product category?
select "ProductCategory", round(avg("Price"), 2) as "Average_Price"
from products
group by "ProductCategory";

-- How many products are soaps?
select * from products;
select count("ProductID") as "Number_of_Soaps"
from products
where "ProductName" like '%Soap%';

select count("ProductID") as number_of_soaps
from products
where "ProductName" like '%Soap%';

-- What is the average price of envelopes?
select round(avg("Price"), 2) as "Average_price_envelopes"
from products
where "ProductName" like '%Envelope%';

-- What is the cheapest envelope?
select min("Price") from products
where "ProductName" like '%Envelope%';

select "ProductName", "Price"
from products
where "ProductName" like '%Envelope%'
order by "Price" asc
limit 1;

-- We want to find the the average price of housekeeping products.
select * from products;
select round(avg("Price"), 2) from products
where "ProductCategory" = 'Housekeeping';

select round(avg("Price"), 2)
from products
where "ProductCategory" = 'Housekeeping';
