---------Drop Table Command

Drop table if exists warranty;
Drop table if exists sales;
Drop table if exists products;
Drop table if exists category;
Drop table if exists stores;

-----Create Table Category
Create Table category
(
category_id varchar(20) Primary key,
category_name varchar(20)
);

----Create table stores
create table stores
(
store_id varchar(10) primary key,
store_name varchar(30),
city varchar(25),
country varchar(20)
);


---Create table products
create table products
(
product_id varchar(10) primary key,
product_name varchar(35),
category_id varchar(10),
launch_date Date,
price       Float,
constraint fk_category foreign key (category_id) references category(category_id)
);


----Create Table sales
create table sales
(
sale_id varchar(15) primary key,
sale_date date,
store_id varchar(10),------this is foreign key
product_id varchar(10), -----this is also foreign key
quantity int,
constraint st_id foreign key (store_id) references stores(store_id),
constraint p_id foreign key (product_id) references products(product_id)
);

----Create table warranty
create table warranty
(
claim_id varchar(10) primary key,
claim_date date,
sale_id varchar(15),
repair_status varchar(15),
constraint sle_id foreign key (sale_id) references sales(sale_id)
);
