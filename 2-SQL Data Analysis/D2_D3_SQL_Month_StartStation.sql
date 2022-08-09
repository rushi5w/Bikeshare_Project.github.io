
SELECT   start_station_id, start_station_name,
	     DATEPART (MONTH, started_datetime) AS the_months,
	     DATENAME (MONTH, started_datetime) AS name_of_month,
	     COUNT(*) AS number_of_rides_per_month
FROM	 project_cyclistic.dbo.full_year_2021_version3
WHERE    start_station_id = '13022' OR start_station_id ='13042' OR start_station_id ='TA1308000050' 
         OR start_station_id ='13008'
GROUP BY start_station_id, start_station_name, 
         DATEPART (MONTH, started_datetime), DATENAME (MONTH, started_datetime)
ORDER BY start_station_id, the_months ASC;
--shows that the most frequently used start_stations by casual riders had their highest number of rides
-- during the Summer season (June-Sep) in Chicago


SELECT   start_station_id, start_station_name,
	     DATEPART (MONTH, started_at) AS the_months,
	     DATENAME (MONTH, started_at) AS name_of_month,
	     COUNT(*) AS number_of_rides_per_month
FROM	 project_cyclistic.dbo.full_year_2021_version3
WHERE    start_station_id = 'TA1307000039' OR start_station_id ='KA1503000043' OR 
		 start_station_id ='13045' OR start_station_id ='13016'
GROUP BY start_station_id, start_station_name, DATEPART (MONTH, started_at), DATENAME (MONTH, started_at)
ORDER BY start_station_id, the_months ASC;
--shows that the most frequently used start_stations by Member riders had their highest number of rides
-- during the Summer season (June-Sep) in Chicago




