SELECT DISTINCT rideable_type
FROM project_cyclistic.dbo.full_year_2021_ver2;
-- to check there are no leading or trailing spaces in 
-- column rideable_type by using DISTINCT

SELECT DISTINCT member_casual
FROM project_cyclistic.dbo.full_year_2021_ver2;
-- to check there are no leading or trailing spaces in 
-- column member_casual by using DISTINCT

SELECT 
	 COUNT (DISTINCT start_station_id) AS StartStationID_with_spaces,
	 COUNT (DISTINCT TRIM(start_station_id) ) AS StartStationID_no_spaces,
	 COUNT (DISTINCT end_station_id) AS EndStationID_with_spaces,
     COUNT (DISTINCT TRIM(end_station_id) ) AS EndStationID_no_spaces,
	 COUNT (DISTINCT start_station_name) AS StartStationName_with_spaces,
	 COUNT (DISTINCT TRIM(start_station_name)) AS StartStationName_no_spaces,
	 COUNT (DISTINCT end_station_name) AS EndStationName_with_spaces,
	 COUNT (DISTINCT TRIM(end_station_name)) AS EndStationName_no_spaces,
	 COUNT (DISTINCT ride_id) AS RideID_with_spaces,
	 COUNT (DISTINCT TRIM(ride_id) ) AS RideID_no_spaces
FROM project_cyclistic.dbo.full_year_2021_ver2;
-- This query used TRIM, DISTINCT and COUNT to check there are no leading or 
-- trailing spaces in columns start station id and name, 
-- end station id and name, and ride id.
