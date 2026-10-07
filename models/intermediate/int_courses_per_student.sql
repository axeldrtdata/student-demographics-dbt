-- Moves from the enrolment grain to the student grain: number of paths per student.
select
    user_id_hash,
    count(year_started) as number_of_courses
from {{ ref('stg_students') }}
group by user_id_hash
