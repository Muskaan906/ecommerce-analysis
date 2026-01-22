-- ============================================
-- Revenue Trends & Growth Analysis
-- ============================================
-- Business Question: How is revenue growing month-over-month?
-- Use Case: Track business performance, identify seasonal patterns
-- Author: Muskaan Sandhu
-- Date: January 2026
-- ============================================

WITH monthly_stats AS (
    SELECT 
        DATE_TRUNC('month', order_purchase_timestamp) as month,
        COUNT(DISTINCT o.order_id) as total_orders,
        ROUND(SUM(payment_value)::NUMERIC, 2) as revenue,
        COUNT(DISTINCT customer_id) as customers
    FROM orders o
    JOIN order_payments op ON o.order_id = op.order_id
    WHERE order_purchase_timestamp IS NOT NULL
    GROUP BY month
)
SELECT 
    TO_CHAR(month, 'YYYY-MM') as month,
    total_orders,
    revenue,
    customers,
    ROUND(((revenue - LAG(revenue) OVER (ORDER BY month)) / 
           LAG(revenue) OVER (ORDER BY month) * 100)::NUMERIC, 2) as revenue_growth_pct,
    ROUND((revenue / total_orders)::NUMERIC, 2) as avg_order_value
FROM monthly_stats
ORDER BY month;