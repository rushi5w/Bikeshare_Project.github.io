
SELECT *
INTO   #temporary_table_excluding_NULL 
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (start_station_id IS NOT NULL OR start_station_id <> '') AND
	   (end_station_id IS NOT NULL OR end_station_id <> '') AND
	   (start_station_name IS NOT NULL OR start_station_name <> '') AND
	   (end_station_name IS NOT NULL OR end_station_name <> '');
-- There are 4,553,532 rides excluding NULL values which will be used
-- for my data analysis.  To verify that all NULL values have been
-- excluded correctly this query was saved as a Temporary Table 
-- #temporary_table_excluding_NULL and then tested for NULL values. 

SELECT *
FROM   #temporary_table_excluding_NULL;
-- to view the Temporary Table excluding NULL values.
-- There are 4,553,532 rides excluding NULL values.

SELECT *
FROM   #temporary_table_excluding_NULL
WHERE  (start_station_id IS NULL OR start_station_id = '') OR
	   (end_station_id IS NULL OR end_station_id = '') OR
	   (start_station_name IS NULL OR start_station_name = '') OR
	   (end_station_name IS NULL OR end_station_name = '');
-- to verify the 4,553,532 rides in the Temporary Table 
-- #temporary_table_excluding_NULL does not contain NULL values 
-- by using a WHERE filter.  
