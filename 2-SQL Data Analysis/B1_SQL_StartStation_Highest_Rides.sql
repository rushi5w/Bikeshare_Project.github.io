
SELECT start_station_id, 
	   start_station_name, 
	   COUNT(*) AS number_of_rides_by_StartStation
FROM project_cyclistic.dbo.full_year_2021_version3
GROUP BY start_station_id, start_station_name
ORDER BY number_of_rides_by_StartStation DESC;
-- to show the start stations with the highest number of rides
-- NULL values are if no start_station exists 
-- COUNT(*) includes rides without a start_station_id


