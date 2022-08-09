

SELECT *
FROM project_cyclistic.dbo.full_year_2021_version3
WHERE started_datetime = ended_datetime;
-- There are 51,074 rides which were not started or there was
-- an error in the date and time.  This is 
-- indicated by the the start date & time being the same 
-- as the end date & time for a ride.  These rides should 
-- be deleted from the dataset


DELETE
FROM project_cyclistic.dbo.full_year_2021_version3
WHERE started_datetime = ended_datetime;
-- to delete 51,074 rows where the start date & time were the same 
-- as the end date & time for a ride

