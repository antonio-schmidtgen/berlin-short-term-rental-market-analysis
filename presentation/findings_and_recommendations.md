# Findings and Recommendations

**Project:** Berlin Short-Term Rental Market Analysis
**Data:** Inside Airbnb Berlin, September 2025 (14,274 listings)
**By:** Antonio Schmidtgen

This document sums up what I found and what I would recommend based on it.

## What I did

I analysed Berlin's short-term rental market to understand pricing, occupancy,
and guest satisfaction. I cleaned the raw Airbnb data in Python, explored it
with charts, answered business questions in SQL, and built KPI tables for a
Tableau dashboard.

## The main numbers

| KPI                    | Value    |
|------------------------|----------|
| Total listings         | 14,274   |
| Average nightly price  | €129     |
| Average occupancy rate | 21.2%    |
| Average review score   | 4.75 / 5 |
| Superhost share        | 24.7%    |

## What I found

### 1. Room type sets the price range

Different room types have very different prices:

- Hotel room: about €211 per night
- Entire home/apartment: about €144
- Private room: about €86
- Shared room: about €48

This means a single city-wide average price is not very useful, because it
mixes very different products together.

### 2. Districts perform differently

Berlin's 12 districts are not the same. Central districts like Mitte have the
highest prices (around €153). Outer districts are cheaper. Occupancy also
changes by district — Pankow and Tempelhof-Schöneberg had the strongest
occupancy, while Neukölln was lower even though its price is mid-range.

So a host should really be compared with similar listings in the same
district, not with the whole city.

### 3. Price on its own does not drive occupancy

When I plotted price against occupancy, the points were spread out widely.
There was no clear pattern where a higher price always means lower occupancy.
Occupancy depends on more than price — location, room type, and host quality
all matter too.

### 4. Superhosts get booked much more

Superhosts had a much higher average occupancy rate than non-superhosts
(about 45% compared to 13%). Their review scores were also a little higher.
This tells me superhost status is connected to real performance, not just a
badge.

### 5. Review scores are high almost everywhere

Most listings have review scores near the top of the scale, and the Berlin
average is 4.75 out of 5. Because nearly everyone scores high, a low score is
easy to spot and is a clear warning sign.

## What I would recommend

**1. Set price benchmarks by district and room type.**
Since price depends a lot on both location and room type, hosts should get a
suggested price range based on similar nearby listings, not one city average.

**2. Help hosts become superhosts.**
Superhosts get booked far more often. Supporting more hosts to reach superhost
level is a realistic way to lift overall performance.

**3. Watch for low-rated listings early.**
Because review scores are high across Berlin, a low score really stands out.
Listings below the city average should be flagged for support before guest
satisfaction drops further.

**4. Always look at price and occupancy together.**
A high price only earns money if the listing actually gets booked. Any host
advice or dashboard should show both numbers side by side.

## What this project shows

This project shows that I can take messy real-world data, clean it carefully,
explore it to find real patterns, answer business questions with SQL, and turn
the results into clear recommendations. I kept everything simple on purpose so
that I can explain every step.

## Market context: regulation

It helps to understand the market these listings operate in. Berlin has one of
the strictest short-term rental laws in Europe, the Zweckentfremdungsverbot.
In short, a host may rent their primary residence for up to 90 days a year, but
only with an official registration number from their district, and renting out
a second apartment short-term is largely banned without a special permit. Fines
can be very high, and from May 2026 new EU rules require platforms like Airbnb
to share host data directly with the authorities.

I did not measure regulation directly in this project, so I treat it as context
rather than a result. But it is a plausible part of the story behind some of my
findings. A tightly regulated market tends to favour professional, compliant,
registered hosts, which may help explain why superhosts are booked so much more
than other hosts. Confirming this would need data on which listings are
registered, which is a clear next step.

## Limitations and next steps

This is one snapshot of the data, so it shows one moment in time, not a trend.
If I had more time I would compare a few quarterly snapshots to see how prices
and occupancy change across the year. I would also look more closely at how
minimum-night rules affect occupancy, and I would bring in data on which
listings are officially registered, to test whether regulation explains the
superhost performance gap.
