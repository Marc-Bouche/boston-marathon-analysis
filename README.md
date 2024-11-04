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

**"How can customized marathon training programs improve race performance by accounting for demographic, pacing, and weather-related factors?"**

---

# HYPOTHESIS

## H1a (Weather Related): Weather Impact on Pacing Consistency
> *Hypothesis*: Runners experience slower pacing and longer finishing times under adverse weather conditions (e.g., high temperatures, humidity, or wind).
> *Training Outcome*: Tailoring training programs to include sessions in similar conditions may improve resilience and pacing consistency on race day.

---

## H1b (Weather Related): Optimal Weather Conditions
> *Hypothesis*: Runners who participate under mild conditions (e.g., moderate temperatures, low humidity) are more likely to achieve negative splits (faster times in the second half of the race) compared to those running in extreme weather.
> *Training Outcome*: Training programs that simulate ideal weather conditions may yield more substantial performance improvements, particularly for pacing in the latter race stages.

---

## H2: Checkpoint Drop-Off
> *Hypothesis*: Runners who experience a significant time increase between specific checkpoints (e.g., 20K to 25K) are more likely to finish with slower times.
> *Training Outcome*: Targeted endurance training in those segments could improve overall performance.

---

## H3: Demographic Influence
> *Hypothesis*: Age and gender significantly impact pacing and checkpoint times.
> *Training Outcome*: Customized training programs may benefit different demographic groups based on their performance tendencies.

---

## H4: Top Performer Strategy
> *Hypothesis*: Elite runners follow distinct pacing strategies (such as quicker early segments or steady increases) compared to non-elite runners.
> *Training Outcome*: Emulating elite pacing strategies may benefit non-elite runners when applied to personalized training.

---

## H5: Improvement Potential
> *Hypothesis*: Runners who achieve negative splits (faster times in the second half) consistently finish with better overall times.
> *Training Outcome*: Training focused on negative splits could enhance overall performance, particularly in stamina and pacing.

---

## H6: Performance Improvement Over Time
> *Hypothesis*: Runners who participated in at least two Boston Marathons between 2015 and 2017 demonstrate significant improvements in pacing and finishing times compared to their initial performance.
> *Training Outcome*: Improvements influenced by factors like training adjustments, familiarity with race conditions, and weather variations.

---

# ADDITIONAL CONSIDERATIONS

- **Strava API**: Potentially collect additional race features (e.g., elevation data).
- **Data Demographics**: Analyze runner demographics (age, gender) and average finishing times before hypothesis testing.
- **Export Data to SQL**: For efficient querying and analysis.
- **Create Visualizations**: Use Tableau for insightful, interactive visuals.

---

# ANALYSIS FLOW

1. **Preparation**: Data cleaning, merging datasets, and feature engineering.
2. **Analysis**: Conduct statistical tests, regression analysis, and classification models.
3. **Conclusion**: Evaluate hypotheses and document accepted or rejected hypotheses.

---


