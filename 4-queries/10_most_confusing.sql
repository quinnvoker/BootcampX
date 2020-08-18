SELECT
  assignments.id,
  assignments.name,
  assignments.day,
  assignments.chapter,
  COUNT(reqs.*) AS total_requests
  FROM
    assignments
    JOIN assistance_requests reqs ON assignments.id = reqs.assignment_id
  GROUP BY
    assignments.id, assignments.name, assignments.day, assignments.chapter
  ORDER BY
    total_requests DESC;
  