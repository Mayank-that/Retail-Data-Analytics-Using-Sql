-- Index on sale_date for faster date range queries
CREATE INDEX idx_sales_date ON sales(sale_date);

-- Index on store_id in sales (helpful for joins and group by)
CREATE INDEX idx_sales_store ON sales(store_id);

-- Index on product_id in sales (joins with products)
CREATE INDEX idx_sales_product ON sales(product_id);

-- Index on claim_date for warranty checks by time
CREATE INDEX idx_warranty_date ON warranty(claim_date);

-- Index on repair_status for quick filtering
CREATE INDEX idx_warranty_status ON warranty(repair_status);

-- Index on category_id for product-category joins
CREATE INDEX idx_products_category ON products(category_id);





explain ANALYSE
