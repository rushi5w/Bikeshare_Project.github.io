--SELECT *
--FROM project_cyclistic.dbo.full_year_2021_version3;
---- to view the table of full year data 2021 version3

SELECT   DATEPART (MONTH, started_datetime) AS the_months,
	     DATENAME (MONTH, started_datetime) AS name_of_month,
		 DATENAME (WEEKDAY, started_datetime) AS day_of_week,
		 DATEPART (HOUR, started_datetime) AS the_hour,
		 member_casual,
	     COUNT(*) AS number_of_rides
FROM	 project_cyclistic.dbo.full_year_2021_version3
GROUP BY DATEPART (MONTH, started_datetime), DATENAME (MONTH, started_datetime), 
		 DATENAME (WEEKDAY, started_datetime),
		 DATEPART (HOUR, started_datetime), member_casual
ORDER BY number_of_rides desc;
-- shows rides by season month, day and time for members & casual riders


