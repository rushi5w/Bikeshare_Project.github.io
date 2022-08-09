
SELECT   DATEPART (MONTH, started_datetime) AS the_months,
	     DATENAME (MONTH, started_datetime) AS name_of_month,
	     COUNT(*) AS number_of_rides_per_month
FROM	 project_cyclistic.dbo.full_year_2021_version3
GROUP BY DATEPART (MONTH, started_datetime), DATENAME (MONTH, started_datetime)
ORDER BY number_of_rides_per_month desc;
--shows months with the highest number of rides.
-- Chicago Summer season (June-Sep) had the highest rides
-- Chicago Winter season (Dec-Feb) had the lowest rides



