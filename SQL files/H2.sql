# Selecting my schema
USE Marathon;

# Selecting my df_all_featured
SELECT * 
FROM df_all_featured;

#---------------------------------------------------------------------------------------------------------------------------------#  
#---------------------------------------------------------------------------------------------------------------------------------#  

-- Create a table for 2015 data
CREATE TABLE H2_df_all_featured_2015 AS
SELECT * FROM df_all_featured
WHERE year = 2015;

-- Create a table for 2016 data
CREATE  TABLE H2_df_all_featured_2016 AS
SELECT * FROM df_all_featured
WHERE year = 2016;

-- Create a table for 2017 data
CREATE TABLE H2_df_all_featured_2017 AS
SELECT * FROM df_all_featured
WHERE year = 2017;

#---------------------------------------------------------------------------------------------------------------------------------# 
#---------------------------------------------------------------------------------------------------------------------------------# 

# 2015
-- Step 1: Add the 'Status' column 

ALTER TABLE H2_df_all_featured_2015
ADD COLUMN Status VARCHAR(10);

-- Step 2: Calculate the total count and store the top 5% cutoff in a variable
SELECT FLOOR(0.05 * COUNT(*)) INTO @top_5_percent_cutoff
FROM H2_df_all_featured_2015;


-- Step 3: Update the 'Status' column based on the rank being within the top 5% cutoff
UPDATE H2_df_all_featured_2015
SET Status = IF(overall_rank <= @top_5_percent_cutoff, 'elite', 'non-elite');

CREATE TABLE H2_2015_status_count AS
SELECT Status, COUNT(*)
FROM H2_df_all_featured_2015
GROUP BY Status;

SELECT *
FROM H2_df_all_featured_2015;

#---------------------------------------------------------------------------------------------------------------------------------#  

#  Calculate Split Times Across Checkpoints (2015)
CREATE TABLE H2_2015_5K_split_cumulated AS
SELECT 
    id,
    name,
    Status,
    TIME_TO_SEC(`5K`) AS 5K_cum,
    TIME_TO_SEC(`10K`) AS 10K_cum,
    TIME_TO_SEC(`15K`) AS 15K_cum,
    TIME_TO_SEC(`20K`) AS 20K_cum,
    TIME_TO_SEC(`25K`) AS 25K_cum,
    TIME_TO_SEC(`30K`) AS 30K_cum,
    TIME_TO_SEC(`35K`) AS 35K_cum,
    TIME_TO_SEC(`40K`) AS 40K_cum,
    
    TIME_TO_SEC(`10K`) - TIME_TO_SEC(`5K`) AS split_5K_to_10K,
    TIME_TO_SEC(`15K`) - TIME_TO_SEC(`10K`) AS split_10K_to_15K,
    TIME_TO_SEC(`20K`) - TIME_TO_SEC(`15K`) AS split_15K_to_20K,
    TIME_TO_SEC(`25K`) - TIME_TO_SEC(`20K`) AS split_20K_to_25K,
    TIME_TO_SEC(`30K`) - TIME_TO_SEC(`25K`) AS split_25K_to_30K,
    TIME_TO_SEC(`35K`) - TIME_TO_SEC(`30K`) AS split_30K_to_35K,
    TIME_TO_SEC(`40K`) - TIME_TO_SEC(`35K`) AS split_35K_to_40K
    
FROM 
    H2_df_all_featured_2015
WHERE 
    Status = 'elite' OR Status = 'non-elite';
    
#---------------------------------------------------------------------------------------------------------------------------------#  

# Identify Average Pacing Patterns for Elite and Non-Elite Groups (2015)
CREATE TABLE H2_2015_5K_split_average AS
SELECT 
    Status,
    AVG(split_5K_to_10K) AS avg_split_5K_to_10K,
    AVG(split_10K_to_15K) AS avg_split_10K_to_15K,
    AVG(split_15K_to_20K) AS avg_split_15K_to_20K,
    AVG(split_20K_to_25K) AS avg_split_20K_to_25K,
    AVG(split_25K_to_30K) AS avg_split_25K_to_30K,
    AVG(split_30K_to_35K) AS avg_split_30K_to_35K,
    AVG(split_35K_to_40K) AS avg_split_35K_to_40K
FROM 
    (SELECT 
        Status,
        TIME_TO_SEC(`10K`) - TIME_TO_SEC(`5K`) AS split_5K_to_10K,
        TIME_TO_SEC(`15K`) - TIME_TO_SEC(`10K`) AS split_10K_to_15K,
        TIME_TO_SEC(`20K`) - TIME_TO_SEC(`15K`) AS split_15K_to_20K,
        TIME_TO_SEC(`25K`) - TIME_TO_SEC(`20K`) AS split_20K_to_25K,
        TIME_TO_SEC(`30K`) - TIME_TO_SEC(`25K`) AS split_25K_to_30K,
        TIME_TO_SEC(`35K`) - TIME_TO_SEC(`30K`) AS split_30K_to_35K,
        TIME_TO_SEC(`40K`) - TIME_TO_SEC(`35K`) AS split_35K_to_40K
     FROM 
        H2_df_all_featured_2015
     WHERE 
        Status = 'elite' OR Status = 'non-elite'
    ) AS splits
