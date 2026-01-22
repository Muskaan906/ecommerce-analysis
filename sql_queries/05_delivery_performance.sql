-- ============================================
-- Delivery Performance & Customer Satisfaction
-- ============================================
-- Business Question: Are we meeting delivery expectations?
-- Use Case: Logistics optimization, customer satisfaction
-- Author: Muskaan Sandhu
-- Date: January 2026
-- ============================================

WITH delivery_metrics AS (
    SELECT 
        o.order_id,
        o.order_purchase_timestamp,
        o.order_delivered_customer_date,
        o.order_estimated_delivery_date,
        orv.review_score,
        EXTRACT(EPOCH FROM (o.order_delivered_customer_date - o.order_purchase_timestamp)) / 86400 as actual_delivery_days,
        EXTRACT(EPOCH FROM (o.order_estimated_delivery_date - o.order_purchase_timestamp)) / 86400 as estimated_delivery_days,
        CASE 
            WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 1
            ELSE 0
        END as on_time_delivery
    FROM orders o
    LEFT JOIN order_reviews orv ON o.order_id = orv.order_id
    WHERE o.order_delivered_customer_date IS NOT NULL
)
SELECT 
    DATE_TRUNC('month', order_purchase_timestamp)::DATE as month,
    COUNT(*) as total_deliveries,
    SUM(on_time_delivery) as on_time_count,
    ROUND((SUM(on_time_delivery)::NUMERIC / COUNT(*)::NUMERIC * 100), 2) as on_time_percentage,
    ROUND(AVG(actual_delivery_days)::NUMERIC, 2) as avg_actual_days,
    ROUND(AVG(estimated_delivery_days)::NUMERIC, 2) as avg_estimated_days,
    ROUND(AVG(review_score)::NUMERIC, 2) as avg_review_score
FROM delivery_metrics
GROUP BY month
ORDER BY month;