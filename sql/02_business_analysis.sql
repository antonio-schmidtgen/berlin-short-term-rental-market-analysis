-- ============================================================
-- 02_business_analysis.sql
-- Berlin Short-Term Rental Market Analysis
--
-- These queries answer the three project business questions using
-- beginner/intermediate SQL only: SELECT, JOIN, WHERE, GROUP BY,
-- ORDER BY, COUNT, AVG, SUM.
-- ============================================================


-- ============================================================
-- QUERY 1 — Market size: how many listings per district?
-- A simple starting point to understand the Berlin market.
-- ============================================================
SELECT
    neighbourhood_group_cleansed AS district,
    COUNT(*) AS total_listings
FROM listings
GROUP BY neighbourhood_group_cleansed
ORDER BY total_listings DESC;


-- ============================================================
-- QUERY 2 — Average price by room type
-- Only uses listings that have a price, and removes extreme
-- prices so the average is realistic.
-- Supports business question 2 (does room type affect pricing).
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
-- Brings price, occupancy, and review score together for each
-- district. This is the core query for business question 1.
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
-- Compares the two host groups on price, occupancy, and review
-- score. This answers business question 3.
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
-- Uses SUM to see which districts generate the most estimated
-- revenue in total. Supports marketplace performance analysis.
-- The column estimated_revenue_l365d holds Inside Airbnb's
-- estimated revenue over the last 365 days ("l365d").
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
-- QUERY 6 — Review activity by listing (JOIN example)
-- Joins listings and reviews to count how many reviews each
-- listing received. This shows a basic JOIN and GROUP BY.
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
-- QUERY 7 — Recent review activity by district (JOIN + WHERE)
-- Counts reviews written from 2024 onwards, grouped by district.
-- This shows where guest activity has been highest recently.
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
