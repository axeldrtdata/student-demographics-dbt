-- Regional unemployment rate (2024 average). Corsica excluded, overseas regions not available.
select
    region,
    unemployment_rate
from {{ ref('unemployment_region_2024') }}
where region != 'Corse'
