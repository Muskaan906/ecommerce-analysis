-- ============================================
-- Customer Segmentation (RFM Analysis)
-- ============================================
-- Business Question: Who are our most valuable customers?
-- Use Case: Targeted marketing, retention strategies
-- Key Metrics: Recency, Frequency, Monetary Value
-- Author: Muskaan Sandhu
-- Date: January 2026
-- ============================================

WITH customer_metrics AS (
    SELECT 
        c.customer_unique_id,
        MAX(o.order_purchase_timestamp) as last_purchase_date,
        COUNT(DISTINCT o.order_id) as total_orders,
        ROUND(SUM(op.payment_value)::NUMERIC, 2) as total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_payments op ON o.order_id = op.order_id
    WHERE o.order_purchase_timestamp IS NOT NULL
    GROUP BY c.customer_unique_id
),
rfm_scores AS (
    SELECT 
        customer_unique_id,
        last_purchase_date,
        total_orders,
        total_spent,
        NTILE(5) OVER (ORDER BY last_purchase_date DESC) as recency_score,
        NTILE(5) OVER (ORDER BY total_orders DESC) as frequency_score,
        NTILE(5) OVER (ORDER BY total_spent DESC) as monetary_score
    FROM customer_metrics
)
SELECT 
    CASE 
        WHEN recency_score >= 4 AND frequency_score >= 4 AND monetary_score >= 4 THEN 'Champions'
        WHEN recency_score >= 3 AND frequency_score >= 3 AND monetary_score >= 3 THEN 'Loyal Customers'
        WHEN recency_score >= 4 AND frequency_score <= 2 AND monetary_score <= 2 THEN 'Promising'
        WHEN recency_score <= 2 AND frequency_score >= 3 AND monetary_score >= 3 THEN 'At Risk'
        WHEN recency_score <= 2 AND frequency_score <= 2 THEN 'Lost'
        WHEN monetary_score >= 4 THEN 'Big Spenders'
        ELSE 'Need Attention'
    END as customer_segment,
    COUNT(*) as customer_count,
    ROUND(AVG(total_spent)::NUMERIC, 2) as avg_customer_value,
    ROUND(SUM(total_spent)::NUMERIC, 2) as segment_revenue,
    ROUND((SUM(total_spent) / (SELECT SUM(total_spent) FROM customer_metrics) * 100)::NUMERIC, 2) as pct_of_revenue
FROM rfm_scores
GROUP BY customer_segment
ORDER BY segment_revenue DESC;