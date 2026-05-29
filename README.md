# Berlin Short-Term Rental Market Analysis

This is my data analyst capstone project. I looked at Berlin's short-term
rental market to understand what affects pricing, occupancy, and guest
satisfaction.

I used real Airbnb data for Berlin from Inside Airbnb (September 2025). The
project goes through the normal analyst steps: cleaning the data in Python,
exploring it with charts, answering business questions in SQL, and preparing
KPI tables for a Tableau dashboard.

## The three questions I wanted to answer

1. Which Berlin districts have the best mix of price, occupancy, and guest
   satisfaction?
2. Does room type or host behavior affect pricing and performance?
3. How are superhosts different from non-superhosts?

## The data

The data comes from Inside Airbnb (insideairbnb.com), Berlin, scraped on
2025-09-23. There are three files:

| File          | Rows      | What it is                          |
|---------------|-----------|-------------------------------------|
| listings.csv  | 14,274    | One row per rental listing          |
| calendar.csv  | 5,210,011 | One row per listing per day         |
| reviews.csv   | 635,471   | One row per guest review            |

### Getting the data

The two larger raw files (`calendar.csv.gz` and `reviews.csv.gz`) are not
stored in this repository, because large data files do not belong in version
control. Only the smaller `listings.csv.gz` is included here so the structure
is visible.

To run the project yourself, download the Berlin files from Inside Airbnb at
insideairbnb.com/get-the-data (Berlin section) and place all three in
`data/raw/`:

- `listings.csv.gz` (already included here)
- `calendar.csv.gz`
- `reviews.csv.gz`

The cleaning notebook reads these gzipped files directly and writes cleaned
versions into `data/clean/`. The raw files are never edited.

## Tools

- Python with pandas and matplotlib (cleaning and charts)
- PostgreSQL (SQL business analysis)
- Tableau (KPI dashboard)
- Jupyter Notebook and GitHub

## How the project is organized

```
berlin-short-term-rental-market-analysis/
├── data/
│   ├── raw/        the original Inside Airbnb files
│   └── clean/      cleaned files made by Notebook 1
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_exploratory_data_analysis.ipynb
│   └── 03_kpi_summary.ipynb
├── sql/
│   ├── 01_create_tables.sql
│   └── 02_business_analysis.sql
├── tableau/        the CSV files the dashboard uses
├── outputs/        charts saved from the EDA notebook
├── presentation/   my final findings and presentation script
└── docs/           interview preparation notes
```

## How to run it

Run the notebooks in order:

1. `01_data_cleaning.ipynb` — cleans the data and saves it to `data/clean/`.
2. `02_exploratory_data_analysis.ipynb` — makes the charts in `outputs/`.
3. `03_kpi_summary.ipynb` — makes the KPI tables in `tableau/`.

For the SQL part, load the cleaned files into PostgreSQL and run the two
scripts in `sql/`. For the dashboard, follow the guide in `tableau/`.

## A few things worth knowing

**Occupancy rate** — Inside Airbnb gives an estimated number of nights booked
in the last year. I divided that by 365 to turn it into a percentage. So 25%
means the listing was booked about a quarter of the year.

**Missing prices** — about a third of listings have no nightly price set in
this data. I did not make up prices for them. I added a `has_price` flag and
left them out of the price averages on purpose.

**Price outliers** — a few listings have very high prices (up to €50,000).
For the price averages I only kept prices between €10 and €1,000, so a few
extreme values do not make the average misleading.

## Project Creator

Keston Antonio Schmidtgen
