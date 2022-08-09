SELECT S.started_datetime AS first_table_started_datetime,
       S.ride_id AS first_table_ride_id,
	   S.ended_datetime AS first_table_ended_datetime,
	   E.started_datetime AS second_table_started_datetime,
	   E.ride_id AS second_table_ride_id
FROM project_cyclistic.dbo.full_year_2021_ver2 AS S
     INNER JOIN project_cyclistic.dbo.full_year_2021_ver2 AS E
	 ON S.ended_datetime = E.started_datetime
	 AND S.ride_id = E.ride_id;
-- This query is done to Verify that the 51,074 records previously identified as
-- rides not started, were identified correctly.  An INNER SELF JOIN is used to identify these 
-- 51,074 rows in table full_year_2021_ver2.  It shows the start date & time is the same 
-- as the end date & time for each ride.  These rides were previously 
-- deleted from the dataset table full_year_2021_ver2 and the remaining rides were saved
-- as a new table version titled full_year_2021_version3

