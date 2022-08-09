
SELECT rideable_type, start_station_id, start_station_name, COUNT(*) AS bicycles_in_demand
FROM project_cyclistic.dbo.full_year_2021_version3
GROUP BY rideable_type, start_station_id, start_station_name
ORDER BY rideable_type, bicycles_in_demand DESC;
--Shows which types of bicycles are in high demand by customers and
-- at which start stations these bikes are located (including
-- the most popular start stations)


