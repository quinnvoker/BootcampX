SELECT name, id, cohort_id
  FROM students
  WHERE end_date IS NULL
  AND start_date IS NOT NULL;