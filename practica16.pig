ventas = LOAD '/user/hadoop/ventas/part-m-00000' USING PigStorage(',')
AS (id,
	invoice_id,
	branch,
	city,
	customer_type,
	gender,
	product_line,
	unit_price,
	quantity,
	tax,
	total,
	dateVenta,
	timeVenta,
	payment,
	cogs,
	gross_margin,
	gross_income,
	rating);

ventas1 = FOREACH ventas GENERATE id,
	invoice_id,
	branch,
	city,
	customer_type,
	gender,
	product_line,
	unit_price,
	quantity,
	tax,
	total,
	dateVenta,
	timeVenta,
	payment;
	
STORE ventas1 INTO '/user/hive/warehouse/ventas/ventas' using PigStorage(',');
