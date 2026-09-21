-- ====================================================================
-- Bank Loan Portfolio & Risk Performance Analytics
-- Author: Shishir Pandey
-- Portfolio: https://shishirpandey085.com.np
-- GitHub: https://github.com/shishir085
-- Database: PostgreSQL / MySQL / SQL Server Compatible
-- ====================================================================

-- 1. Executive Summary KPIs

-- Total Loan Applications
SELECT COUNT(id) AS Total_Loan_Applications 
FROM financial_loan;

-- Month-to-Date (MTD) Total Loan Applications (Month 12)
SELECT COUNT(id) AS MTD_Total_Loan_Applications 
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- Total Funded Amount
SELECT ROUND(SUM(loan_amount), 2) AS Total_Funded_Amount 
FROM financial_loan;

-- MTD Total Funded Amount
SELECT ROUND(SUM(loan_amount), 2) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- Total Amount Received (Cash Flow Repayments)
SELECT ROUND(SUM(total_payment), 2) AS Total_Amount_Received 
FROM financial_loan;

-- Average Interest Rate
SELECT ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate_Pct 
FROM financial_loan;

-- Average Debt-to-Income (DTI) Ratio
SELECT ROUND(AVG(dti) * 100, 2) AS Avg_DTI_Pct 
FROM financial_loan;


-- 2. Good Loan vs. Bad Loan KPI Breakdown

-- Good Loan Application Percentage
SELECT
    ROUND((COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN id END) * 100.0) / 
    COUNT(id), 2) AS Good_Loan_Pct
FROM financial_loan;

-- Good Loan Applications, Funded Amount & Received Amount
SELECT
    COUNT(id) AS Good_Loan_Applications,
    ROUND(SUM(loan_amount), 2) AS Good_Loan_Funded_Amount,
    ROUND(SUM(total_payment), 2) AS Good_Loan_Received_Amount
FROM financial_loan
WHERE loan_status IN ('Fully Paid', 'Current');

-- Bad Loan Application Percentage
SELECT
    ROUND((COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
    COUNT(id), 2) AS Bad_Loan_Pct
FROM financial_loan;

-- Bad Loan Applications, Funded Amount & Received Amount
SELECT
    COUNT(id) AS Bad_Loan_Applications,
    ROUND(SUM(loan_amount), 2) AS Bad_Loan_Funded_Amount,
    ROUND(SUM(total_payment), 2) AS Bad_Loan_Received_Amount
FROM financial_loan
WHERE loan_status = 'Charged Off';


-- 3. Loan Status Grid Summary
SELECT
    loan_status,
    COUNT(id) AS Total_Applications,
    ROUND(SUM(loan_amount), 2) AS Total_Funded_Amount,
    ROUND(SUM(total_payment), 2) AS Total_Received_Amount,
    ROUND(AVG(int_rate * 100), 2) AS Avg_Interest_Rate,
    ROUND(AVG(dti * 100), 2) AS Avg_DTI
FROM financial_loan
GROUP BY loan_status;


-- 4. Monthly Lending Trends
SELECT 
    MONTH(issue_date) AS Month_Number, 
    DATENAME(MONTH, issue_date) AS Month_Name, 
    COUNT(id) AS Total_Loan_Applications,
    ROUND(SUM(loan_amount), 2) AS Total_Funded_Amount,
    ROUND(SUM(total_payment), 2) AS Total_Received_Amount
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);


-- 5. Regional / State-by-State Lending Analysis
SELECT 
    address_state AS State, 
    COUNT(id) AS Total_Loan_Applications,
    ROUND(SUM(loan_amount), 2) AS Total_Funded_Amount,
    ROUND(SUM(total_payment), 2) AS Total_Received_Amount
FROM financial_loan
GROUP BY address_state
ORDER BY Total_Funded_Amount DESC;


-- 6. Loan Term & Employee Tenure Distribution
SELECT 
    term AS Loan_Term, 
    COUNT(id) AS Total_Loan_Applications,
    ROUND(SUM(loan_amount), 2) AS Total_Funded_Amount,
    ROUND(SUM(total_payment), 2) AS Total_Received_Amount
FROM financial_loan
GROUP BY term
ORDER BY term;

SELECT 
    emp_length AS Employee_Length, 
    COUNT(id) AS Total_Loan_Applications,
    ROUND(SUM(loan_amount), 2) AS Total_Funded_Amount,
    ROUND(SUM(total_payment), 2) AS Total_Received_Amount
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length;
