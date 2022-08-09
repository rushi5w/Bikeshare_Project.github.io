SELECT *
FROM project_cyclistic.dbo.full_year_2021_ver2;
---- to view the table of full year data 2021
-- which has 5,595,063 records

SELECT LTRIM(RTRIM (ride_id)), COUNT( LTRIM(RTRIM(ride_id) ))
FROM project_cyclistic.dbo.full_year_2021_ver2
GROUP BY LTRIM(RTRIM (ride_id))
HAVING COUNT( LTRIM(RTRIM(ride_id) )) > 1;
-- to check if there are duplicate rows based on a
-- single column ride_id where the count of ride_id appears 
-- more than 1.  Also used TRIM() to remove spaces in 
-- ride_id which is datatype String.  The query result is
-- 12 ride_id numbers which had duplicate numbers in
-- 24 records but they had different data in their columns 
-- such as the ride start date and start stations.  Therefore 
-- these 24 records were not considered duplicates

SELECT *
FROM project_cyclistic.dbo.full_year_2021_ver2
WHERE ride_id IN ( '5.88492E+15', '3.32092E+15', '3.89E+36', '9.52266E+15', '1.56E+21',
                 '1.98008E+15', '7.67E+19', '5.58E+17', '4.89E+17', '5.03E+14', '8.01E+19',
				 '7.24E+96');
-- 12 ride_id numbers were checked for duplicate data in 24 records
-- and none were duplicate rows because their columns had different data.  
-- The 12 duplicate ride_id numbers may have been an error in the bikeshare
-- computer system

SELECT rideable_type, started_datetime, ended_datetime, 
       start_station_name, start_station_id, end_station_name, end_station_id, 
	   member_casual, COUNT(*) AS Duplicate_Rows
FROM project_cyclistic.dbo.full_year_2021_ver2
GROUP BY rideable_type, started_datetime, ended_datetime,
		 start_station_name, start_station_id, end_station_name, end_station_id, 
		 member_casual
HAVING COUNT(*) > 1;
-- to check if there are duplicate rows based on 
-- multiple columns (but excluding columns ride_id, latitude & longitude).  
-- There were 200,678 duplicate rows but they had different ride_id numbers.  
-- Therefore these rides may have been taken by pairs of people or groups of
-- people travelling together which explains the identical data in 
-- all columns except for the ride_id column.  We should not
-- delete these rows unless we can obtain more information to confirm these
-- were duplicate rides.

SELECT *
FROM project_cyclistic.dbo.full_year_2021_ver2
WHERE start_station_id = 'KA1503000041' AND end_station_id = 'TA1307000163' AND
      member_casual ='member' AND started_datetime = '2021-01-01 02:49:00' AND
	  ended_datetime = '2021-01-01 03:16:00';
-- to view the details of a duplicate ride based on 
-- the above WHERE filter criteria