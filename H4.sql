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

SELECT name, MIN(year) AS first_year, MAX(year) AS last_year
FROM df_all_featured
WHERE name IN (
    SELECT name
    FROM df_all_featured
    WHERE year BETWEEN 2015 AND 2017
    GROUP BY name
    HAVING COUNT(DISTINCT year) >= 2
)
GROUP BY name;

