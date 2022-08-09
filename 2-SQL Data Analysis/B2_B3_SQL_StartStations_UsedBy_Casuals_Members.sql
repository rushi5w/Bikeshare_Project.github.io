
SELECT TOP 10
	   member_casual,
	   start_station_id, 
	   start_station_name, 
	   COUNT(*) AS number_of_rides_by_StartStation
FROM project_cyclistic.dbo.full_year_2021_version3
WHERE member_casual = 'casual'
GROUP BY member_casual, start_station_id, start_station_name
ORDER BY number_of_rides_by_StartStation DESC;
-- to show the Top 10 start stations used most frequently by 
-- Casuals (which are different compared to Members)


SELECT TOP 10
	   member_casual,
	   start_station_id, 
	   start_station_name,
	   COUNT(*) AS number_of_rides_by_StartStation
FROM project_cyclistic.dbo.full_year_2021_version3
WHERE member_casual = 'member'
GROUP BY member_casual, start_station_id, start_station_name
ORDER BY number_of_rides_by_StartStation DESC;
-- to show the Top 10 start stations used most frequently by 
-- Members



