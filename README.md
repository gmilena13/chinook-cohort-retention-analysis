# Chinook Music Store - Customer Cohort Retention Analysis

## Project Overview
This project performs an advanced **cohort retention analysis** on the **Chinook** digital music store database using **SQL**. The goal is to group customers by their first-purchase month and track their recurring activity over subsequent months, measuring customer retention rates and identifying long-term engagement patterns[cite: 4, 5].

## Technical Implementation & SQL Methodology
The query utilizes advanced SQL concepts to structure, calculate, and format the retention matrix[cite: 4]:
* **First Purchase Identification (CTE):** Isolates each customer's acquisition month using `MIN(InvoiceDate)`.
* **Cohort Indexing (CTE):** Calculates the relative time distance in months (`DATEDIFF`) between a customer's first purchase and subsequent transactions.
* **Aggregation (CTE):** Groups active clients by cohort month and return month using `COUNT(DISTINCT CustomerId)`.
* **Window Functions:** Computes the baseline cohort size dynamically using `MAX(clients) OVER (PARTITION BY first_month_order)` to evaluate relative retention percentages.
* **Formatting:** Formats retention rates cleanly into percentage structures (`P2`).

## Business Recommendations & Strategic Actions
Based on the cohort retention findings, the following three strategic initiatives are proposed to boost customer lifetime value (LTV) and combat churn:
* **Mystery Box Campaign:** Implement a special-priced Mystery Box targeted specifically at customers who have not placed any orders in the last 3 months to re-engage dormant accounts.
* **Tiered Loyalty Club:** Launch a loyalty program with progressive discount tiers (Bronze 10%, Silver 25%, Gold 50%, Premium 70%) to reward repeat buyers and encourage higher retention.
* **Personalized Recommendations System:** Build a recommendation engine leveraging historical purchase data to display tailored product suggestions and drive cross-selling.

## Tools & Concepts Used
* **Database:** Chinook Database (Relational SQLite/SQL Server)
* **Advanced SQL Techniques:** CTEs, Window Functions (`PARTITION BY`), Date Functions (`DATEDIFF`, `FORMAT`), Aggregations, Distinct Counts.
