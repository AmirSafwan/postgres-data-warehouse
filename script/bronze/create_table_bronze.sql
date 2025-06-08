/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
This script creates tables in the 'bronze' schema, dropping existing tables 
if they already exist.
Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/
-- Drop and recreate bronze.crm_customer
DROP TABLE IF EXISTS bronze.crm_customer;

CREATE TABLE bronze.crm_customer (
	customer_id VARCHAR(50),
	customer_unique_id VARCHAR(50),
	customer_zip_code_prefix INTEGER,
	customer_city VARCHAR(50),
	customer_state VARCHAR(50)
);

-- Drop and recreate bronze.crm_order_review
DROP TABLE IF EXISTS bronze.crm_order_review;

CREATE TABLE bronze.crm_order_review (
	review_id VARCHAR(50),
	order_id VARCHAR(50),
	review_score INTEGER,
	review_comment_title VARCHAR(50),
	review_comment_message TEXT,
	review_creation_date DATE,
	review_answer_timestamp TIMESTAMP
);

-- Drop and recreate bronze.crm_product_category_name_translation
DROP TABLE IF EXISTS bronze.crm_product_category_name_translation;

CREATE TABLE bronze.crm_product_category_name_translation (
	product_category_name VARCHAR(50),
	product_category_name_english VARCHAR(50)
);

--=================================================================================================
-- Drop and recreate bronze.erp_seller
DROP TABLE IF EXISTS bronze.erp_seller;

CREATE TABLE bronze.erp_seller (
	seller_id VARCHAR(50),
	seller_zip_code_prefix INTEGER,
	seller_city VARCHAR(50),
	seller_state VARCHAR(50)
);

-- Drop and recreate bronze.erp_product
DROP TABLE IF EXISTS bronze.erp_product;

CREATE TABLE bronze.erp_product (
	product_id VARCHAR(50),
	product_category_name VARCHAR(50),
	product_name_lenght INTEGER,
	product_description_lenght INTEGER,
	product_photos_qty INTEGER,
	product_weight_g INTEGER,
	product_length_cm INTEGER,
	product_height_cm INTEGER,
	product_width_cm INTEGER
);

-- Drop and recreate bronze.erp_order
DROP TABLE IF EXISTS bronze.erp_order;

CREATE TABLE bronze.erp_order (
	order_id VARCHAR(50),
	customer_id VARCHAR(50),
	order_status VARCHAR(50),
	order_purchase_timestamp TIMESTAMP,
	order_approved_at TIMESTAMP,
	order_delivered_carrier_date TIMESTAMP,
	order_delivered_customer_date TIMESTAMP,
	order_estimated_delivery_date TIMESTAMP
);

-- Drop and recreate bronze.erp_order_payment
DROP TABLE IF EXISTS bronze.erp_order_payment;

CREATE TABLE bronze.erp_order_payment (
	order_id VARCHAR(50),
	payment_sequential INTEGER,
	payment_type VARCHAR(50),
	payment_installments INTEGER,
	payment_value FLOAT
);

-- Drop and recreate bronze.erp_order_item
DROP TABLE IF EXISTS bronze.erp_order_item;

CREATE TABLE bronze.erp_order_item (
	order_id VARCHAR(50),
	order_item_id INTEGER,
	product_id VARCHAR(50),
	seller_id VARCHAR(50),
	shipping_limit_date TIMESTAMP,
	price FLOAT,
	freight_value FLOAT	
);

-- Drop and recreate bronze.erp_geolocation
DROP TABLE IF EXISTS bronze.erp_geolocation;

CREATE TABLE bronze.erp_geolocation (
	geolocation_zip_code_prefix INTEGER,
	geolocation_lat FLOAT,
	geolocation_lng FLOAT,
	geolocation_city VARCHAR(50),
	geolocation_state VARCHAR(50)
);
