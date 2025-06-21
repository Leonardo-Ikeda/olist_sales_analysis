CREATE TABLE customers (
	customer_id VARCHAR(255) PRIMARY KEY,
	customer_unique_id VARCHAR(255),
	customer_zip_code_prefix CHAR(5),
	customer_city VARCHAR(255),
	customer_state CHAR(2)
);

CREATE TABLE order_items (
	order_id VARCHAR(255),
	order_item_id INTEGER,
	product_id VARCHAR(255),
	seller_id VARCHAR(255),
	shipping_limit_date TIMESTAMP,
	price DECIMAL(10,2),
	freight_value DECIMAL(10,2),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
	order_id VARCHAR(255) PRIMARY KEY,
	customer_id VARCHAR(255),
	order_status VARCHAR(100),
	order_purchase_timestamp TIMESTAMP,
	order_approved_at TIMESTAMP,
	order_delivered_carrier_date TIMESTAMP,
	order_delivered_customer_date TIMESTAMP,
	order_estimated_delivery_date TIMESTAMP,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
	product_id VARCHAR(255) PRIMARY KEY,
	product_category VARCHAR(255),
	product_name_lenght INTEGER,
	product_description_lenght INTEGER,
	product_photos_qty INTEGER,
	product_weight_g INTEGER,
	product_length_cm INTEGER,
	product_height_cm INTEGER,
	product_width_cm INTEGER
);