GROUP BY 
    Status;

#---------------------------------------------------------------------------------------------------------------------------------# 
#---------------------------------------------------------------------------------------------------------------------------------# 

# 2016
-- Step 1: Add the 'Status' column 

ALTER TABLE H2_df_all_featured_2016
ADD COLUMN Status VARCHAR(10);

-- Step 2: Calculate the total count and store the top 5% cutoff in a variable
SELECT FLOOR(0.05 * COUNT(*)) INTO @top_5_percent_cutoff
FROM H2_df_all_featured_2016;


-- Step 3: Update the 'Status' column based on the rank being within the top 5% cutoff
UPDATE H2_df_all_featured_2016
SET Status = IF(overall_rank <= @top_5_percent_cutoff, 'elite', 'non-elite');

CREATE TABLE H2_2016_status_count AS
SELECT Status, COUNT(*)
FROM H2_df_all_featured_2016
GROUP BY Status;

SELECT *
FROM H2_df_all_featured_2016;

#---------------------------------------------------------------------------------------------------------------------------------# 

#  Calculate Split Times Across Checkpoints (2016)

CREATE TABLE H2_2016_5K_split_cumulated AS
SELECT 
    id,
    name,
    Status,
    TIME_TO_SEC(`5K`) AS 5K_cum,
    TIME_TO_SEC(`10K`) AS 10K_cum,
    TIME_TO_SEC(`15K`) AS 15K_cum,
    TIME_TO_SEC(`20K`) AS 20K_cum,
    TIME_TO_SEC(`25K`) AS 25K_cum,
    TIME_TO_SEC(`30K`) AS 30K_cum,
    TIME_TO_SEC(`35K`) AS 35K_cum,
    TIME_TO_SEC(`40K`) AS 40K_cum,
    
    TIME_TO_SEC(`10K`) - TIME_TO_SEC(`5K`) AS split_5K_to_10K,
    TIME_TO_SEC(`15K`) - TIME_TO_SEC(`10K`) AS split_10K_to_15K,
    TIME_TO_SEC(`20K`) - TIME_TO_SEC(`15K`) AS split_15K_to_20K,
    TIME_TO_SEC(`25K`) - TIME_TO_SEC(`20K`) AS split_20K_to_25K,
    TIME_TO_SEC(`30K`) - TIME_TO_SEC(`25K`) AS split_25K_to_30K,
    TIME_TO_SEC(`35K`) - TIME_TO_SEC(`30K`) AS split_30K_to_35K,
    TIME_TO_SEC(`40K`) - TIME_TO_SEC(`35K`) AS split_35K_to_40K
    
FROM 
    H2_df_all_featured_2016
WHERE 
    Status = 'elite' OR Status = 'non-elite';
#---------------------------------------------------------------------------------------------------------------------------------# 

# Identify Average Pacing Patterns for Elite and Non-Elite Groups (2016)
CREATE TABLE H2_2016_5K_split_average AS
SELECT 
    Status,
    AVG(split_5K_to_10K) AS avg_split_5K_to_10K,
    AVG(split_10K_to_15K) AS avg_split_10K_to_15K,
    AVG(split_15K_to_20K) AS avg_split_15K_to_20K,
    AVG(split_20K_to_25K) AS avg_split_20K_to_25K,
    AVG(split_25K_to_30K) AS avg_split_25K_to_30K,
    AVG(split_30K_to_35K) AS avg_split_30K_to_35K,
    AVG(split_35K_to_40K) AS avg_split_35K_to_40K
FROM 
    (SELECT 
        Status,
        TIME_TO_SEC(`10K`) - TIME_TO_SEC(`5K`) AS split_5K_to_10K,
        TIME_TO_SEC(`15K`) - TIME_TO_SEC(`10K`) AS split_10K_to_15K,
        TIME_TO_SEC(`20K`) - TIME_TO_SEC(`15K`) AS split_15K_to_20K,
        TIME_TO_SEC(`25K`) - TIME_TO_SEC(`20K`) AS split_20K_to_25K,
        TIME_TO_SEC(`30K`) - TIME_TO_SEC(`25K`) AS split_25K_to_30K,
        TIME_TO_SEC(`35K`) - TIME_TO_SEC(`30K`) AS split_30K_to_35K,
        TIME_TO_SEC(`40K`) - TIME_TO_SEC(`35K`) AS split_35K_to_40K
     FROM 
        H2_df_all_featured_2016
     WHERE 
        Status = 'elite' OR Status = 'non-elite'
    ) AS splits
