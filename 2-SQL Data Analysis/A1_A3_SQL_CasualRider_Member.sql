
SELECT   member_casual,
	     COUNT(*) AS number_of_rides_by_CasualRiders_Members
FROM	 project_cyclistic.dbo.full_year_2021_version3
GROUP BY   member_casual;
-- In 2021 members did more ride (3 million rides) than 
-- casual riders (2.5 million rides)

SELECT   DATENAME (WEEKDAY, started_datetime) AS day_of_week,
		 member_casual,
	     COUNT(ride_id) AS number_of_rides_per_DayofWeek
FROM     project_cyclistic.dbo.full_year_2021_version3
WHERE	 DATENAME (WEEKDAY, started_datetime) IN ('Sunday', 'Saturday', 'Friday')
GROUP BY DATENAME (WEEKDAY, started_datetime), member_casual
ORDER BY day_of_week DESC;
-- Most number of rides done during the weekend (not weekdays) were by
-- by Casual Riders (not Members).  Also on Friday a significant number
-- of rides were done by Casual Riders.

SELECT   member_casual,
	     COUNT(ride_id) AS number_of_rides_Fri_Sat_Sunday,
		
		(SELECT COUNT(*) 
		 FROM project_cyclistic.dbo.full_year_2021_version3
		 WHERE	DATENAME (WEEKDAY, started_datetime) IN ('Sunday', 'Saturday', 'Friday')) 
		 AS total_rides_Fri_Sat_Sunday,
		 
		 FORMAT( CAST (COUNT(ride_id) AS decimal(10,2)) / 
		 CAST((SELECT COUNT(*) 
		       FROM project_cyclistic.dbo.full_year_2021_version3
			   WHERE DATENAME (WEEKDAY, started_datetime) IN ('Sunday', 'Saturday', 'Friday'))
			   AS decimal(10,2)), 'P2') AS percentage_of_rides

FROM     project_cyclistic.dbo.full_year_2021_version3
WHERE	 DATENAME (WEEKDAY, started_datetime) IN ('Sunday', 'Saturday', 'Friday')
GROUP BY member_casual;
-- during the weekend and Friday the Casual Riders did
-- 53% of the rides whereas Members did only 47% of the rides


