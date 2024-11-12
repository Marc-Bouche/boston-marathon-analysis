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

# PITCH

> With a degree in Sport Training and a passion for long-distance running, you are driven to launch a company specializing in training programs for marathon runners. Leveraging your academic knowledge and firsthand experience as a dedicated runner, your goal is to design tailored, data-informed training solutions that help runners of all levels reach peak performance. From pacing strategies to personalized endurance plans, your analysis is here to help understand marathon challenges and tailor training programs for athletes.

---

# DATA COLLECTION

1. **Three Kaggle Datasets**: Marathon Boston results for the years 2015, 2016, and 2017.


---

# BUSINESS QUESTION

**"How can we tailor marathon training programs to optimize finish times by understanding key performance factors across checkpoints, demographic influences, and pacing strategies?"**

---
# Hypothesis Overview

---

## H1: Checkpoint Drop-Off - "Hitting the Marathon Wall"
**Hypothesis:** Runners who experience a significant drop in pace between checkpoints are more likely to finish with slower times.

**Definition "Hitting the Marathon Wall":** a condition of sudden fatigue and loss of energy which is caused by the depletion of glycogen stores in the liver and muscles.

**Training Outcome:** If specific runners frequently experience pace drops at these checkpoints, they may benefit from targeted endurance and glycogen management training to sustain energy and reduce the likelihood of "hitting the wall."

**Objective:** Identify runners who experience a substantial drop in pace around the 30K to 35K segment and analyze how this impacts their overall finishing times.

**Data Preparation:** 
- Calculate pace differences between critical checkpoints, with a focus on the 30K to 35K segment.
- Define a threshold for a “significant drop” in pace based on either average or median pace drops for all runners in these segments.
  
**Analysis:** 
- Segment runners into two groups: those with and without significant pace drops in the "wall" segment (30K to 35K).
- Compare the finishing times between these groups and analyze other factors like age and gender to see if certain demographics are more affected by this drop.
- Examine any external conditions (from Data set 2) such as temperature or humidity that may correlate with a higher likelihood of "hitting the wall."
  
**Outcome:** Identify the 30K to 35K checkpoint as a critical area where pace tends to drop significantly, suggesting potential benefit areas for targeted endurance and glycogen management training to improve overall performance.


---

## H2: Top Performer Strategy
**Hypothesis:** Elite runners follow distinct pacing strategies compared to non-elite runners.  
**Training Outcome:** This could be modeled and applied to personalized training.  
**Objective:** Identify distinct pacing strategies among elite runners and explore if these strategies can be used to guide non-elite runners.  
**Data Preparation:** 
- Classify runners as elite or non-elite based on their overall position in Data set 1 (e.g., top 5% of finishers).
- Calculate pacing patterns of elite runners across checkpoints and determine common strategies (e.g., faster starts, steady pace).  
**Analysis:** 
- Compare the pacing patterns of elite and non-elite runners. 
**Outcome:** Identify pacing strategies used by top performers and evaluate their potential effectiveness if adapted for non-elite runners in training.

---

## H3: Improvement Potential
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

## H4: Performance Improvement Over Time
**Hypothesis:** Runners who participated in at least two Boston Marathons between 2015 and 2017 demonstrate significant improvements in pacing and finishing times compared to their initial performance.  
**Training Outcome:** This improvement is influenced by factors such as training adjustments, familiarity with the race conditions, and weather variations.  
**Objective:** Determine if runners who participated in multiple Boston Marathons show measurable improvements in their pacing and finishing times compared to their first race.  
**Data Preparation:** 
- Identify runnerswho participated in at least two Boston Marathons between 2015 and 2017.
- Extract performance metrics, including finishing times and pacing data, for each runner across all marathons.
- Categorize data by initial performance (first marathon) and subsequent performances.
- Calculate the progression using first 
**Analysis:** 
- Use statistical tests (paired t-tests)

---

## H5: Time Prediction
**Hypothesis:**Using demographic, pacing, and checkpoint data, we can predict marathon finish times accurately to help runners set realistic goals and identify training focus areas.

**Training Outcome:**
This model could assist in tailoring training programs to individual runner profiles based on predicted performance outcomes.

**Objective:**
Determine the effectiveness of machine learning models in predicting marathon finish times using a combination of demographic information and pacing data.

**Data Preparation:** 
- From Data set 1, gather demographic data (age, gender, etc.) along with pacing and checkpoint performance data for all runners.
- Identify key features for the machine learning model, such as overall pace, checkpoint times, demographic variables, and any other relevant metrics.
- Split the data into training and testing sets to evaluate model performance.
- Create a ‘time’ bin of minutes. Prediction for second would be specific and very unlikely to get high score.

**Analysis:**
- Implement various machine learning algorithms (e.g., linear regression, random forest, or gradient boosting) to develop models that predict finish times based on the selected features.
- Use cross-validation techniques to assess the robustness of the model and fine-tune hyperparameters for improved accuracy.
- Analyze the model’s predictions against actual finish times to quantify performance and determine the model's effectiveness in helping runners set realistic goals.

**Outcome:**
- Validate whether machine learning can accurately predict marathon finish times, thus providing valuable insights for runners in establishing achievable goals and focusing their training efforts based on predictive outcomes. This could lead to more personalized and effective training programs that cater to individual runner profiles.

---
# Schedule

| **Date**             | **Description**                                       |
|-------------------------|-------------------------------------------------------|
| Day 1 | Topic selection with business and hypothesis question, GitHub repo |
| Day 2 | Topic selection with business and hypothesis question|
| Day 3 | Data import, Data Cleaning (Python)  |
| Day 4 | Data preparation, analysis, and vizualization for H1,H2 (SQL + Tableau) |
| Day 5 | Data preparation, analysis, and vizualization for H3,H4,H5 (SQL + Tableau)|
| Day 6 | Data preparation, analysis, and vizualization for H6  (Python = Tableau)|
| Day 7 | Structuration & Organization of project: cleaning Notebook and MySQL files, update readme.file if any changes  |
| Day 8 | Extra-day, in case any of the previous tasks listed above are not completed |
| Day 9 | Final presenation preparation |
| Day 10 | Final presentation, Github final touch ups |