GROUP BY 
    Status;
    
#---------------------------------------------------------------------------------------------------------------------------------# 
#---------------------------------------------------------------------------------------------------------------------------------# 

# 2017
-- Step 1: Add the 'Status' column 

ALTER TABLE H2_df_all_featured_2017
ADD COLUMN Status VARCHAR(10);

-- Step 2: Calculate the total count and store the top 5% cutoff in a variable
SELECT FLOOR(0.05 * COUNT(*)) INTO @top_5_percent_cutoff
FROM H2_df_all_featured_2017;


-- Step 3: Update the 'Status' column based on the rank being within the top 5% cutoff
UPDATE H2_df_all_featured_2017
SET Status = IF(overall_rank <= @top_5_percent_cutoff, 'elite', 'non-elite');

CREATE TABLE H2_2017_status_count AS
SELECT Status, COUNT(*)
FROM H2_df_all_featured_2017
GROUP BY Status;

SELECT *
FROM H2_df_all_featured_2017;

#---------------------------------------------------------------------------------------------------------------------------------# 

#  Calculate Split Times Across Checkpoints (2017)

CREATE TABLE H2_2017_5K_split_cumulated AS
SELECT 
    id,
    name,
    Status,
    TIME_TO_SEC(`5K`) AS 5K_cum,
    TIME_TO_SEC(`10K`) AS 10K_cum,
    TIME_TO_SEC(`15K`) AS 15K_cum,
    TIME_TO_SEC(`20K`) AS 20K_cum,
    TIME_TO_SEC(`25K`) AS 25K_cum,
    TIME_TO_SEC(`30K`) AS 30K_cum,
    TIME_TO_SEC(`35K`) AS 35K_cum,
    TIME_TO_SEC(`40K`) AS 40K_cum,
    
    TIME_TO_SEC(`10K`) - TIME_TO_SEC(`5K`) AS split_5K_to_10K,
    TIME_TO_SEC(`15K`) - TIME_TO_SEC(`10K`) AS split_10K_to_15K,
    TIME_TO_SEC(`20K`) - TIME_TO_SEC(`15K`) AS split_15K_to_20K,
    TIME_TO_SEC(`25K`) - TIME_TO_SEC(`20K`) AS split_20K_to_25K,
    TIME_TO_SEC(`30K`) - TIME_TO_SEC(`25K`) AS split_25K_to_30K,
    TIME_TO_SEC(`35K`) - TIME_TO_SEC(`30K`) AS split_30K_to_35K,
    TIME_TO_SEC(`40K`) - TIME_TO_SEC(`35K`) AS split_35K_to_40K
    
FROM 
    H2_df_all_featured_2017
WHERE 
    Status = 'elite' OR Status = 'non-elite';

#---------------------------------------------------------------------------------------------------------------------------------# 

# Identify Average Pacing Patterns for Elite and Non-Elite Groups (2017)
CREATE TABLE H2_2017_5K_split_average AS
SELECT 
    Status,
    AVG(split_5K_to_10K) AS avg_split_5K_to_10K,
    AVG(split_10K_to_15K) AS avg_split_10K_to_15K,
    AVG(split_15K_to_20K) AS avg_split_15K_to_20K,
    AVG(split_20K_to_25K) AS avg_split_20K_to_25K,
    AVG(split_25K_to_30K) AS avg_split_25K_to_30K,
    AVG(split_30K_to_35K) AS avg_split_30K_to_35K,
    AVG(split_35K_to_40K) AS avg_split_35K_to_40K
FROM 
    (SELECT 
        Status,
        TIME_TO_SEC(`10K`) - TIME_TO_SEC(`5K`) AS split_5K_to_10K,
        TIME_TO_SEC(`15K`) - TIME_TO_SEC(`10K`) AS split_10K_to_15K,
        TIME_TO_SEC(`20K`) - TIME_TO_SEC(`15K`) AS split_15K_to_20K,
        TIME_TO_SEC(`25K`) - TIME_TO_SEC(`20K`) AS split_20K_to_25K,
        TIME_TO_SEC(`30K`) - TIME_TO_SEC(`25K`) AS split_25K_to_30K,
        TIME_TO_SEC(`35K`) - TIME_TO_SEC(`30K`) AS split_30K_to_35K,
        TIME_TO_SEC(`40K`) - TIME_TO_SEC(`35K`) AS split_35K_to_40K
     FROM 
        H2_df_all_featured_2017
     WHERE 
        Status = 'elite' OR Status = 'non-elite'
    ) AS splits
GROUP BY 
    Status;
    
    #----------------------------------------------------------------------------------------------------------------------------#
    
