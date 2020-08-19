const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort = process.argv[2];

pool.query(`
  SELECT
    DISTINCT teachers.name as teacher,
    cohorts.name as cohort
    FROM
      teachers
      JOIN assistance_requests reqs ON teachers.id = reqs.teacher_id
      JOIN students ON students.id = reqs.student_id
      JOIN cohorts ON cohorts.id = students.cohort_id
    WHERE
      cohorts.name = $1
    GROUP BY
      teachers.name, cohorts.name;
  `, [cohort])
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.cohort}: ${row.teacher}`);
    });
  });