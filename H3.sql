# Selecting my schema
USE Marathon;

# Selecting my df_all_featured
SELECT * 
FROM df_all_featured;

#---------------------------------------------------------------------------------------------------------------------------------# 
# 1. Define Negative Splits and Label Runners
-- Create a table to identify runners with negative splits
CREATE TABLE H3_runner_splits AS
SELECT 
    id,
    year,
    name,
    time AS finish_time,
    -- Calculate the first and second half times
    TIME_TO_SEC(half) AS first_half_time, 
    TIME_TO_SEC(time) - TIME_TO_SEC(half) AS second_half_time,
    -- Determine if they achieved a negative split
    CASE 
        WHEN TIME_TO_SEC(half) > (TIME_TO_SEC(time) - TIME_TO_SEC(half)) THEN 'Negative Split'
        ELSE 'Positive Split'
    END AS split_type
FROM df_all_featured;

SELECT*
FROM H3_runner_splits;

#---------------------------------------------------------------------------------------------------------------------------------# 
# 2. Calculate the average finishing time for each split type
CREATE TABLE H3_time_split_type AS
SELECT 
    split_type,
    AVG(TIME_TO_SEC(finish_time)) AS avg_finish_time
FROM H3_runner_splits
GROUP BY split_type;

SELECT*
FROM H3_time_split_type;

#---------------------------------------------------------------------------------------------------------------------------------# 

# 3. Perform Statistical Comparison - {in Python}


# Since MySQL doesn’t have built-in statistical testing functions, you can export the results to a tool like Python for a t-test or ANOVA
# to statistically confirm if the difference is significant.


#---------------------------------------------------------------------------------------------------------------------------------# 

# 4. Advanced Analysis: Correlate Negative Splits with Ranking


CREATE TABLE H3b_runner_splits AS
SELECT 
    id,
    year,
    overall_rank,
    name,
    time AS finish_time,
    -- Calculate the first and second half times
    TIME_TO_SEC(half) AS first_half_time, 
    TIME_TO_SEC(time) - TIME_TO_SEC(half) AS second_half_time,
    -- Determine if they achieved a negative split
    CASE 
        WHEN TIME_TO_SEC(half) > (TIME_TO_SEC(time) - TIME_TO_SEC(half)) THEN 'Negative Split'
        ELSE 'Positive Split'
    END AS split_type
FROM df_all_featured;

SELECT*
FROM H3b_runner_splits;

#---------------------------------------------------------------------------------------------------------------------------------# 
# 5. Calculate the percentage of runners with negative splits in each ranking bin

CREATE TABLE H3_splits_ranking_bin AS
SELECT 
    CASE 
        WHEN overall_rank <= 1000 THEN '1. Top 1000'
        WHEN overall_rank BETWEEN 1001 AND 5000 THEN '2. Ranking: 1001-5000'
        WHEN overall_rank BETWEEN 5001 AND 10000 THEN '3. Ranking: 5001-10000'
        WHEN overall_rank BETWEEN 10001 AND 15000 THEN '4. Ranking: 10001-15000'
        WHEN overall_rank BETWEEN 15001 AND 20000 THEN '5. Ranking: 15001-20000'
        WHEN overall_rank BETWEEN 20001 AND 25000 THEN '6. Ranking: 20001-25000'
        ELSE '7. Ranking: 25001+'
    END AS ranking_bin,
    -- Calculate total runners in each bin
    COUNT(*) AS total_runners,
    -- Count runners with negative splits in each bin
    SUM(CASE WHEN split_type = 'Negative Split' THEN 1 ELSE 0 END) AS negative_split_count,
    -- Calculate the percentage of runners with negative splits
    ROUND(SUM(CASE WHEN split_type = 'Negative Split' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS percent_negative_split
FROM H3b_runner_splits
GROUP BY ranking_bin
ORDER BY ranking_bin;

#---------------------------------------------------------------------------------------------------------------------------------# 