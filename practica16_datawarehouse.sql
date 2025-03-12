-- Creación de dimensiones.

create table dim_location as select row_number() over () as id, branch, city from ventas group by branch, city;

create table dim_customer as select row_number() over () as id, customer_type, gender from ventas group by customer_type, gender;

create table dim_product as select row_number() over () as id, product_line, unit_price from ventas group by product_line, unit_price;


-- Creación de hechos.

create table fact_sale as select v.id, v.invoice_id, l.id loc_id, c.id cus_id, p.id pro_id, v.quantity, v.tax, v.total, v.dateVenta, v.timeVenta, v.payment
from ventas v, dim_location l, dim_customer c, dim_product p
where v.branch = l.branch and v.city = l.city and v.customer_type = c.customer_type and v.gender = c.gender and v.product_line = p.product_line and v.unit_price = p.unit_price;
