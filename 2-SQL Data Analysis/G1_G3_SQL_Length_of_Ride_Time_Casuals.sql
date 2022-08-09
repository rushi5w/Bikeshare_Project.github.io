
SELECT ride_id, rideable_type, started_datetime, ended_datetime, 
	   DATEDIFF (DAY, started_datetime, ended_datetime) AS ride_length_days,
	   DATEDIFF (MINUTE, started_datetime, ended_datetime) AS ride_length_minutes,
	   DATEDIFF (SECOND, started_datetime, ended_datetime) AS ride_length_seconds,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (DATEDIFF (MINUTE, started_datetime, ended_datetime) BETWEEN 181 AND 1440) AND
	   rideable_type = 'classic_bike'AND
	   member_casual = 'casual'
ORDER BY ride_length_minutes DESC;
 -- 8,534 rides by casual riders on classic bikes with a ride
 -- length of time greater than 180 minutes 
-- Also the data was filtered to exclude incorrect data for length of time 
-- for rides with negative minutes and rides longer than 1 day (1,440 minutes)


SELECT ride_id, rideable_type, started_datetime, ended_datetime, 
	   DATEDIFF (DAY, started_datetime, ended_datetime) AS ride_length_days,
	   DATEDIFF (MINUTE, started_datetime, ended_datetime) AS ride_length_minutes,
	   DATEDIFF (SECOND, started_datetime, ended_datetime) AS ride_length_seconds,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (DATEDIFF (MINUTE, started_datetime, ended_datetime) BETWEEN 31 AND 1440) AND
	   rideable_type = 'electric_bike'AND
	   member_casual = 'casual'
ORDER BY ride_length_minutes DESC;
-- 157,113 rides by casual riders on electric bikes with a 
-- ride length of time greater than 30 minutes

SELECT ride_id, rideable_type, started_datetime, ended_datetime, 
	   DATEDIFF (DAY, started_datetime, ended_datetime) AS ride_length_days,
	   DATEDIFF (MINUTE, started_datetime, ended_datetime) AS ride_length_minutes,
	   DATEDIFF (SECOND, started_datetime, ended_datetime) AS ride_length_seconds,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (DATEDIFF (MINUTE, started_datetime, ended_datetime) BETWEEN 31 AND 1440) AND
	   rideable_type = 'docked_bike'AND
	   member_casual = 'casual'
ORDER BY ride_length_minutes DESC;
-- 145,761 rides by casual riders on docked bikes with a 
-- ride length of time greater than 30 minutes
