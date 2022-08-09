SELECT ride_id, rideable_type, started_at, ended_at,
	   CONVERT (smalldatetime, started_at, 120) AS started_datetime,
	   CONVERT (smalldatetime, ended_at, 120) AS ended_datetime,
	   start_station_name, start_station_id, end_station_name,
	   end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
INTO project_cyclistic.dbo.full_year_2021_ver2
FROM project_cyclistic.dbo.full_year_2021;
-- to create a NEW TABLE full_year_2021_ver2 including converted date columns which are now
-- datatype SMALLDATETIME and format yyy-mm-dd with 24 hour time hh-mm-ss
-- The Microsoft documents shows this is style 120.

SELECT *
FROM   project_cyclistic.dbo.full_year_2021_ver2;
-- to check the new date columns are included in the new table

ALTER TABLE project_cyclistic.dbo.full_year_2021_ver2 DROP COLUMN started_at;
------ to delete the previous column started_at

ALTER TABLE project_cyclistic.dbo.full_year_2021_ver2 DROP COLUMN ended_at;
---- to delete the previous column ended_at

SELECT *
FROM   project_cyclistic.dbo.full_year_2021_ver2;
-- to check the columns have been deleted (started_at, ended_at) in the new table