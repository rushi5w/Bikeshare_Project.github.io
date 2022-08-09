

SELECT started_datetime, 
	   SUBSTRING (CONVERT (varchar(50), started_datetime), 1,11) AS date_start,
	   RIGHT (CONVERT (varchar(50), started_datetime), 8) AS time_start,
	   ended_datetime,
	   SUBSTRING (CONVERT (varchar(50), ended_datetime), 1,11) AS date_end,
	   RIGHT (CONVERT (varchar(50), ended_datetime), 8) AS time_end
FROM project_cyclistic.dbo.full_year_2021_ver2;
-- to Verify the conversion of the fields started_datetime and ended_datetime
-- from data type DateTime to SmallDateTime was done accurately and consistently.  
-- SMALLDATETIME uses the format yyyy-mm-dd with 24 hour time as hh-mm-ss.
-- This query splits the data in column started_datetime into 2 separate columns
-- showing the date and time in separate columns.  The same was then done
-- for column ended_datetime.  The data was first changed to data type String and 
-- then the column was split into different columns by using the functions
-- SUBSTRING (), CONVERT() and RIGHT().

