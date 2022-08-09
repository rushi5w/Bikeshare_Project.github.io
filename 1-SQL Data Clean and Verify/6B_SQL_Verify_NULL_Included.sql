
SELECT COALESCE (start_station_name, 'NULL Exists') AS start_station_name_verify,
	   COALESCE (start_station_id, 'NULL Exists') AS start_station_id_verify,
	   COALESCE (end_station_name, 'NULL Exists') AS end_station_name_verify,
	   COALESCE (end_station_id, 'NULL Exists') AS end_station_id_verify
INTO   #temporary_table_including_NULL 
FROM   project_cyclistic.dbo.full_year_2021_version3;
-- COALESCE used to verify 990,457 rides have a NULL value for start stations and
-- end stations.  This query's results were saved into the 
-- Temporary Table #temporary_table_including_NULL so that the records can be Counted

SELECT COUNT(*) AS rides_including_NULL
FROM   #temporary_table_including_NULL
WHERE  start_station_name_verify = 'NULL Exists' OR
       start_station_id_verify =   'NULL Exists' OR 
	   end_station_name_verify =   'NULL Exists' OR
	   end_station_id_verify   =   'NULL Exists';
-- COUNT used to verify there are 990,457 rides which have a 
-- NULL value for start stations and end stations


