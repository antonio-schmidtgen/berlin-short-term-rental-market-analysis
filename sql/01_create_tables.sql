--- ============================================================
-- 01_create_tables.sql
-- Berlin Short-Term Rental Market Analysis
--
-- This script creates the tables for the project in PostgreSQL.
-- After creating them, load the cleaned CSV files from data/clean/
-- into these tables (for example with the \copy command in psql).
-- ============================================================


-- ------------------------------------------------------------
-- Table 1: listings
-- One row per rental listing. This is the main table.
--
-- Two column names use abbreviations:
--   number_of_reviews_ltm     "ltm" means "last twelve months".
--   estimated_occupancy_l365d "l365d" means "last 365 days".
-- ------------------------------------------------------------
DROP TABLE IF EXISTS listings;

CREATE TABLE listings (
    id                          BIGINT PRIMARY KEY,
    name                        TEXT,
    host_id                     BIGINT,
    host_is_superhost           TEXT,
    neighbourhood_cleansed      TEXT,
    neighbourhood_group_cleansed TEXT,
    latitude                    NUMERIC,
    longitude                   NUMERIC,
    property_type               TEXT,
    room_type                   TEXT,
    accommodates                INTEGER,
    bedrooms                    NUMERIC,
    beds                        NUMERIC,
    price                       NUMERIC,
    minimum_nights              INTEGER,
    availability_365            INTEGER,
    number_of_reviews           INTEGER,
    number_of_reviews_ltm       INTEGER,
    estimated_occupancy_l365d   INTEGER,
    estimated_revenue_l365d     NUMERIC,
    review_scores_rating        NUMERIC,
    review_scores_cleanliness   NUMERIC,
    review_scores_location      NUMERIC,
    review_scores_value         NUMERIC,
    reviews_per_month           NUMERIC,
    instant_bookable            TEXT,
    has_price                   BOOLEAN,
    occupancy_rate              NUMERIC
);


-- ------------------------------------------------------------
-- Table 2: reviews
-- One row per guest review. Linked to listings by listing_id.
-- ------------------------------------------------------------
DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
    listing_id      BIGINT,
    id              BIGINT,
    date            DATE,
    reviewer_id     BIGINT,
    reviewer_name   TEXT,
    comments        TEXT,
    review_year     INTEGER
);


-- ------------------------------------------------------------
-- Loading the data

-- After creating the tables above, load the cleaned CSV files into them.
-- Run these commands inside psql:

---

-- \copy listings FROM 'data/clean/listings_clean.csv' WITH (FORMAT csv, HEADER true);
-- \copy reviews  FROM 'data/clean/reviews_clean.csv'  WITH (FORMAT csv, HEADER true);

-- Note: the calendar file is very large (5.2 million rows), so it is
-- not loaded here. Occupancy analysis uses the occupancy_rate column
-- in the listings table instead.

