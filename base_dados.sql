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

CREATE TABLE order_payments (
	order_id VARCHAR(255),
	payment_sequential INTEGER,
	payment_type VARCHAR(255),
	payment_installment INTEGER,
	payment_value DECIMAL(10,2)
)

CREATE TABLE order_reviews (
	review_id VARCHAR(255),
	order_id VARCHAR(255),
	review_score INTEGER,
	review_comment_title TEXT,
	review_comment_message TEXT,
	review_creation_date TIMESTAMP,
	review_answer_timestamp TIMESTAMP
);

CREATE TABLE orders (
	order_id VARCHAR(255),
	customer_id VARCHAR(255),
	order_status VARCHAR(100),
	order_purchase_timestamp TIMESTAMP,
	order_approved_at TIMESTAMP,
	order_delivered_carrier_date TIMESTAMP,
	order_delivered_customer_date TIMESTAMP,
	order_estimated_delivery_date TIMESTAMP
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

CREATE TABLE sellers (
	seller_id VARCHAR(255) PRIMARY KEY,
	seller_zip_code_prefix CHAR(5),
	seller_city VARCHAR(255),
	seller_state CHAR(2)
);
