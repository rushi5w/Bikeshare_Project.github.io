SELECT ride_id, start_station_id,
CASE
	   WHEN start_station_id IS NULL OR start_station_id = '' THEN 'No_Start_ID'
	   ELSE start_station_id
END	   AS new_start_station_id,
	   end_station_id,
CASE
	   WHEN end_station_id IS NULL OR end_station_id = '' THEN 'No_End_ID' 
	   ELSE end_station_id
END	   AS new_end_station_id
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (start_station_id IS NULL OR start_station_id = '') OR
	   (end_station_id IS NULL OR end_station_id = '')
-- There are 990,456 rides which have a NULL value for start_station_id or
-- end_station_id.  These rides were excluded from the analysis to find the most 
-- popular bike routes involving pairings of start stations and end stations.


SELECT ride_id, start_station_id, end_station_id,
	   CONCAT (start_station_id, '-', end_station_id) AS ID_start_end,
	   start_station_name, end_station_name,
	   CONCAT (start_station_name, '-', end_station_name) AS Name_start_end,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (start_station_id IS NOT NULL OR start_station_id <> '') AND
	   (end_station_id IS NOT NULL OR end_station_id <> '');
-- There are 4,553,533 rides which have both a start_station_id and an
-- end_station_id (excluding NULLS).  These rides were included for the 
-- analysis of most popular bike routes involving 
-- pairings of start stations and end stations.


SELECT CONCAT (start_station_id, '-', end_station_id) AS ID_start_end,
	   CONCAT (start_station_name, '-', end_station_name) AS Name_start_end,
	   COUNT (*) AS Rides_per_station_pairs,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (start_station_id IS NOT NULL OR start_station_id <> '') AND
	   (end_station_id IS NOT NULL OR end_station_id <> '') AND
	   (start_station_id = end_station_id)
GROUP BY start_station_id, end_station_id,
		 CONCAT (start_station_id, '-', end_station_id),
         CONCAT (start_station_name, '-', end_station_name),
		 member_casual
ORDER BY Rides_per_station_pairs DESC;
-- excludes NULLS and shows only rides where end station is the 
-- same as start station which means the rider returned the bike 
-- at the end of their trip to their start station.  But this does 
-- not show a bike route.

SELECT TOP 10
       start_station_id, end_station_id,
	   CONCAT (start_station_id, '-', end_station_id) AS ID_start_end,
	   CONCAT (start_station_name, '-', end_station_name) AS Name_start_end,
	   COUNT (*) AS Rides_per_station_pairs,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (start_station_id IS NOT NULL OR start_station_id <> '') AND
	   (end_station_id IS NOT NULL OR end_station_id <> '') AND
	   (start_station_id <> end_station_id)
GROUP BY start_station_id, end_station_id,
		 CONCAT (start_station_id, '-', end_station_id),
         CONCAT (start_station_name, '-', end_station_name),
		 member_casual
ORDER BY Rides_per_station_pairs DESC;
-- There are 246,265 bike routes
-- This query displays the TOP 10 most popular bike routes based on the number of rides 
-- taken at pairings of start stations and end stations.  This query 
-- excludes NULLS & shows only rides where end station is different to 
-- start station which is a bike route.

SELECT start_station_id, end_station_id,
	   CONCAT (start_station_id, '-', end_station_id) AS ID_start_end,
	   CONCAT (start_station_name, '-', end_station_name) AS Name_start_end,
	   COUNT (*) AS Rides_per_station_pairs,
	   member_casual
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (start_station_id IS NOT NULL OR start_station_id <> '') AND
	   (end_station_id IS NOT NULL OR end_station_id <> '') AND
	   (start_station_id <> end_station_id) 
GROUP BY start_station_id, end_station_id,
		 CONCAT (start_station_id, '-', end_station_id),
         CONCAT (start_station_name, '-', end_station_name),
		 member_casual
HAVING  COUNT (*) IN (13, 22, 35)
ORDER BY Rides_per_station_pairs DESC;
-- to display the unpopular bike routes by filtering 
-- for a sample of routes with a 
-- count of rides of only 13, 22, or 35 rides