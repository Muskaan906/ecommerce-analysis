# E-Commerce Business Analysis

**Author:** Muskaan Sandhu  
**Date:** January 2026  
**Tools Used:** PostgreSQL, Excel, Tableau Public

[![Tableau](https://img.shields.io/badge/Tableau-Public-E97627?logo=tableau)](https://public.tableau.com/app/profile/muskaan.sandhu/viz/E-CommerceBusinessAnalysis-MuskaanSandhu/ExecutiveSummary)
## TL;DR 

- Analyzed **100K+ e-commerce transactions** using SQL  
- Identified **customer segments driving disproportionate revenue**  
- Flagged **operational delivery issues** impacting customer satisfaction  
- Translated analysis into **actionable retention and marketing strategies**  
- Built **executive-facing dashboards** in Tableau  

## 📊 Project Overview

Comprehensive analysis of **100,000+ e-commerce transactions** from Brazilian marketplace Olist, identifying revenue trends, customer segmentation opportunities, and operational improvements.

**Business Impact:**
- Identified $4.76M revenue opportunity in "Need Attention" customer segment
- Discovered 26% revenue concentration in top 3 product categories
- Highlighted delivery performance issues requiring investigation (78% on-time rate in Q1 2018)

---

## 🎯 Key Findings

### Revenue Performance
- **Total Revenue:** $16.0M across 99,441 orders
- **Peak Month:** November 2017 ($1.19M) - holiday season surge
- **Growth:** 300%+ growth from launch to peak

### Customer Insights  
- **30%** of customers ("Need Attention" segment) generate highest revenue
- **Champions:** 15,701 highly engaged customers (16% of base)
- **At Risk:** 33% of customer base needs retention efforts

### Product Strategy
- **Top Category:** Health & Beauty ($1.26M, 9.3% of revenue)
- **Top 3 Categories:** Account for 26% of total revenue
- **Recommendation:** Focus marketing investments here

### Operations
- **On-Time Delivery:** 93% average across all periods
- **Issue Identified:** Feb-Mar 2018 drop to 78-84% (investigation needed)

---

## 🛠️ Technical Skills Demonstrated

### SQL (PostgreSQL)
- Complex multi-table JOINs (8+ tables)
- Window functions (LAG, NTILE, ROW_NUMBER)
- Common Table Expressions (CTEs)
- Advanced aggregations and GROUP BY
- Date/time functions for trend analysis

### Excel
- Pivot tables and data analysis
- Dynamic formulas (SUM, AVERAGE, calculations)
- Professional charts (line, bar, pie)
- Data visualization and formatting
- Executive dashboard creation

### Tableau
- Interactive dashboards published to Tableau Public
- KPI cards and metric visualization
- Time series analysis with trend lines
- Customer segmentation visuals
- Product performance treemaps

---

## 📁 Repository Structure
```
├── sql_queries/          # 5 analytical SQL queries
├── images/              # Tableau dashboard screenshots
└── README.md            # Project documentation
```

---

## 🔍 Analysis Deep Dive

### 1. Revenue Trends Analysis
**SQL Query:** `01_revenue_trends.sql`

Analyzed monthly revenue patterns revealing:
- Seasonal spikes in November-December
- Consistent $160-170 average order value
- Strong YoY growth until data cutoff

**Key Insight:** Holiday season drives 50%+ revenue increase

### 2. Product Category Performance
**SQL Query:** `02_top_categories.sql`

Identified top-performing categories:
- Health & Beauty leads at $1.26M
- Watches & Gifts close second at $1.21M
- Long tail of 15+ categories analyzed

**Recommendation:** Double down on top 3 categories for marketing ROI

### 3. Customer Segmentation (RFM)
**SQL Query:** `03_customer_segmentation.sql`

Used RFM methodology to segment customers:
- **Recency:** How recently they purchased
- **Frequency:** How often they purchase  
- **Monetary:** How much they spend

**Result:** 7 distinct segments with targeted strategies for each

### 4. Seller Performance
**SQL Query:** `04_seller_performance.sql`

Analyzed top 20 sellers by revenue:
- Geographic concentration in São Paulo state
- Top seller: $229K revenue from 1,132 orders
- Strong review scores (3.3-4.4 average)

### 5. Delivery & Operations
**SQL Query:** `05_delivery_performance.sql`

Tracked operational efficiency:
- 93% average on-time delivery
- Strong correlation between on-time delivery and customer satisfaction
- Identified Q1 2018 performance dip

---

## 📈 Tableau Dashboards

**🔗 [View Interactive Dashboards on Tableau Public](https://public.tableau.com/app/profile/muskaan.sandhu/viz/E-CommerceBusinessAnalysis-MuskaanSandhu/ExecutiveSummary)**

### Dashboard 1: Executive Summary
- Total Revenue, Orders, Average Order Value KPI cards
- Revenue trend line showing growth trajectory
- High-level business performance at a glance

### Dashboard 2: Customer Analytics
- Customer segment distribution (pie chart)
- Revenue by segment (bar chart)
- RFM segmentation insights and recommendations

### Dashboard 3: Product Performance
- Revenue by category (bar chart and treemap)
- Category comparison and market share
- Product portfolio optimization insights

---

## 💡 Business Recommendations

### Immediate Actions (0-3 months)
1. **Launch retention campaign** targeting "At Risk" customers (21,615 customers, $1.54M at stake)
2. **Investigate Q1 2018 delivery issues** - identify root cause of 78-84% on-time rate
3. **Increase marketing budget** for Health & Beauty and Watches/Gifts by 20%

### Medium-term Initiatives (3-6 months)
4. **Implement loyalty program** for the Champions segment to increase lifetime value
5. **Partner more closely with top 10 São Paulo sellers** (represent 40% of revenue)
6. **Expand product mix** in underperforming categories or discontinue low performers

### Long-term Strategy (6-12 months)
7. **Build predictive model** for customer churn using historical data
8. **Geographic expansion** to underrepresented states
9. **Seasonal inventory planning** based on Nov-Dec surge patterns

---

## 🚀 How to Reproduce This Analysis

### Prerequisites
- PostgreSQL 14+
- Tableau Public (free)
- Excel or Google Sheets

### Steps
1. **Download dataset:** [Brazilian E-Commerce Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
2. **Set up database:**
```sql
   CREATE DATABASE ecommerce_analysis;
   -- Import CSV files to tables
```
3. **Run SQL queries:** Execute files in `sql_queries/` folder
4. **Analyze in Excel:** Import CSV results, create charts and pivot tables
5. **Visualize in Tableau:** Connect CSVs, build interactive dashboards

**Detailed setup instructions available in repository files.**

---

## 📊 Dataset Information

**Source:** Olist - Brazilian E-Commerce Public Dataset  
**Period:** September 2016 - October 2018  
**Records:** 
- 99,441 orders
- 112,650 order items
- 96,096 customers
- 3,095 sellers

**Tables Used:**
- `customers` - Customer information and location
- `orders` - Order details and timestamps
- `order_items` - Products within each order
- `order_payments` - Payment information
- `products` - Product catalogue
- `sellers` - Seller information and location
- `order_reviews` - Customer reviews and ratings
- `product_category_translation` - Category names in English

---

## 📫 Connect With Me

**Muskaan Sandhu**  
📍 San Francisco Bay Area | 🎓 Computer Science, UBC Okanagan (4.0 GPA)  
💼 Seeking Business Analyst / Data Analyst roles | Available Summer 2025

- **Email:** muskaan.sandhu906@gmail.com  

---

## 📝 Project Context

This project was created to demonstrate end-to-end data analysis capabilities for Business Analyst and Data Analyst positions. It showcases:

✅ SQL proficiency with complex queries and database design  
✅ Data analysis and insight generation from real-world datasets  
✅ Business acumen and strategic thinking  
✅ Data visualization and storytelling with Tableau  
✅ Excel analysis and professional reporting  
✅ Technical documentation and communication skills  

**What makes this project unique:**
- Real dataset with 100K+ transactions (not synthetic data)
- Complete workflow from database setup to executive presentation
- Actionable business recommendations backed by data
- Professional-grade visualizations and documentation

---

**License:** This project is for portfolio and educational purposes. Dataset provided by Olist via Kaggle under Creative Commons license.
