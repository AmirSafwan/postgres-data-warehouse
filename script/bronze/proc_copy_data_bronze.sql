/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
This stored procedure loads data into the 'bronze' schema from external CSV files. 
It performs the following actions:
- Truncates the bronze tables before loading data.
- Uses the `COPY` command to load data from csv Files to bronze tables.

Parameters:
None. 
This stored procedure does not accept any parameters or return any values.

Usage Example:
CALL bronze.load_bronze;
===============================================================================
*/
CREATE OR REPLACE PROCEDURE bronze.load_bronze () LANGUAGE plpgsql AS $$
DECLARE 
	
	start_time TIMESTAMP := clock_timestamp();
    end_time TIMESTAMP;
    duration_seconds NUMERIC;
    batch_start_time TIMESTAMP := clock_timestamp();
    batch_end_time TIMESTAMP;
    total_duration NUMERIC;
	current_step     TEXT;

BEGIN
	BEGIN
		-- CRM
		RAISE NOTICE '============================================';
		RAISE NOTICE 'Start Loading Bronze Tables';
		RAISE NOTICE '============================================';
		RAISE NOTICE ' ';
		RAISE NOTICE '--------------------------------------------';
		RAISE NOTICE 'Loading CRM Tables';
		RAISE NOTICE '--------------------------------------------';
	
		start_time := clock_timestamp();
		current_step := 'Truncating Table: bronze.crm_customer';
		RAISE NOTICE 'Truncating Table: bronze.crm_customer';
		TRUNCATE TABLE bronze.crm_customer;
		RAISE NOTICE 'Copying Data: bronze.crm_customer';
		COPY bronze.crm_customer
		FROM
			'C:/Users/janam/Desktop/postgres-data-warehouse/dataset/crm/customers.csv'
		WITH
			(FORMAT CSV, HEADER TRUE, DELIMITER ',');
		end_time := clock_timestamp();
		duration_seconds := EXTRACT(EPOCH FROM end_time - start_time);
		RAISE NOTICE 'bronze.crm_customer loaded: % rows', (SELECT COUNT(*) FROM bronze.crm_customer);
	    RAISE NOTICE 'Loaded bronze.crm_customer in % seconds', duration_seconds;
	
		start_time := clock_timestamp();
		current_step := 'Truncating Table: bronze.crm_order_review';
		RAISE NOTICE ' ';
		RAISE NOTICE 'Truncating Table: bronze.crm_order_review';
		TRUNCATE TABLE bronze.crm_order_review;
		RAISE NOTICE 'Copying Data: bronze.crm_order_review';
		COPY bronze.crm_order_review
		FROM
			'C:/Users/janam/Desktop/postgres-data-warehouse/dataset/crm/order_reviews.csv'
		WITH
			(FORMAT CSV, HEADER TRUE, DELIMITER ',');
		end_time := clock_timestamp();
		duration_seconds := EXTRACT(EPOCH FROM end_time - start_time);
		RAISE NOTICE 'bronze.crm_order_review loaded: % rows', (SELECT COUNT(*) FROM bronze.crm_order_review);
	    RAISE NOTICE 'Loaded bronze.crm_order_reviewt in % seconds', duration_seconds;
	
		start_time := clock_timestamp();
		current_step := 'Truncating Table: bronze.crm_product_category_name_translation';
		RAISE NOTICE ' ';
		RAISE NOTICE 'Truncating Table: bronze.crm_product_category_name_translation';
		TRUNCATE TABLE bronze.crm_product_category_name_translation;
		RAISE NOTICE 'Copying Data: bronze.crm_product_category_name_translation';
		COPY bronze.crm_product_category_name_translation
		FROM
			'C:/Users/janam/Desktop/postgres-data-warehouse/dataset/crm/product_category_name_translation.csv'
		WITH
			(FORMAT CSV, HEADER TRUE, DELIMITER ',');
		end_time := clock_timestamp();
		duration_seconds := EXTRACT(EPOCH FROM end_time - start_time);
		RAISE NOTICE 'bronze.crm_product_category_name_translation loaded: % rows', (SELECT COUNT(*) FROM bronze.crm_product_category_name_translation);
	    RAISE NOTICE 'Loaded bronze.crm_product_category_name_translation in % seconds', duration_seconds;
	
		--==========================================================================================
		-- ERP
		RAISE NOTICE ' ';
		RAISE NOTICE '--------------------------------------------';
		RAISE NOTICE 'Loading ERP Tables';
		RAISE NOTICE '--------------------------------------------';
		
		start_time := clock_timestamp();
		current_step := 'Truncating Table: bronze.erp_seller';
		RAISE NOTICE 'Truncating Table: bronze.erp_seller';
		TRUNCATE TABLE bronze.erp_seller;
		RAISE NOTICE 'Copying Data: bronze.erp_seller';
		COPY bronze.erp_seller
		FROM
			'C:/Users/janam/Desktop/postgres-data-warehouse/dataset/erp/sellers.csv'
		WITH
			(FORMAT CSV, HEADER TRUE, DELIMITER ',');
		end_time := clock_timestamp();
		duration_seconds := EXTRACT(EPOCH FROM end_time - start_time);
		RAISE NOTICE 'bronze.erp_seller loaded: % rows', (SELECT COUNT(*) FROM bronze.erp_seller);
	    RAISE NOTICE 'Loaded bronze.erp_seller in % seconds', duration_seconds;
	
		start_time := clock_timestamp();
		current_step := 'Truncating Table: bronze.erp_product';
		RAISE NOTICE ' ';
		RAISE NOTICE 'Truncating Table: bronze.erp_product';
		TRUNCATE TABLE bronze.erp_product;
		RAISE NOTICE 'Copying Data: bronze.erp_product';
		COPY bronze.erp_product
		FROM
			'C:/Users/janam/Desktop/postgres-data-warehouse/dataset/erp/products.csv'
		WITH
			(FORMAT CSV, HEADER TRUE, DELIMITER ',');
		end_time := clock_timestamp();
		duration_seconds := EXTRACT(EPOCH FROM end_time - start_time);
		RAISE NOTICE 'bronze.erp_product loaded: % rows', (SELECT COUNT(*) FROM bronze.erp_product);
	    RAISE NOTICE 'Loaded bronze.erp_product in % seconds', duration_seconds;
		
		
	
		start_time := clock_timestamp();
		current_step := 'Truncating Table: bronze.erp_order';
		RAISE NOTICE ' ';
		RAISE NOTICE 'Truncating Table: bronze.erp_order';
		TRUNCATE TABLE bronze.erp_order;
		RAISE NOTICE 'Copying Data: bronze.erp_order';
		COPY bronze.erp_order
		FROM
			'C:/Users/janam/Desktop/postgres-data-warehouse/dataset/erp/orders.csv'
		WITH
			(FORMAT CSV, HEADER TRUE, DELIMITER ',');
		end_time := clock_timestamp();
		duration_seconds := EXTRACT(EPOCH FROM end_time - start_time);
		RAISE NOTICE 'bronze.erp_order loaded: % rows', (SELECT COUNT(*) FROM bronze.erp_order);
	    RAISE NOTICE 'Loaded bronze.erp_order in % seconds', duration_seconds;
	
		start_time := clock_timestamp();
		current_step := 'Truncating Table: bronze.erp_order_payment';
		RAISE NOTICE ' ';
		RAISE NOTICE 'Truncating Table: bronze.erp_order_payment';
		TRUNCATE TABLE bronze.erp_order_payment;
		RAISE NOTICE 'Copying Data: bronze.erp_order_payment';
		COPY bronze.erp_order_payment
		FROM
			'C:/Users/janam/Desktop/postgres-data-warehouse/dataset/erp/order_payments.csv'
		WITH
			(FORMAT CSV, HEADER TRUE, DELIMITER ',');
		end_time := clock_timestamp();
		duration_seconds := EXTRACT(EPOCH FROM end_time - start_time);
		RAISE NOTICE 'bronze.erp_order_payment loaded: % rows', (SELECT COUNT(*) FROM bronze.erp_order_payment);
	    RAISE NOTICE 'Loaded bronze.erp_order_payment in % seconds', duration_seconds;
	
		start_time := clock_timestamp();
		current_step := 'Truncating Table: bronze.erp_order_item';
		RAISE NOTICE ' ';
		RAISE NOTICE 'Truncating Table: bronze.erp_order_item';
		TRUNCATE TABLE bronze.erp_order_item;
		RAISE NOTICE 'Copying Data: bronze.erp_order_item';
		COPY bronze.erp_order_item
		FROM
			'C:/Users/janam/Desktop/postgres-data-warehouse/dataset/erp/order_items.csv'
		WITH
			(FORMAT CSV, HEADER TRUE, DELIMITER ',');
		end_time := clock_timestamp();
		duration_seconds := EXTRACT(EPOCH FROM end_time - start_time);
		RAISE NOTICE 'bronze.erp_order_item loaded: % rows', (SELECT COUNT(*) FROM bronze.erp_order_item);
	    RAISE NOTICE 'Loaded bronze.erp_order_item in % seconds', duration_seconds;
	
		start_time := clock_timestamp();
		current_step := 'Truncating Table: bronze.erp_geolocation';
		RAISE NOTICE ' ';
		RAISE NOTICE 'Truncating Table: bronze.erp_geolocation';
		TRUNCATE TABLE bronze.erp_geolocation;
		RAISE NOTICE 'Copying Data: bronze.erp_geolocation';
		COPY bronze.erp_geolocation
		FROM
			'C:/Users/janam/Desktop/postgres-data-warehouse/dataset/erp/geolocation.csv'
		WITH
			(FORMAT CSV, HEADER TRUE, DELIMITER ',');
		end_time := clock_timestamp();
		duration_seconds := EXTRACT(EPOCH FROM end_time - start_time);
		RAISE NOTICE 'bronze.erp_geolocation loaded: % rows', (SELECT COUNT(*) FROM bronze.erp_geolocation);
	    RAISE NOTICE 'Loaded bronze.erp_geolocation in % seconds', duration_seconds;
	
			
		-- === Final total timing ===
	    batch_end_time := clock_timestamp();
	    total_duration := EXTRACT(EPOCH FROM batch_end_time - batch_start_time);
		RAISE NOTICE ' ';
	    RAISE NOTICE '==========================================';
	    RAISE NOTICE 'Loading Bronze Tables Completed Successfully';
	    RAISE NOTICE '   - Total Load Duration: % seconds', total_duration;
	    RAISE NOTICE '==========================================';
		
	EXCEPTION WHEN OTHERS THEN
		RAISE NOTICE '==========================================';
        RAISE NOTICE '❌ ERROR OCCURRED DURING LOADING BRONZE TABLES';
        RAISE NOTICE '   - Failed Step: %', current_step;
        RAISE NOTICE '   - Error: %', SQLERRM;
        RAISE NOTICE '==========================================';
        RAISE EXCEPTION 'Aborting load due to error.';
	
	END;
END;
$$;

--SELECT COUNT(*) FROM bronze.crm_customer;