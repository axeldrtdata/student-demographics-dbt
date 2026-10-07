-- Regional population, harmonised with the region labels used in the enrolment data.
-- Corsica is excluded because it does not appear in the student data.
select
    case
        when region = 'Centre-Val-de-Loire' then 'Centre-Val de Loire'
        when region = 'DOM' then 'DROM'
        else region
    end as region,
    population,
    round(100.0 * population / sum(population) over (), 3) as population_share
from {{ ref('population_region_2024') }}
where region != 'Corse'
