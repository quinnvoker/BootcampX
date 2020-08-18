SELECT 
  teachers.name as teacher, 
  students.name as student,
  assignments.name as assignment,
  (reqs.completed_at - reqs.started_at) as duration
  FROM  
    assistance_requests AS reqs
    JOIN students ON students.id = reqs.student_id
    JOIN teachers ON teachers.id = reqs.teacher_id
    JOIN assignments ON assignments.id = reqs.assignment_id
  ORDER BY
    duration;