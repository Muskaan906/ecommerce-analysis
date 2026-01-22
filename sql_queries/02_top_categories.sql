-- ============================================
-- Top Product Categories Analysis
-- ============================================
-- Business Question: Which categories drive the most revenue?
-- Use Case: Inventory planning, marketing focus
-- Author: Muskaan Sandhu
-- Date: January 2026
-- ============================================

SELECT 
    COALESCE(pct.product_category_name_english, 'Unknown') as category,
    COUNT(DISTINCT oi.order_id) as total_orders,
    COUNT(DISTINCT oi.product_id) as unique_products,
    ROUND(SUM(oi.price)::NUMERIC, 2) as total_revenue,
    ROUND(AVG(oi.price)::NUMERIC, 2) as avg_price,
    ROUND((SUM(oi.price) / (SELECT SUM(price) FROM order_items) * 100)::NUMERIC, 2) as pct_of_total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN product_category_translation pct 
    ON p.product_category_name = pct.product_category_name
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 15;