
SELECT   DATEPART (HOUR, started_datetime) AS the_hour,
	     COUNT(*) AS number_of_rides_per_hour
FROM	 project_cyclistic.dbo.full_year_2021_version3
GROUP BY DATEPART (HOUR, started_datetime)
ORDER BY number_of_rides_per_hour desc;
-- Most number of rides were done in the afternoon between 12pm and 6pm
--shows which time in hours with the highest number of rides.

SELECT   DATENAME (WEEKDAY, started_datetime) AS day_of_week,
	     COUNT(*) AS number_of_rides_per_DayofWeek
FROM     project_cyclistic.dbo.full_year_2021_version3
GROUP BY DATENAME (WEEKDAY, started_datetime)
ORDER BY number_of_rides_per_DayofWeek desc;
-- Most number of rides were done on the weekend and Friday (not weekdays)
--shows number of rides per day of the week.

SELECT   DATENAME (WEEKDAY, started_datetime) AS day_of_week,
		 DATEPART (HOUR, started_datetime) AS the_hour,
	     COUNT(*) AS number_of_rides_per_DayofWeek
FROM     project_cyclistic.dbo.full_year_2021_version3
WHERE	 (DATENAME (WEEKDAY, started_datetime) ='Sunday' OR DATENAME (WEEKDAY, started_datetime) ='Saturday'
	     OR DATENAME (WEEKDAY, started_datetime) ='Friday') 	
GROUP BY DATENAME (WEEKDAY, started_datetime), DATEPART (HOUR, started_datetime)
ORDER BY day_of_week, number_of_rides_per_DayofWeek desc;
-- Between 12pm and 6pm on weekends (Saturday, Sunday and Friday) was when 
-- the most number of rides ocurred. 

SELECT   DATENAME (WEEKDAY, started_datetime) AS day_of_week,
		 DATEPART (HOUR, started_datetime) AS the_hour,
	     COUNT(*) AS number_of_rides_per_DayofWeek
FROM     project_cyclistic.dbo.full_year_2021_version3
WHERE	 (DATENAME (WEEKDAY, started_datetime) <>'Sunday' AND DATENAME (WEEKDAY, started_datetime) <>'Saturday'
	     AND DATENAME (WEEKDAY, started_datetime) <>'Friday') 	
GROUP BY DATENAME (WEEKDAY, started_datetime), DATEPART (HOUR, started_datetime)
ORDER BY day_of_week, number_of_rides_per_DayofWeek desc;
-- Between 7am-9am and 4pm- 6pm peak time was when the 
-- most number of rides ocurred for weekdays (excluding Friday)


SELECT   DATENAME (WEEKDAY, started_datetime) AS day_of_week,
		 DATEPART (HOUR, started_datetime) AS the_hour,
		 start_station_id, 
		 start_station_name,
	     COUNT(*) AS number_of_rides_per_DayofWeek
FROM     project_cyclistic.dbo.full_year_2021_version3
WHERE	 DATEPART (HOUR, started_datetime) BETWEEN 12 AND 18
         AND (DATENAME (WEEKDAY, started_datetime) ='Sunday' OR DATENAME (WEEKDAY, started_datetime) ='Saturday'
			  OR DATENAME (WEEKDAY, started_datetime) ='Friday')
		 AND (start_station_id ='13022'OR start_station_id ='13042' OR start_station_id ='13008'
			  OR start_station_id ='TA1308000050' OR start_station_id ='TA1307000039')
GROUP BY DATENAME (WEEKDAY, started_datetime), DATEPART (HOUR, started_datetime), 
		 start_station_id, start_station_name
ORDER BY day_of_week, number_of_rides_per_DayofWeek desc;
-- Between 12pm and 6pm on weekends (Saturday, Sunday and Friday) was when 
-- the most number of rides ocurred.  Also this occurred at the most frequently
-- used start stations with ID 13022, 13042, 13008, TA1308000050, TA1307000039



