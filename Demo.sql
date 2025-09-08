

EXPLAIN ANALYSE
SELECt *
from sales s
join
stores as st
on s.store_id = st.store_id
join 
products as p
on s.product_id = p.product_id