
# E-commerce Analysis - Olist Dataset

## About the Project
This repository documents a 1-week study sprint focused on data analysis, using the public Olist dataset. The goal is to apply and develop skills in SQL, Python, Data Visualization, and generating business insights from raw data.

The project covers everything from initial data exploration and cleaning to customer segmentation (RFM) and communicating the results.

## Data Source
The dataset used is the Brazilian E-Commerce Public Dataset by Olist, available on Kaggle.

## 🚀 Interactive Dashboard
An interactive version of this analysis was developed with Streamlit. It allows for dynamic exploration of customer segments.

### How to Run the Dashboard Locally
Clone this repository.

Install the dependencies: pip install -r requirements.txt

Run the command in your terminal: streamlit run dashboard_rfm.py

## Analysis Performed

The analysis was structured as follows:

* **Day 1: Data Exploration and Cleaning with SQL:** Connecting to Google BigQuery, uploading and initial data cleaning, first exploratory queries with JOINs.

* **Day 2: Customer Segmentation with Advanced SQL:** Building a complete customer table with Recency, Frequency, and Monetary (RFM) metrics and creating the segments.

* **Day 3: Data Manipulation with Python and Pandas:** Migrating the analysis to a Python environment (VS Code with Jupyter Notebooks) for more flexible aggregations and manipulations.

* **Day 4: Data Visualization and Dashboard Development:** Creating charts with Seaborn/Matplotlib and developing an interactive web application with Streamlit to present the results.

## Strategic Insights
The analysis revealed three main points about the customer base:

**The Power of the Minority:** The high-value segments ("Champions" and "Loyal"), although small in number, are responsible for the majority of the revenue, confirming the 80/20 principle.

**The Sleeping Treasure:** A large portion of the customer base is inactive ("At Risk" and "Hibernating"), representing a huge opportunity for reactivation campaigns.

**The Future is in New Customers:** The "New and Promising" segment is the key to future growth, and the main business goal should be to encourage a second purchase from this group.

## Tools and Structure
* **Languages:** SQL (Google BigQuery), Python (Pandas, Matplotlib, Seaborn)

* **Tools:** VS Code, Jupyter Notebook, Streamlit, GitHub

* **/sql/:** Contains the SQL queries for exploration and RFM model creation.

* **analysis_day_03.ipynb:** Notebook with the exploratory analysis and static charts.

* **dash_rfm.py:** Script for the interactive Streamlit application.

