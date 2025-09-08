-----Business Problems Related to dataset
---------Easy to medium

1------Find the number of stores in each country.
Select country,count(store_id) from stores group by country;

2-------Calculate the total number of units sold by each store applying order by.
SELECT s.store_id, SUM(s1.quantity)
FROM stores AS s
JOIN sales AS s1 
ON s.store_id = s1.store_id
GROUP BY s.store_id
order by store_id asc;

3-------Calculate the total number of units sold by each store
select store_id, sum(quantity) from sales group by store_id;

4------Identify how many sales occurred in December 2023.
select sum(quantity) from sales where sale_date between '2023-12-01' and '2023-12-31';

5------Identify how many orders made in December 2023.
select count(sale_id) from sales where TO_CHAR(sale_date,'MM-YYYY') = '12-2023';

6------Determine how many stores have never had a warranty claim filed.
select count(*) from stores
where store_id not in (select distinct store_id 
                   from sales s
				   right join warranty w
				   on s.sale_id = w.sale_id)


7------Calculate the percentage of warranty claims marked as "Warranty Void".
select (select count(claim_id)/
(select count(*) from warranty)::"numeric") 
*100 as Percentage
from warranty 
where repair_status = 'Warranty Void';  

8-----Identify which store had the highest total units sold in the last year.
SELECT store_id,sum(quantity) as quantity
from sales 
where sale_date >= (CURRENT_DATE - INTERVAL '2 year') 
group by store_id
order by 2 desc;

9----Count the number of unique products sold in the last year.
select count(distinct(product_id)) 
from sales
where sale_date >=(current_date - interval '2 year'); 

10-----Find the average price of products in each category.
select category_id,avg(price)
from products
group by category_id;

11----How many warranty claims were filed in 2020?
SELECT claim_id,count(claim_date)
from warranty
where EXTRACT(YEAR FROM claim_date) = 2020
GROUP BY CLAIM_ID;

12----For each store, identify the best-selling day based on highest quantity sold.
select store_id,
TO_CHAR(sale_date,'Day') as day_name,
sum(quantity)
from sales
group by 1,2
order by 1,3 desc;

13----Identify the least selling product in each country for each year based on total units sold.

with least_number AS
(
SELECT
st.country,
p.product_name,
sum(s.quantity) as Total_sales,
rank() OVER (PARTITION by st.country ORDER BY sum(s.quantity)) as rank
from sales as s
JOIN stores as st
ON s.store_id = st.store_id
JOIN products as p
on s.product_id = p.product_id
group by 1,2
order by 1,3
)
select * from least_number WHERE rank = 1;


14----Calculate how many warranty claims were filed within 180 days of a product sale.

select 
w.*,
s.sale_date,
w.claim_date - s.sale_date as difference
from warranty as w
left JOIN sales as s
on s.sale_id = w.sale_id
WHERE 
w.claim_date - s.sale_date <=180

15----Determine how many warranty claims were filed for products launched in the last two years.

select 
s.product_id,
p.launch_date,
extract(year from age(current_date , p.launch_date)) as years
from products as p
JOIN sales AS S
ON p.product_id = s.product_id
JOIN warranty as w
ON s.sale_id = w.sale_id
where p.launch_date >= current_date - interval '3 years'

16---List the months in the last three years where sales exceeded 5,000 units in the USA.

select 
	to_char(sale_date, 'Month') as month_name,
	sum(s.quantity)
from sales as s
join stores as st
on st.store_id = s.store_id
where 
	st.country='USA'
	and
	s.sale_date >= current_date - interval '4 years'
group by 1
having sum(s.quantity)>=5000;

17----Identify the product category with the most warranty claims filed in the last two years.

select 
c.category_name,
count(claim_id) as total_claims
from category as c
join products as p
on c.category_id = p.category_id
join sales as s
on s.product_id = p.product_id
join warranty as w
on s.sale_id = w.sale_id
WHERE w.claim_date >= current_date - interval '3 years'
GROUP by 1


18----Determine the percentage chance of receiving warranty claims after each purchase for each country.

SELECT 
st.country,
sum(s.quantity) as total_units_sold,
count(w.claim_id) as total_claims,
Round(count(w.claim_id)::"numeric"/sum(s.quantity)::"numeric"*100,2) as Total_percentage
from sales as s
JOIN warranty as w
on s.sale_id = w.sale_id
JOIN stores as st
on st.store_id = s.store_id
GROUP by 1;

19---Analyze the year-by-year growth ratio for each store.

WITH current_ratio AS
(
	SELECT
	s.store_id as store_id,
	st.store_name as store_name,
	extract(year from s.sale_date) as year,
	sum(p.price*s.quantity) as total_sales
	from stores as st
	join sales as s
	on s.store_id = st.store_id
	join products as p
	on p.product_id = s.product_id
	group by 1,2,3
	ORDER by total_sales desc
)
SELECT
	store_id,
	store_name,
	year,
	total_sales as current_year_sale,
	lag(total_sales,1) OVER(partition by store_name order by year) as total_sales
FROM 
current_ratio











