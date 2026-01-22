-- ============================================
-- Seller Performance Analysis
-- ============================================
-- Business Question: Which sellers are top performers?
-- Use Case: Seller partnerships, quality control
-- Author: Muskaan Sandhu
-- Date: January 2026
-- ============================================

SELECT 
    s.seller_id,
    s.seller_city,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) as total_orders,
    ROUND(SUM(oi.price)::NUMERIC, 2) as total_revenue,
    ROUND(AVG(oi.price)::NUMERIC, 2) as avg_order_value,
    ROUND(AVG(COALESCE(orv.review_score, 0))::NUMERIC, 2) as avg_review_score,
    COUNT(DISTINCT oi.product_id) as products_sold
FROM sellers s
JOIN order_items oi ON s.seller_id = oi.seller_id
LEFT JOIN order_reviews orv ON oi.order_id = orv.order_id
GROUP BY s.seller_id, s.seller_city, s.seller_state
HAVING COUNT(DISTINCT oi.order_id) >= 50  -- Sellers with 50+ orders
ORDER BY total_revenue DESC
LIMIT 20;