const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort = process.argv[2];
const count = process.argv[3];

pool.query(`
  SELECT students.id, students.name AS name, cohorts.name AS cohort_name
    FROM 
      students
      JOIN cohorts ON cohorts.id = students.cohort_id
    WHERE
      cohorts.name LIKE $1
    LIMIT $2;
  `, [`%${cohort}%`, count])
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack));