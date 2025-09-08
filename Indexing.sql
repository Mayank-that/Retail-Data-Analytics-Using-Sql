create index idx_sale_data on sales(sale_date);

SELECT * 
FROM sales
WHERE sale_date BETWEEN '2020-01-01' AND '2020-01-31';


EXPLAIN analyze
SELECT * 
FROM sales
WHERE sale_date BETWEEN '2025-01-01' AND '2025-01-31';
