# Selecting my schema
USE Marathon;

# Selecting my df_all_featured
SELECT * 
FROM df_all_featured;

#---------------------------------------------------------------------------------------------------------------------------------#  
# 1. Time for 5K on second half of race (km20 to km40)

CREATE TABLE H1_1_time_5k_split AS
SELECT
    id,
    name,
    gender,
    
    -- Calculate time from 20K to 25K
    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 60), ':',
        LPAD(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) % 60, 2, '0')
    ) AS time_20_25,

    -- Calculate time from 25K to 30K
    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 60), ':',
        LPAD(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) % 60, 2, '0')
    ) AS time_25_30,

    -- Calculate time from 30K to 35K
    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 60), ':',
        LPAD(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) % 60, 2, '0')
    ) AS time_30_35,

    -- Calculate time from 35K to 40K
    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 60), ':',
        LPAD(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) % 60, 2, '0')
    ) AS time_35_40
FROM
    df_all_featured;
#---------------------------------------------------------------------------------------------------------------------------------#
# 2. Pace for 5k on second half of race (km20 to km40)

CREATE TABLE H1_2_pace_5k_split AS
SELECT
    id,
    name,
    gender,

    -- Calculate pace from 20K to 25K (minutes per kilometer)
    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5 / 60), ':',  -- Minutes per km
        LPAD(FLOOR((TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5) % 60), 2, '0') -- Seconds per km
    ) AS pace_kmh_20_25,

    -- Calculate pace from 25K to 30K (minutes per kilometer)
    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5 / 60), ':',  -- Minutes per km
        LPAD(FLOOR((TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5) % 60), 2, '0') -- Seconds per km
    ) AS pace_kmh_25_30,

    -- Calculate pace from 30K to 35K (minutes per kilometer)
    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5 / 60), ':',  -- Minutes per km
        LPAD(FLOOR((TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5) % 60), 2, '0') -- Seconds per km
    ) AS pace_kmh_30_35,

    -- Calculate pace from 35K to 40K (minutes per kilometer)
    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5 / 60), ':',  -- Minutes per km
        LPAD(FLOOR((TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5) % 60), 2, '0') -- Seconds per km
    ) AS pace_kmh_35_40

FROM
    df_all_featured;

#---------------------------------------------------------------------------------------------------------------------------------#
# 3. Pace Classification: 'Steady Pace' or 'Signicant Drop' for 5K on second half of race (km20 to km40)

CREATE TABLE H1_3_pace_classification AS
SELECT 
    
    id,
    name,
    gender,

    -- Original pace calculations (converted to seconds per kilometer)
    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5 / 60), ':', 
        LPAD(FLOOR((TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5) % 60), 2, '0')
    ) AS pace_kmh_20_25,

    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5 / 60), ':', 
        LPAD(FLOOR((TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5) % 60), 2, '0')
    ) AS pace_kmh_25_30,

    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5 / 60), ':', 
        LPAD(FLOOR((TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5) % 60), 2, '0')
    ) AS pace_kmh_30_35,

    CONCAT(
        FLOOR(TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5 / 60), ':', 
        LPAD(FLOOR((TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5) % 60), 2, '0')
    ) AS pace_kmh_35_40,

    -- Significant Drop Logic (10% worse pace between segments)
    CASE 
        WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5) >= 
             (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5 * 1.1)
        THEN 'Significant Drop'
        ELSE 'Steady Pace'
    END AS pace_classification_20_25,

    CASE 
        WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5) >= 
             (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5 * 1.1)
        THEN 'Significant Drop'
        ELSE 'Steady Pace'
    END AS pace_classification_25_30,

    CASE 
        WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5) >= 
             (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5 * 1.1)
        THEN 'Significant Drop'
        ELSE 'Steady Pace'
    END AS pace_classification_30_35
    FROM df_all_featured;

#---------------------------------------------------------------------------------------------------------------------------------#
# 4. Classification count per 5k segment

CREATE TABLE H1_4_classification_count AS
SELECT
    '20K-25K' AS segment,
    COUNT(CASE WHEN pace_classification_20_25 = 'Significant Drop' THEN 1 END) AS significant_drop_20_25

FROM 
    (SELECT 
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_classification_20_25

    FROM df_all_featured) AS pace_data

UNION ALL

SELECT 
    '25K-30K' AS segment,
    COUNT(CASE WHEN pace_classification_25_30 = 'Significant Drop' THEN 1 END) AS significant_drop_25_30

FROM 
    (SELECT 
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_classification_25_30

    FROM df_all_featured) AS pace_data

UNION ALL

SELECT 
    '30K-35K' AS segment,
    COUNT(CASE WHEN pace_classification_30_35 = 'Significant Drop' THEN 1 END) AS significant_drop_30_35

FROM 
    (SELECT 
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_classification_30_35

    FROM df_all_featured) AS pace_data;
    
#---------------------------------------------------------------------------------------------------------------------------------#

# 5. Analyze Impact on Finishing Times by Segment
# Now, group runners based on significant drops in each segment and compare their finishing times. 
# This will allow you to see if there’s a consistent correlation between segment-specific drops and overall finishing times.

CREATE TABLE H1_5_pace_classification_finishing_time AS
SELECT
    segment,
    pace_category,
    COUNT(*) AS runner_count,
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(STR_TO_DATE(`time`, '%H:%i:%s')))), '%H:%i:%s') AS avg_finishing_time  -- Average finishing time in HH:MM:SS
FROM (
    SELECT 
        id,
        name,
        gender,
        `time`,
        
        '20K-25K' AS segment,
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_category
    FROM df_all_featured

    UNION ALL
    
    SELECT 
        id,
        name,
        gender,
        `time`,
        
        '25K-30K' AS segment,
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_category
    FROM df_all_featured

    UNION ALL

    SELECT 
        id,
        name,
        gender,
        `time`,
        
        '30K-35K' AS segment,
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_category
    FROM df_all_featured
) AS pace_data

