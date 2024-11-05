<div align="center">
  <h1 style="color: #4CAF50; font-size: 3em; font-family: Arial, sans-serif;">
    ~ <b>Boston Marathon | Final Project</b> ~
  </h1>
</div>


## Links
- ### [**🌐 Kaggle**](https://www.kaggle.com/datasets/rojour/boston-results)
- ### [**📘 Student Portal | Guideline**](https://my.ironhack.com/cohorts/64f9d71d3689ad002ac79d8b/lms/courses/course-v1:IRONHACK+DAFT4+202409_BER/modules/ironhack-course-chapter_8/units/ironhack-course-chapter_8-sequential-vertical_2)
- ### [**📂 GitHub: Final Project**](https://github.com/Marc-Bouche/final-project)
- ### [**🗨️ Presentation**](https://docs.google.com/presentation/d/1h-ykC9EjER1dtvpqKTz3Wb-pNkcOA2AqpSpj7C4jCyI/edit#slide=id.p)
- ### [**🌤️ API Open-Meteo**](https://open-meteo.com/en/docs#hourly=temperature_2m,relative_humidity_2m,dew_point_2m,apparent_temperature,precipitation_probability,precipitation,rain,showers,pressure_msl,surface_pressure,cloud_cover,cloud_cover_low,cloud_cover_mid,cloud_cover_high,visibility,evapotranspiration,wind_speed_10m,wind_direction_10m,wind_gusts_10m,soil_temperature_0cm,soil_moisture_0_to_1cm,is_day&location_mode=csv_coordinates&csv_coordinates=42.355007,++-71.12906&forecast_days=1&forecast_hours=12)

# PITCH

> With a degree in Sport Training and a passion for long-distance running, you are driven to launch a company specializing in training programs for marathon runners. Leveraging your academic knowledge and firsthand experience as a dedicated runner, your goal is to design tailored, data-informed training solutions that help runners of all levels reach peak performance. From pacing strategies to personalized endurance plans, your programs will empower athletes to tackle marathon challenges and achieve new personal bests.

---

# DATA COLLECTION

1. **Kaggle Datasets**: Marathon Boston results for the years 2015, 2016, and 2017.
2. **Weather APIs**: (OpenWeatherMap, Weatherstack)
   - **Purpose**: Weather conditions play a significant role in marathon performance. Using weather data (temperature, humidity, wind) for race days could help analyze performance relative to environmental factors.
   - **Use**: By analyzing historical race data alongside weather patterns, you could predict optimal pacing adjustments for different weather scenarios and tailor training to prepare runners for diverse conditions.

---

# BUSINESS QUESTION

**"How can we tailor marathon training programs to optimize finish times by understanding key performance factors across checkpoints, demographic influences, and pacing strategies?"**

---
# Hypotheses Overview

## H1: Demographic Influence
**Hypothesis:** Age and gender significantly impact pacing and checkpoint times.  
**Training Outcome:** This suggests a need for customized training programs for different demographic groups.  
**Objective:** Determine how demographic factors (age, gender) affect pacing and checkpoint times, guiding customized training for different groups.  
**Data Preparation:** 
- Group runners in Data set 1 by age and gender.
- Calculate average paces at each checkpoint and overall finishing times for each group.  
**Analysis:** 
- Compare pacing patterns and finishing times across different demographics.
- Use statistical tests (e.g., ANOVA or t-tests) to identify significant differences in performance based on age and gender.  
**Outcome:** Establish if and how age and gender impact performance, providing a basis for personalized training programs for different demographics.

---

