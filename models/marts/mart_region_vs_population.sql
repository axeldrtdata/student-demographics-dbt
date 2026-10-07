-- Compares each region's share of students with its share of the French population.
-- ratio > 1: over-represented, ratio < 1: under-represented.
select
    s.year_started,
    s.region,
    s.share_per_year as student_share,
    p.population_share,
    round(s.share_per_year / nullif(p.population_share, 0), 2) as representation_ratio
from {{ ref('mart_region_share_by_year') }} s
left join {{ ref('stg_population_region_2024') }} p on s.region = p.region
