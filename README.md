<div align="center">
  <h1 style="color: #4CAF50; font-size: 3em; font-family: Arial, sans-serif;">
     <b>Boston Marathon Athletes Performance Analysis</b> 
  </h1>
</div>

## 🌐 Links
- ### [**🌐 Kaggle**](https://www.kaggle.com/datasets/rojour/boston-results)
- ### [**📂 GitHub: Final Project**](https://github.com/Marc-Bouche/final-project)
- ### [**🗨️ Presentation**](https://docs.google.com/presentation/d/1h-ykC9EjER1dtvpqKTz3Wb-pNkcOA2AqpSpj7C4jCyI/edit#slide=id.p)

---

## 📁 Github Structure  
- **`README.md`**: Describes what the project is and how it is structured.  
- **`Code.ipynb`**: Coding file that contains data import, cleaning, and wrangling, hypothesis with statistical tests.  
- **`.gitignore`**: Irrelevant, deleted, or draft files that were used during the project but are not part of the final commit.  
- **`function.py`**: Contains all the functions present in `Code.ipynb`.  
- **{Folder} `.csv` files**: Contains all CSV files used for the analysis.  
- **{Folder} `.sql` files**: Contains all SQL files used for the analysis.  
- **{Folder} `hyper_and_twb_files`**: Contains Tableau files.

---

## 📊 Tableau
- #### [**Demographic visualization**](https://public.tableau.com/app/profile/marc.bouche/viz/Boston_Marathon_Demorgraphics/DemographicInsights)
- #### [**Hypotheses visualization**](https://public.tableau.com/app/profile/marc.bouche/viz/Boston_Marathon_Performance_Analysis/Story2)

---

## 🎯 Pitch
> With a degree in Sport Training and a passion for long-distance running, you are driven to launch a company specializing in training programs for marathon runners. Leveraging your academic knowledge and firsthand experience as a dedicated runner, your goal is to design tailored, data-informed training solutions that help runners of all levels reach peak performance. From pacing strategies to personalized endurance plans, your analysis is here to help understand marathon challenges and tailor training programs for athletes.

---

## 📈 Data collection
**Three Kaggle Datasets**: Marathon Boston results for the years 2015, 2016, and 2017.

---

## ❓ Business Question
**"How can we tailor marathon training programs to optimize finish times by understanding key performance factors across checkpoints, demographic influences, and pacing strategies?"**

---

## 📚 Hypotheses & Content Overview  

### H1: Checkpoint Drop-Off - *"Hitting the Marathon Wall"*
- **Hypothesis:** Runners who experience a significant drop in pace between checkpoints are more likely to finish with slower times.  
- **Training Outcome:** Targeted endurance and glycogen management training to sustain energy and reduce pace drops.  
- **Objective:** Identify runners with substantial pace drops (30K–35K segment) and analyze the impact on finishing times.  
- **Data Preparation:**  
  - Calculate pace differences between critical checkpoints.  
  - Define a threshold for a “significant drop.”  
- **Analysis:**  
  - Segment runners into groups with/without significant pace drops.  
  - Compare finishing times and demographics.  
- **Outcome:** Pinpoint key checkpoints for pace drops and their demographic impact.

---

### H2: Top Performer Strategy
- **Hypothesis:** Elite runners follow distinct pacing strategies compared to non-elite runners.  
- **Training Outcome:** Develop personalized training models for non-elite runners.  
- **Objective:** Analyze pacing patterns of elite runners (top 5% of finishers) and their adaptability to other runners.  
- **Data Preparation:**  
  - Classify runners as elite or non-elite.  
  - Compare pacing patterns.  
- **Outcome:** Identify effective pacing strategies.

---

### H3: Improvement Potential
- **Hypothesis:** Runners achieving negative splits (faster second half) consistently finish faster.  
- **Training Outcome:** Focus on pacing adjustments and stamina training.  
- **Objective:** Evaluate the correlation between negative splits and overall finishing times.  
- **Data Preparation:**  
  - Identify negative split runners.  
  - Categorize finishing times.  
- **Outcome:** Validate the effectiveness of negative split strategies.

---

### H4: Performance Improvement Over Time
- **Hypothesis:** Runners participating in multiple Boston Marathons show measurable improvements in performance.  
- **Training Outcome:** Insights into training adaptations and race familiarity.  
- **Objective:** Analyze performance metrics over multiple races.  
- **Data Preparation:**  
  - Identify repeat participants.  
  - Compare pacing and finishing times across races.  
- **Outcome:** Highlight improvement trends and influencing factors.

---

### H5: Time Prediction
- **Hypothesis:** Demographics, pacing, and checkpoint data can predict marathon finish times.  
- **Training Outcome:** Tailored training programs based on predictive outcomes.  
- **Objective:** Evaluate machine learning models for predicting finish times.  
- **Data Preparation:**  
  - Extract demographic, pacing, and checkpoint data.  
  - Train models with selected features..
- **Analysis:**  
  - Use ML algorithms (e.g., linear regression, random forest).  
- **Outcome:** Accurate predictions to guide training efforts.

---

## 🗓️ Schedule  

| **Date**             | **Description**                                       |
|-----------------------|-------------------------------------------------------|
| **Day 1**            | Topic selection with business and hypothesis question; GitHub repo setup. |
| **Day 2**            | Data import, cleaning (Python).                       |
| **Day 3**            | Exploratory Data Analysis (EDA) using SQL & Python.   |
| **Day 4–7**          | Data preparation & hypothesis testing (H1–H5).        |
| **Day 8**            | Visualizations in Tableau; final presentation prep.   |
| **Day 9**            | Final corrections; complete presentation slides.      |
| **Day 10**           | Final presentation and GitHub polish.                 |
