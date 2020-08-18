SELECT AVG(total_duration) AS average_total_duration
  FROM
    (
      SELECT 
        SUM(reqs.completed_at - reqs.started_at) as total_duration
        FROM  
          assistance_requests AS reqs
          JOIN students ON students.id = reqs.student_id
          JOIN cohorts ON cohorts.id = students.cohort_id
        GROUP BY
          cohorts.name
    ) AS total_durations;