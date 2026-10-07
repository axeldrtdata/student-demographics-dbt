-- Enrolments by year and region, with each region's share of the year (each year sums to 100%).
select
    year_started,
    region,
    count(*) as enrolments,
    sum(count(*)) over (partition by year_started) as total_per_year,
    round(100.0 * count(*) / sum(count(*)) over (partition by year_started), 3) as share_per_year
from {{ ref('stg_students') }}
group by year_started, region
