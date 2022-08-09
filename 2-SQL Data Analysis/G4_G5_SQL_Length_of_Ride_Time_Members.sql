
SELECT ride_id, rideable_type, started_datetime, ended_datetime, 
	   DATEDIFF (DAY, started_datetime, ended_datetime) AS ride_length_days,
	   DATEDIFF (MINUTE, started_datetime, ended_datetime) AS ride_length_minutes,
	   DATEDIFF (SECOND, started_datetime, ended_datetime) AS ride_length_seconds,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (DATEDIFF (MINUTE, started_datetime, ended_datetime) BETWEEN 46 AND 1440) AND
	   rideable_type = 'classic_bike'AND
	   member_casual = 'member'
ORDER BY ride_length_minutes DESC;
-- 33,364 rides by member riders on classic bikes with
-- a ride length of time greater than 45 minutes

-- Also the data was filtered to exclude incorrect data for length of time 
-- for rides with negative minutes and rides longer than 1 day (1,440 minutes)



SELECT ride_id, rideable_type, started_datetime, ended_datetime, 
	   DATEDIFF (DAY, started_datetime, ended_datetime) AS ride_length_days,
	   DATEDIFF (MINUTE, started_datetime, ended_datetime) AS ride_length_minutes,
	   DATEDIFF (SECOND, started_datetime, ended_datetime) AS ride_length_seconds,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (DATEDIFF (MINUTE, started_datetime, ended_datetime) BETWEEN 46 AND 1440) AND
	   rideable_type = 'electric_bike'AND
	   member_casual = 'member'
ORDER BY ride_length_minutes DESC;
-- 21,171 rides by member riders on electric bikes with 
-- a ride length of time greater than 45 minutes

