-- ============================================================
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
-- A note on two abbreviated column names:
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
--
-- After creating the tables above, load the cleaned CSV files into them.
-- The lines below use psql's \copy command, which reads a CSV file from
-- disk and inserts its rows into a table. "FORMAT csv, HEADER true" tells
-- it the file is a CSV whose first row contains column names.
-- Run these inside psql:
-- ------------------------------------------------------------
-- \copy listings FROM 'data/clean/listings_clean.csv' WITH (FORMAT csv, HEADER true);
-- \copy reviews  FROM 'data/clean/reviews_clean.csv'  WITH (FORMAT csv, HEADER true);

-- Note: the calendar file is very large (5.2 million rows) and is not
-- needed for the SQL business questions, so it is not loaded here.
-- The occupancy analysis uses the occupancy_rate column in the
-- listings table instead.
