SELECT *
FROM   project_cyclistic.dbo.full_year_2021_version3
WHERE  (start_station_id IS NULL OR start_station_id = '') OR
	   (end_station_id IS NULL OR end_station_id = '') OR
	   (start_station_name IS NULL OR start_station_name = '') OR
	   (end_station_name IS NULL OR end_station_name = '');
-- There are 990,457 rides which have a NULL value for start stations and
-- end stations by station id or station name.  