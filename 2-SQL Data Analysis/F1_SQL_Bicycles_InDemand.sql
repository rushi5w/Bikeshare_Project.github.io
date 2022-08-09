
SELECT rideable_type, COUNT(*) AS bicycles_in_demand
FROM project_cyclistic.dbo.full_year_2021_version3
GROUP BY rideable_type
ORDER BY bicycles_in_demand DESC;
-- Classic bikes are in the highest demand by riders 
-- followed by electric bikes.
-- Docked bikes are the least used


