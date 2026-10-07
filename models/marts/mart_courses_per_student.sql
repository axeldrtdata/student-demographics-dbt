-- Distribution of students by number of paths followed (re-enrolment).
select
    number_of_courses,
    count(user_id_hash) as students
from {{ ref('int_courses_per_student') }}
group by number_of_courses
