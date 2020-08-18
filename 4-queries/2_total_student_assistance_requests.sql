SELECT COUNT(reqs.*) AS total_assistances, name
  FROM
    students
    JOIN assistance_requests reqs ON  students.id = reqs.student_id
  WHERE
    students.name = 'Elliot Dickinson'
  GROUP BY
    students.name;