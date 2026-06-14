# Customer Segmentation using RFM Analysis (MySQL)

## Overview

This project implements RFM (Recency, Frequency, Monetary) Analysis using MySQL to segment customers based on purchasing behavior.

The objective is to identify:

* VIP Customers
* Loyal Customers
* At-Risk Customers
* Lost Customers

using transactional retail data.

---

## Dataset

Online Retail Dataset

* 541,909 transaction records
* E-commerce customer purchase history
* Includes invoice details, quantities, prices, customer IDs, and countries

---

## Project Workflow

Raw Data → Data Cleaning → Order Aggregation → RFM Metrics → Customer Scoring → Customer Segmentation → Business Insights

---

## SQL Concepts Used

* CREATE TABLE
* LOAD DATA INFILE
* Data Cleaning
* Aggregations
* GROUP BY
* CASE WHEN
* CTEs
* Window Functions (NTILE)
* DATEDIFF
* STR_TO_DATE
* Views

---

## Customer Segments

| Segment | Description                                          |
| ------- | ---------------------------------------------------- |
| VIP     | Recent, frequent, and high-spending customers        |
| Loyal   | Regular customers with strong engagement             |
| At-Risk | Previously active customers showing reduced activity |
| Lost    | Customers with low engagement and spending           |

---

## Key Insights

* Identified high-value customer segments.
* Measured revenue contribution by segment.
* Detected customers at risk of churn.
* Generated actionable retention insights.

---

## Technologies

* MySQL 8
* MySQL Workbench
* Git & GitHub

---

## Author

Built as part of a MySQL Portfolio Project Series.