## H2: Checkpoint Drop-Off
**Hypothesis:** Runners who experience a significant time increase between specific checkpoints (e.g., 20K to 25K) are more likely to finish with slower times.  
**Training Outcome:** This indicates that targeted endurance training in those segments could improve overall performance.  
**Objective:** Identify if a large increase in time between specific checkpoints indicates a lower overall performance.  
**Data Preparation:** 
- Calculate time differences between critical checkpoints in Data set 1, focusing on the 20K to 25K segment.
- Define a threshold for what constitutes a “significant time increase” based on average or median time differences.  
**Analysis:** 
- Segment runners into groups with and without significant time increases and compare their finishing times.
- Analyze if there are specific weather conditions at these checkpoints (from Data set 2) that correlate with increased drop-offs.  
**Outcome:** Identify checkpoints where pacing tends to drop, suggesting sections where targeted endurance training may benefit runners experiencing performance decreases.

---

## H3: Top Performer Strategy
**Hypothesis:** Elite runners follow distinct pacing strategies (such as quicker early segments or steady increases) compared to non-elite runners.  
**Training Outcome:** This could be modeled and applied to personalized training.  
**Objective:** Identify distinct pacing strategies among elite runners and explore if these strategies can be used to guide non-elite runners.  
**Data Preparation:** 
- Classify runners as elite or non-elite based on their overall position in Data set 1 (e.g., top 5% of finishers).
- Calculate pacing patterns of elite runners across checkpoints and determine common strategies (e.g., faster starts, steady pace).  
**Analysis:** 
- Compare the pacing patterns of elite and non-elite runners.
- Test if emulating elite pacing strategies is feasible and beneficial for non-elite runners.  
**Outcome:** Identify pacing strategies used by top performers and evaluate their potential effectiveness if adapted for non-elite runners in training.

---

## H4: Improvement Potential
**Hypothesis:** Runners who achieve negative splits (faster times in the second half) consistently finish with better overall times.  
**Training Outcome:** This highlights a strategy for pacing adjustments and stamina training.  
**Objective:** Determine if runners with negative splits (faster in the second half) consistently finish with better times.  
**Data Preparation:** 
- Identify runners who achieved negative splits in Data set 1 by comparing first and second-half times.
- Calculate and categorize finishing times for runners with and without negative splits.  
**Analysis:** 
- Perform statistical comparisons to confirm if negative splits correlate with faster overall times.
- Investigate if weather conditions (from Data set 2) impact the likelihood of achieving negative splits.  
**Outcome:** Validate if training for negative splits improves performance, justifying a training focus on endurance and pacing consistency in the second half of races.

---

## H5: Performance Improvement Over Time
**Hypothesis:** Runners who participated in at least two Boston Marathons between 2015 and 2017 demonstrate significant improvements in pacing and finishing times compared to their initial performance.  
**Training Outcome:** This improvement is influenced by factors such as training adjustments, familiarity with the race conditions, and weather variations.  
**Objective:** Determine if runners who participated in multiple Boston Marathons show measurable improvements in their pacing and finishing times compared to their first race.  
**Data Preparation:** 
- Identify runners in Data set 1 who participated in at least two Boston Marathons between 2015 and 2017.
- Extract performance metrics, including finishing times and pacing data, for each runner across all marathons.
- Categorize data by initial performance (first marathon) and subsequent performances.  
**Analysis:** 
- Use statistical tests (e.g., paired t-tests or ANOVA)


---

| **Date**             | **Description**                                       |
|-------------------------|-------------------------------------------------------|
| Day 1 | Topic selection with business and hypothesis question, GitHub repo |
| Day 2 | Topic selection with business and hypothesis question|
| Day 3 | Data import, Data Cleaning  |
| Day 4 | Data preparation, analysis, and vizualization for H1,H2 (SQL + Tableau) |
| Day 5 | Data preparation, analysis, and vizualization for H3,H4,H5 (SQL + Tableau)|
| Day 6 | Data preparation, analysis, and vizualization for H6  (Python = Tableau)|
| Day 7 | Structuration & Organization of project: cleaning Notebook and MySQL files, update readme.file if any changes  |
| Day 8 | Extra-day, in case any of the previous tasks listed above are not completed |
| Day 9 | Final presenation preparation |
| Day 10 | Final presentation, Github final touch ups |



