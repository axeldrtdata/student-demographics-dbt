-- Compares each region's share of students with its unemployment rate.
-- Overseas regions have no unemployment rate for the full year and stay empty.
select
    s.year_started,
    s.region,
    s.share_per_year as student_share,
    u.unemployment_rate
from {{ ref('mart_region_share_by_year') }} s
left join {{ ref('stg_unemployment_region_2024') }} u on s.region = u.region
