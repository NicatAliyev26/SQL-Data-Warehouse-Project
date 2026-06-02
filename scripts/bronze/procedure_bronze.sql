EXEC  bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '==========================================';
		PRINT 'LOADING BRONZE TABLE';
		PRINT '==========================================';

		PRINT '------------------------------------------';
		PRINT 'LOADING CRM TABLES';
		PRINT '------------------------------------------';

		PRINT ' INSERTING DATA crm_cust_info'

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info;  -- deleting table

		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\nicat\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------------------------------------';

		PRINT ' INSERTING DATA crm_prd_info'
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info;

		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\nicat\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------------------------------------';

		PRINT ' INSERTING DATA crm_sales_details'
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_sales_details;

		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\nicat\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------------------------------------';


		PRINT '------------------------------------------';
		PRINT 'LOADING CRM TABLES';
		PRINT '------------------------------------------';

		PRINT ' INSERTING DATA erp_cust_az12';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_cust_az12;

		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\nicat\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------------------------------------';

		PRINT ' INSERTING DATA erp_loc_a101';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_loc_a101;

		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\nicat\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------------------------------------';

		PRINT ' INSERTING DATA erp_px_cat_g1v2';

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\nicat\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------------------------------------';

		SET @batch_end_time = GETDATE();
		PRINT '============================================================';
		PRINT 'LOADING BRONZE LAYER IS COMPLETED';
		PRINT '  - Total Load Duration: ' + CAST(DATEDIFF(SECOND,@batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '============================================================';
	END TRY
	BEGIN CATCH
	PRINT '=================================';
	PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
	PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
	PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR(50));
	PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR(50));
	PRINT '=================================';
	END CATCH
END
