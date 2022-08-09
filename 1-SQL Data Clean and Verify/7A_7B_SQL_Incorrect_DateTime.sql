
SELECT ride_id, started_datetime, ended_datetime, 
	   DATEDIFF (DAY, started_datetime, ended_datetime) AS ride_length_days,
	   DATEDIFF (MINUTE, started_datetime, ended_datetime) AS ride_length_minutes,
	   DATEDIFF (SECOND, started_datetime, ended_datetime) AS ride_length_seconds,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  DATEDIFF (MINUTE, started_datetime, ended_datetime) <= 0
ORDER BY ride_length_minutes DESC;
-- 86 rides were identified as having a negative time for 
-- their length of ride time in minutes.  This occurred due to a 
-- data error.  The time at the start of a ride was later than 
-- the time at the end of a ride.

SELECT ride_id, started_datetime, ended_datetime, 
	   DATEDIFF (DAY, started_datetime, ended_datetime) AS ride_length_days,
	   DATEDIFF (MINUTE, started_datetime, ended_datetime) AS ride_length_minutes,
	   DATEDIFF (SECOND, started_datetime, ended_datetime) AS ride_length_seconds,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  DATEDIFF (MINUTE, started_datetime, ended_datetime) > 1440
ORDER BY ride_length_minutes DESC;
-- 4,015 rides were identified as having a length of ride time  
-- greater than 1 day which is 1,440 minutes.  Some rides lasted
-- over 38 days.  This occurred due to a data error or because
-- the bike was not docked properly at the end of a ride.





