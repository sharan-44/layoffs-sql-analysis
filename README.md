This project analyzes global tech layoffs using SQL for data cleaning and exploratory analysis, and Excel for visualizations. It is designed as a beginner-friendly yet structured portfolio project for aspiring data analysts.

---

## 📂 Project Structure

layoffs-sql-analysis/
├── data_cleaning.sql # Full SQL data cleaning process
├── layoffs_eda.sql # Exploratory data analysis queries
├── layoffs_dashboard.xlsx # Excel visualizations
├── README.md # Project documentation
└── screenshots/ # (Optional) chart images

---

## 🛠 Tools Used

- **MySQL**: Data cleaning, transformation, and EDA
- **Excel**: Visualizations for final presentation
- **GitHub**: Version control and portfolio hosting

---

## 🔧 Skills Demonstrated

- SQL: joins, CTEs, window functions, aggregations
- Data Cleaning: standardizing fields, filling nulls
- Data Analysis: trend breakdown by company, industry, year
- Visualization: Excel (Power BI planned)

---

## 🧹 Step 1: Data Cleaning (`data_cleaning.sql`)

- Removed duplicates using `ROW_NUMBER() OVER (PARTITION BY ...)`
- Trimmed whitespace in text fields
- Standardized inconsistent values (e.g. “United States.” → “United States”)
- Converted `date` column to proper `DATE` format
- Filled in missing industry data using self-joins
- Removed rows with null layoff info

---

## 📊 Step 2: Exploratory Data Analysis (`layoffs_eda.sql`)

- Created new `layoff_severity` classification column
- Analyzed:
  - Max total layoffs
  - Companies with full layoffs (100%)
  - Layoffs grouped by **Company**, **Industry**, **Country**, and **Year**
  - Monthly and rolling trends using `WINDOW FUNCTIONS`
  - Top 5 companies with most layoffs each year using `DENSE_RANK()`

---

## 📈 Step 3: Excel Dashboard (`layoffs_dashboard.xlsx`)

Visualized key insights from SQL queries using Excel:

1. **Top 10 Companies by Layoffs** (Bar Chart)
2. **Layoffs by Industry** (Column Chart)
3. **Rolling Monthly Layoff Trend** (Line Chart)

---

## 🧠 Key Takeaways

### 💼 How This Analysis Helps HR & Business Teams

This project provides data-driven insights that HR and executive teams can use to:

- 📉 **Identify Layoff Patterns**: Spot trends across industries, companies, and time periods to understand when and where large-scale layoffs are happening.
- 🧠 **Benchmark Against Industry Peers**: See how a company's layoff numbers compare with competitors in the same sector.
- 📅 **Understand Economic Impact**: Rolling monthly analysis reveals layoff spikes during downturns, enabling proactive decisions.
- 📌 **Support Workforce Planning**: Helps HR and leadership with hiring freezes, restructuring, or reallocation of resources.
- 📊 **Communicate with Stakeholders**: Visual summaries make complex data easy to share with leadership and decision-makers.

---

### 📊 Analytical & Technical Insights

- SQL is powerful for cleaning messy real-world datasets
- Window functions like `ROW_NUMBER()` and `DENSE_RANK()` provide deeper comparative insights
- Rolling trends and yearly rankings uncover long-term patterns
- Visuals created in Excel can be effective even without Power BI or Tableau (which is planned next)


---

## 📸 Screenshots

![Top Companies](screenshots/top_companies.png)
![Industry Layoffs](screenshots/industry_layoffs.png)
![Monthly Trends](screenshots/monthly_trends.png)

---

## ✅ What's Next?

This project will be extended with:
- Power BI or Tableau dashboards
- Web scraping or API-based dataset
- Additional predictive modeling (optional)

---

## 📚 Dataset & Tutorial Reference

- 📊 **Dataset Source**: [Layoffs.fyi Layoff Tracker](https://layoffs.fyi/)
- 🎥 **Tutorial Inspiration**: This project was guided by a SQL analysis tutorial on YouTube by [Alex The Analyst](https://www.youtube.com/watch?v=LaWp_Kq0cKs)

*This project was built for learning purposes and enhanced with additional steps like Power BI/Excel visuals and custom insights.*

---

## 💼 About Me

Aspiring Data Analyst with a focus on practical SQL projects, dashboarding, and end-to-end data storytelling.

 [📧 Email](g.sharankumar26@gmail.com)
