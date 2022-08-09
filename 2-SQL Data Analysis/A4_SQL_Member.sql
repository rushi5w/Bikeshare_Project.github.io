
SELECT   member_casual,
	     COUNT(ride_id) AS number_of_rides_Weekdays_ExcludingFriday,
		
		(SELECT COUNT(*) 
		 FROM project_cyclistic.dbo.full_year_2021_version3
		 WHERE	DATENAME (WEEKDAY, started_datetime) NOT IN ('Sunday', 'Saturday', 'Friday')) 
		 AS total_rides_Weekdays_ExcludingFriday,
		 
		 FORMAT( CAST (COUNT(ride_id) AS decimal(10,2)) / 
		 CAST((SELECT COUNT(*) 
		       FROM project_cyclistic.dbo.full_year_2021_version3
			   WHERE DATENAME (WEEKDAY, started_datetime) NOT IN ('Sunday', 'Saturday', 'Friday'))
			   AS decimal(10,2)),'P2') AS percentage_of_rides

FROM     project_cyclistic.dbo.full_year_2021_version3
WHERE	 DATENAME (WEEKDAY, started_datetime) NOT IN ('Sunday', 'Saturday', 'Friday')
GROUP BY member_casual;
-- to show that Members did 61% of the rides while Casual Riders did only
-- 38% of the rides on weekdays (excluding Friday)