GROUP BY segment, pace_category;

#---------------------------------------------------------------------------------------------------------------------------------#

# 6.Analyze Impact on Finishing Times by Segment with Demographic Insights (Age and Gender)

CREATE TABLE H1_6_demographic_insights AS
SELECT
    segment,
    pace_category,
    gender,
    age_group,  -- Use the existing age_group column for binning
    COUNT(*) AS runner_count,
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(STR_TO_DATE(`time`, '%H:%i:%s')))), '%H:%i:%s') AS avg_finishing_time  -- Average finishing time in HH:MM:SS
FROM (
    SELECT 
        id,
        name,
        gender,
        age_group,
        `time`,
        
        '20K-25K' AS segment,
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_category
    FROM df_all_featured

    UNION ALL
    
    SELECT 
        id,
        name,
        gender,
        age_group,
        `time`,
        
        '25K-30K' AS segment,
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_category
    FROM df_all_featured

    UNION ALL
    
    SELECT 
        id,
        name,
        gender,
        age_group,
        `time`,
        
        '30K-35K' AS segment,
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_category
    FROM df_all_featured
) AS pace_data
GROUP BY segment, pace_category, gender, age_group
ORDER BY segment, pace_category, gender, age_group;

#---------------------------------------------------------------------------------------------------------------------------------#

# 7: Analyze Impact on Finishing Times by Segment, Include Runners with No 'Significant Drop', and Those with At Least One 'Significant Drop'

CREATE TABLE H1_7_all_segments_comparaison AS
SELECT
    segment,
    pace_category,
    COUNT(*) AS runner_count,
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(STR_TO_DATE(`time`, '%H:%i:%s')))), '%H:%i:%s') AS avg_finishing_time  -- Average finishing time in HH:MM:SS
FROM (
    -- Step 4.1: Segment-specific classifications based on "Significant Drop" or "Steady Pace"
    SELECT 
        id,
        `time`,
        
        '20K-25K' AS segment,
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_category
    FROM df_all_featured

    UNION ALL
    
    SELECT 
        id,
        `time`,
        
        '25K-30K' AS segment,
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_category
    FROM df_all_featured

    UNION ALL
    
    SELECT 
        id,
        `time`,
        
        '30K-35K' AS segment,
        CASE 
            WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5) >= 
                 (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5 * 1.1)
            THEN 'Significant Drop'
            ELSE 'Steady Pace'
        END AS pace_category
    FROM df_all_featured
) AS pace_data
GROUP BY segment, pace_category

UNION ALL

-- Step 7.2: Calculate the average finishing time for runners with no "Significant Drop" in any segment

SELECT
    'All Segments' AS segment,
    'No Significant Drop' AS pace_category,
    COUNT(*) AS runner_count,
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(STR_TO_DATE(`time`, '%H:%i:%s')))), '%H:%i:%s') AS avg_finishing_time
FROM df_all_featured
WHERE id NOT IN (
    SELECT DISTINCT id
    FROM (
        SELECT 
            id,
            CASE 
                WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5) >= 
                     (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5 * 1.1)
                THEN 'Significant Drop'
            END AS pace_category_20_25,
            CASE 
                WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5) >= 
                     (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5 * 1.1)
                THEN 'Significant Drop'
            END AS pace_category_25_30,
            CASE 
                WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5) >= 
                     (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5 * 1.1)
                THEN 'Significant Drop'
            END AS pace_category_30_35
        FROM df_all_featured
    ) AS all_pace_categories
    WHERE pace_category_20_25 = 'Significant Drop' OR pace_category_25_30 = 'Significant Drop' OR pace_category_30_35 = 'Significant Drop'
)

UNION ALL

-- Step 7.3: Calculate the average finishing time for runners with at least one "Significant Drop" in any segment
SELECT
    'All Segments' AS segment,
    'At Least One Significant Drop' AS pace_category,
    COUNT(*) AS runner_count,
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(STR_TO_DATE(`time`, '%H:%i:%s')))), '%H:%i:%s') AS avg_finishing_time
FROM df_all_featured
WHERE id IN (
    SELECT DISTINCT id
    FROM (
        SELECT 
            id,
            CASE 
                WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5) >= 
                     (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`20K`, '%H:%i:%s'), STR_TO_DATE(`25K`, '%H:%i:%s')) / 5 * 1.1)
                THEN 'Significant Drop'
            END AS pace_category_20_25,
            CASE 
                WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5) >= 
                     (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`25K`, '%H:%i:%s'), STR_TO_DATE(`30K`, '%H:%i:%s')) / 5 * 1.1)
                THEN 'Significant Drop'
            END AS pace_category_25_30,
            CASE 
                WHEN (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`35K`, '%H:%i:%s'), STR_TO_DATE(`40K`, '%H:%i:%s')) / 5) >= 
                     (TIMESTAMPDIFF(SECOND, STR_TO_DATE(`30K`, '%H:%i:%s'), STR_TO_DATE(`35K`, '%H:%i:%s')) / 5 * 1.1)
                THEN 'Significant Drop'
            END AS pace_category_30_35
        FROM df_all_featured
    ) AS all_pace_categories
    WHERE pace_category_20_25 = 'Significant Drop' OR pace_category_25_30 = 'Significant Drop' OR pace_category_30_35 = 'Significant Drop'
);

#---------------------------------------------------------------------------------------------------------------------------------#