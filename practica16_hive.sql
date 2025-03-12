create database ventas;

use ventas;

drop table if exists ventas;

create external table ventas
(
id int,
invoice_id varchar(15),
branch varchar(2),
city varchar(32),
customer_type varchar(16),
gender varchar(16),
product_line varchar(256),
unit_price float,
quantity int,
tax float,
total float,
dateVenta date,
timeVenta varchar(16),
payment varchar(32)
)
row format delimited
fields terminated by ','
location '/user/hive/warehouse/ventas/ventas';