# Selecting my schema
USE Marathon;

# Selecting my df_all_featured
SELECT * 
FROM df_all_featured;

ALTER TABLE df_all_featured
ADD COLUMN age_group VARCHAR(255) AFTER age;

UPDATE df_all
SET age_group = CASE
    WHEN age < 25 THEN '- 25'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
    WHEN age BETWEEN 55 AND 64 THEN '55-64'
    WHEN age BETWEEN 65 AND 74 THEN '65-74'
    WHEN age >= 75 THEN '75+'
    ELSE 'Unknown'
END;

ALTER TABLE df_all_featured
ADD COLUMN division VARCHAR(10) AFTER gender;

UPDATE df_all
SET division = CASE
    WHEN age BETWEEN 18 AND 39 THEN CONCAT(gender, '18-39')
    WHEN age BETWEEN 40 AND 44 THEN CONCAT(gender, '40-44')
    WHEN age BETWEEN 45 AND 49 THEN CONCAT(gender, '45-49')
    WHEN age BETWEEN 50 AND 54 THEN CONCAT(gender, '50-54')
    WHEN age BETWEEN 55 AND 59 THEN CONCAT(gender, '55-59')
    WHEN age BETWEEN 60 AND 64 THEN CONCAT(gender, '60-64')
    WHEN age BETWEEN 65 AND 69 THEN CONCAT(gender, '65-69')
    WHEN age BETWEEN 70 AND 74 THEN CONCAT(gender, '70-74')
    WHEN age BETWEEN 75 AND 79 THEN CONCAT(gender, '75-79')
    WHEN age >= 80 THEN CONCAT(gender, '80+')
    ELSE 'Unknown'
END;

#-----------------------------------------EDA_STARTS-----------------------------------------#

# 1. Basic Statistics | Query the distribution of age groups and gender:
CREATE TABLE eda_1_age_group_performance AS
SELECT age_group, gender, COUNT(*) AS count
FROM df_all_featured
GROUP BY age_group, gender
ORDER BY age_group, gender;


# 2. Overall Performance Analysis | Average pace and speed by gender and age group:
CREATE TABLE eda_2_overall_performance AS 
SELECT age_group, gender, 
       ROUND(AVG(speed_kmh), 2) AS avg_speed_kmh
FROM df_all_featured
GROUP BY age_group, gender
ORDER BY age_group, gender;


# 3. Country Representation | Top 10 countries by number of participants:
CREATE TABLE eda_3_country_representation AS 
SELECT country, COUNT(*) AS participant_count
FROM df_all_featured
GROUP BY country
ORDER BY participant_count DESC
LIMIT 10;


# 4. Top Performers | Top 5 overall runners by year:
CREATE TABLE eda_4_top_performers AS 
SELECT year, name, country, city, time, overall_rank
FROM df_all_featured
WHERE overall_rank <= 5
ORDER BY year, overall_rank;


# 5. Performance Comparison by Division | Average completion time by division:
CREATE TABLE eda_5_performance_division AS 
SELECT division, 
       ROUND(AVG(TIME_TO_SEC(time)) / 60, 2) AS avg_completion_time_minutes
FROM df_all_featured
GROUP BY division
ORDER BY avg_completion_time_minutes;


# 6. Time Trends | Average completion time across years:
CREATE TABLE eda_6_completion_across_years AS 
SELECT year, SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(time)))) AS avg_completion_time
FROM df_all_featured
GROUP BY year
ORDER BY year;


# 7. Checkpoint Performance | Average time at each checkpoint by gender:
CREATE TABLE eda_7_checkpoint_performance AS 
SELECT gender, 
       SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(`5K`)))) AS avg_5K_time,
       SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(`10K`)))) AS avg_10K_time,
       SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(`15K`)))) AS avg_15K_time,
       SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(`20K`)))) AS avg_20K_time,
       SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(half)))) AS avg_half_time,
       SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(`25K`)))) AS avg_25K_time,
       SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(`30K`)))) AS avg_30K_time,
       SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(`35K`)))) AS avg_35K_time,
       SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(`40K`)))) AS avg_40K_time,
       SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(`time`)))) AS avg_final_time
FROM df_all_featured
GROUP BY gender
ORDER BY gender;


# 8. Age Group Performance Comparison | Average speed by age group:
CREATE TABLE eda_8_age_group_performance AS 
SELECT age_group, ROUND(AVG(speed_kmh),2) AS avg_speed_kmh
FROM df_all_featured
GROUP BY age_group
ORDER BY avg_speed_kmh DESC;

#-----------------------------------------EDA_ENDS-----------------------------------------#
SELECT country, bib
FROM df_all_featured
WHERE country = 'ETH';


