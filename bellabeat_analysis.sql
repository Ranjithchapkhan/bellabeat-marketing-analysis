

 /* =====================================================
   Bellabeat Marketing Analysis
   Author: Ranjith
   Tool: Google BigQuery
   ===================================================== */


/* -----------------------------------------------------
   1. Weekday vs Weekend Activity
----------------------------------------------------- */SELECT
  CASE 
    WHEN FORMAT_DATE('%A', ActivityDate) IN ('Saturday','Sunday')
    THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type,
  ROUND(AVG(TotalSteps), 0) AS avg_steps
FROM `project-bellabeat-488416.Bellabeat_Data.daily_activity_clean_final`
GROUP BY day_type;


/* -----------------------------------------------------
   2. Average Steps by Day of Week
----------------------------------------------------- */
SELECT
  CASE 
    WHEN FORMAT_DATE('%A', ActivityDate) IN ('Saturday','Sunday')
    THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type,
  ROUND(AVG(TotalSteps), 0) AS avg_steps
FROM `project-bellabeat-488416.Bellabeat_Data.daily_activity_clean_final`
GROUP BY day_type;


/* -----------------------------------------------------
   3. Activity Level vs Sleep Duration
----------------------------------------------------- */
select 
case when Totalsteps < 5000 then "Low Activity"
 when Totalsteps between 5000 and 9999 then "Moderate Activity"
 Else "High Activity"
 END as Activity_level, avg(totalMinutesAsleep) as avg_sleep_minutes
 from `project-bellabeat-488416.Bellabeat_Data.activity_sleep`
 where totalminutesasleep is not null
 group by activity_level;

