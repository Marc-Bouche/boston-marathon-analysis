# Selecting my schema
USE Marathon;

# Selecting my df_all_featured
SELECT * 
FROM df_all_featured;

#---------------------------------------------------------------------------------------------------------------------------------# 

# 1. Identify Runners with Multiple Races Based on Name
SELECT name, COUNT(DISTINCT year) AS num_races
FROM df_all_featured
WHERE year BETWEEN 2015 AND 2017
GROUP BY name
HAVING num_races >= 2;

#---------------------------------------------------------------------------------------------------------------------------------# 

# 2. Get Performance Metrics for Runners with Multiple Races

SELECT a.name, a.year, a.time, a.pace_kmh
FROM df_all_featured a
JOIN (
    SELECT name
    FROM df_all_featured
    WHERE year BETWEEN 2015 AND 2017
    GROUP BY name
    HAVING COUNT(DISTINCT year) >= 2
) b ON a.name = b.name
WHERE a.year BETWEEN 2015 AND 2017
ORDER BY a.name, a.year;

#---------------------------------------------------------------------------------------------------------------------------------# 
# 1. Create a  Table for Repeat Runners

CREATE TABLE H4_repeat_runners AS
SELECT name
FROM df_all_featured
WHERE year BETWEEN 2015 AND 2017
GROUP BY name
HAVING COUNT(DISTINCT year) >= 2;

#---------------------------------------------------------------------------------------------------------------------------------# 

 # 3. Use a Join to Retrieve First and Last Year of Participation
 
CREATE TABLE H4_participation_year
SELECT f.name, 
       MIN(f.year) AS first_year, 
       MAX(f.year) AS last_year
FROM df_all_featured 
INNER JOIN repeat_runners r ON f.name = r.name
GROUP BY f.name;

#---------------------------------------------------------------------------------------------------------------------------------# 
# 4 Extract Initial and Subsequent Race Data

CREATE TABLE  H4_runners_time_racetype AS
SELECT f.name, 
       f.year, 
       f.time, 
       f.pace_mph, 
       f.pace_kmh,
       CASE 
           WHEN f.year = fr.first_year THEN 'Initial'
           ELSE 'Subsequent'
       END AS race_type
FROM df_all_featured f
INNER JOIN (
    SELECT name, 
           MIN(year) AS first_year 
    FROM df_all_featured 
    WHERE name IN (SELECT name FROM repeat_runners)
    GROUP BY name
) fr ON f.name = fr.name
WHERE f.year BETWEEN 2015 AND 2017
ORDER BY f.name, f.year;

#---------------------------------------------------------------------------------------------------------------------------------# 
# 5.-- Python
# 6. -- Python
# 7. -- Python
#---------------------------------------------------------------------------------------------------------------------------------# 