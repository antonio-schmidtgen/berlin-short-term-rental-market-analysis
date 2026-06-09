--- ============================================================
-- 02_business_analysis.sql
-- Berlin Short-Term Rental Market Analysis
-------------------------------------------

-- These queries answer the three project questions using SQL.
-- ============================================================

-- ============================================================
-- QUERY 1 — Market size: listings by district
-- A simple starting point for understanding the Berlin market.
-- ============================================================

SELECT
    neighbourhood_group_cleansed AS district,
    COUNT(*) AS total_listings
FROM listings
GROUP BY neighbourhood_group_cleansed
ORDER BY total_listings DESC;


-- ============================================================
-- QUERY 2 — Average price by room type
-- Uses only listings with a price and removes extreme values
-- to keep the averages realistic.
-- ============================================================
SELECT
    room_type,
    COUNT(*) AS listings_with_price,
    ROUND(AVG(price), 0) AS avg_nightly_price
FROM listings
WHERE has_price = true
  AND price BETWEEN 10 AND 1000
GROUP BY room_type
ORDER BY avg_nightly_price DESC;


-- ============================================================
-- QUERY 3 — District performance summary
-- Combines price, occupancy, and review score for each district.
-- ============================================================

SELECT
    neighbourhood_group_cleansed AS district,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 0) AS avg_nightly_price,
    ROUND(AVG(occupancy_rate), 1) AS avg_occupancy_rate,
    ROUND(AVG(review_scores_rating), 2) AS avg_review_score
FROM listings
WHERE has_price = true
  AND price BETWEEN 10 AND 1000
GROUP BY neighbourhood_group_cleansed
ORDER BY avg_occupancy_rate DESC;


-- ============================================================
-- QUERY 4 — Superhost vs non-superhost comparison
-- Compares price, occupancy, and review score between the two
-- host groups.
-- ============================================================

SELECT
    host_is_superhost,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 0) AS avg_nightly_price,
    ROUND(AVG(occupancy_rate), 1) AS avg_occupancy_rate,
    ROUND(AVG(review_scores_rating), 2) AS avg_review_score
FROM listings
WHERE has_price = true
  AND price BETWEEN 10 AND 1000
GROUP BY host_is_superhost
ORDER BY avg_occupancy_rate DESC;


-- ============================================================
-- QUERY 5 — Top districts by estimated yearly revenue
-- Compares districts using total estimated revenue.
-- The column estimated_revenue_l365d contains Inside Airbnb's
-- estimate for the last 365 days.
-- ============================================================

SELECT
    neighbourhood_group_cleansed AS district,
    COUNT(*) AS total_listings,
    ROUND(SUM(estimated_revenue_l365d), 0) AS total_estimated_revenue,
    ROUND(AVG(estimated_revenue_l365d), 0) AS avg_estimated_revenue
FROM listings
GROUP BY neighbourhood_group_cleansed
ORDER BY total_estimated_revenue DESC;


-- ============================================================
-- QUERY 6 — Review activity by listing
-- Counts how many reviews each listing received by combining
-- the listings and reviews tables.
-- Only the 15 most-reviewed listings are shown.
-- ============================================================

SELECT
    l.id AS listing_id,
    l.name AS listing_name,
    l.neighbourhood_group_cleansed AS district,
    l.room_type,
    COUNT(r.id) AS review_count
FROM listings AS l
JOIN reviews AS r
    ON l.id = r.listing_id
GROUP BY l.id, l.name, l.neighbourhood_group_cleansed, l.room_type
ORDER BY review_count DESC
LIMIT 15;


-- ============================================================
-- QUERY 7 — Recent review activity by district
-- Counts reviews written from 2024 onwards to show where
-- guest activity has been highest recently.
-- ============================================================

SELECT
    l.neighbourhood_group_cleansed AS district,
    COUNT(r.id) AS reviews_since_2024
FROM listings AS l
JOIN reviews AS r
    ON l.id = r.listing_id
WHERE r.review_year >= 2024
GROUP BY l.neighbourhood_group_cleansed
ORDER BY reviews_since_2024 DESC;
