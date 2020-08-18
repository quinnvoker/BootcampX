SELECT COUNT(reqs.*) as total_assistances, teachers.name
  FROM
    teachers
    JOIN assistance_requests reqs ON teachers.id = reqs.teacher_id
  WHERE
    teachers.name = 'Waylon Boehm'
  GROUP BY teachers.name;
