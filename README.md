# 🏦 Bank Loan Portfolio & Risk Performance Analysis

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-PostgreSQL%2FMySQL-blue?style=for-the-badge&logo=postgresql&logoColor=white)
![Excel](https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)

An end-to-end financial data analytics and risk modeling project evaluating **38,500+ loan records** to monitor lending health, credit risk metrics, repayment cash flows, and borrower profiles using **SQL queries, Microsoft Excel, and interactive Power BI dashboards**.

---

## 🎯 Project Overview & Objectives
The primary objective of this project is to provide executive banking stakeholders with actionable visibility into loan portfolio health, borrower creditworthiness, and default risk trends.

### Core Business Questions Addressed:
1. **Portfolio Health:** What is the total volume of funded loans vs. repayments received?
2. **Credit Risk & Default Rates:** What percentage of total loans are classified as "Good Loans" (Fully Paid / Current) vs. "Bad Loans" (Charged Off / Defaulted)?
3. **Borrower Risk Profiling:** How do debt-to-income (DTI) ratios, annual income levels, and employment tenure correlate with default probability?
4. **Geographic & Purpose Trends:** Which loan purposes (e.g., debt consolidation, home improvement, small business) and geographic regions carry the highest lending volume?

---

## 📈 Key Performance Indicators (KPIs)

| Metric | Overall Value | Month-to-Date (MTD) |
| :--- | :--- | :--- |
| **Total Loan Applications** | **38,576** | **4,314** |
| **Total Funded Amount** | **$435.76M** | **$53.98M** |
| **Total Cash Received** | **$473.07M** | **$58.07M** |
| **Average Interest Rate** | **12.05%** | **12.36%** |
| **Average Debt-to-Income (DTI)** | **13.33%** | **13.67%** |

### 🟢 Good Loan vs. 🔴 Bad Loan Breakdown:
* **Good Loan Applications:** **86.18%** (33,243 applications | $370.22M funded | $412.34M received)
* **Bad Loan Applications:** **13.82%** (5,333 applications | $65.54M funded | $60.73M received)

---

## 🔍 Key Findings & Business Insights
* **Low Default Majority:** Over **86%** of loan portfolios are performing well, generating net positive interest income.
* **Top Loan Purpose:** **Debt Consolidation** represents the largest single loan purpose (**over 48% of total volume**), followed by credit card refinancing.
* **Tenure Stability:** Borrowers with **10+ years of employment** show significantly higher repayment reliability compared to those with under 2 years of tenure.
* **Term Preference:** **36-month loan terms** account for **73.2%** of all originations and demonstrate lower default rates compared to 60-month terms.

---

## 🛠️ Technology Stack & Workflow
* **SQL:** Data cleaning, financial KPI calculations, conditional aggregations (`CASE WHEN`), Month-over-Month (MoM) growth queries (`bank_loan_sql_queries.sql`).
* **Microsoft Excel (Power Query & XLOOKUP):** Data validation, categorical risk banding, and formula verification (`financial_loan.csv`).
* **Power BI:** Data modeling, custom DAX measures, time-intelligence functions, multi-page report design (`bank_loan_analysis.pbix`).

---

## 📂 Repository Structure
```text
├── bank_loan_analysis.pbix                      <-- Interactive Power BI Dashboard
├── bank_loan_sql_queries.sql                    <-- SQL Financial Extraction Scripts
├── financial_loan.csv                           <-- Raw Loan Transaction Dataset
├── bank_loan_dashboard_report.pdf               <-- Exported PDF Dashboard Report
├── Details.jpg                                  <-- Dashboard Preview (Details View)
├── Overview.jpg                                 <-- Dashboard Preview (Overview View)
├── Synopsis.jpg                                 <-- Dashboard Preview (Summary View)
└── README.md                                    <-- Project Documentation & Insights
```

---

## 💻 Sample SQL KPI Script

```sql
-- Calculate Good Loan vs Bad Loan Performance
SELECT
    CASE 
        WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good Loan'
        ELSE 'Bad Loan'
    END AS loan_category,
    COUNT(id) AS total_applications,
    ROUND(SUM(loan_amount), 2) AS total_funded_amount,
    ROUND(SUM(total_payment), 2) AS total_received_amount,
    ROUND(AVG(int_rate * 100), 2) AS avg_interest_rate_pct,
    ROUND(AVG(dti * 100), 2) AS avg_dti_pct
FROM financial_loan
GROUP BY 
    CASE 
        WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good Loan'
        ELSE 'Bad Loan'
    END;
```

---

## 🚀 How to Run This Project
1. **SQL Database:** Import `financial_loan.csv` into PostgreSQL, MySQL, or SQL Server and run `bank_loan_sql_queries.sql`.
2. **Power BI Desktop:** Open `Bank Loan Performance Power BI Project.pbix` to interact with the KPI cards, slicers, and charts.

---

---

## 👤 Author
Developed and maintained by **[shishir0x](https://github.com/shishir0x)**.

---
*License: MIT License*
