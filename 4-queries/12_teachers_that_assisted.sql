SELECT
  DISTINCT teachers.name as teacher,
  cohorts.name as cohort
  FROM
    teachers
    JOIN assistance_requests reqs ON teachers.id = reqs.teacher_id
    JOIN students ON students.id = reqs.student_id
    JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE
    cohorts.name = 'JUL02'
  GROUP BY
    teachers.name, cohorts.name;
  