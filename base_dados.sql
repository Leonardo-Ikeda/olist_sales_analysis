CREATE TABLE customers (
	customer_id VARCHAR(255) PRIMARY KEY,
	customer_unique_id VARCHAR(255),
	customer_zip_code_prefix CHAR(5),
	customer_city VARCHAR(255),
	customer_state CHAR(2)
);

CREATE TABLE geolocation (
	geolocation_zip_code_prefix VARCHAR(255),
	geolocation_lat REAL,
	geolocation_lng REAL,
	geolocation_city VARCHAR(255),
	geolocation_state CHAR(2)	
);

CREATE TABLE order_items (
	order_id VARCHAR(255),
	order_item_id INTEGER,
	product_id VARCHAR(255),
	seller_id VARCHAR(255),
	shipping_limit_date TIMESTAMP,
	price DECIMAL(10,2),
	freight_value DECIMAL(10,2)
);

