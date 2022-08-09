
SELECT DISTINCT (TRIM (ride_id))
FROM project_cyclistic.dbo.full_year_2021_ver2
ORDER BY (TRIM (ride_id)) ASC;
-- to Verify duplicate records found in a
-- single column, ride_id, by using DISTINCT to find unique values 
-- excluding duplicate records.
-- There are 5,595,051 distinct records.  The remaining
-- 12 records in this table which had repeated ride_id numbers 
-- were previously confirmed as not being duplicate records because 
-- these records had columns with different data such as different start dates
-- and end dates, different start stations and end stations


SELECT DISTINCT ride_id, rideable_type, started_datetime, ended_datetime, 
       start_station_name, start_station_id, end_station_name, end_station_id, 
	   member_casual
FROM project_cyclistic.dbo.full_year_2021_ver2
-- to Verify duplicate records previously found based on 
-- multiple columns, by using DISTINCT to find unique values 
-- excluding duplicate records.  This DISTINCT criteria includes 
-- all columns including ride_id but excludes the latitude and 
-- longitude columns.  There are 5,595,063 distinct records
-- which is the entire table full_year_2021_ver2
