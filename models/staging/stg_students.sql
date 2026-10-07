-- One row per enrolment. Identifiers are pseudonymised with SHA-256 (GDPR),
-- missing genders are made explicit as 'unknown' instead of being dropped.
select
    {{ hash_id("replace(user_id, '-', '')") }} as user_id_hash,
    {{ hash_id("replace(user_id, '-', '') || '_' || year_path_started") }} as primary_key,
    path_category_name as category,
    age_group,
    coalesce(gender, 'unknown') as gender,
    region,
    year_path_started as year_started
from {{ source('openclassrooms', 'students') }}
