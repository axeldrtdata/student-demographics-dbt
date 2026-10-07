-- Final consolidated dataset: one row per enrolment, pseudonymised, enriched with INSEE data.
-- This is the table exported as data/consolidated_dataset.csv.
select
    s.user_id_hash,
    s.primary_key,
    s.gender,
    s.category,
    s.year_started,
    s.age_group,
    s.region,
    p.population as population_2024,
    p.population_share as population_share_2024,
    u.unemployment_rate as unemployment_rate_2024
from {{ ref('stg_students') }} s
left join {{ ref('stg_population_region_2024') }} p on s.region = p.region
left join {{ ref('stg_unemployment_region_2024') }} u on s.region = u.region
