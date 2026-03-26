const express = require('express');
const mysql = require('mysql');
const app = express();
const port = 3000;

// Hardcoded secret for POC
const dbPassword = 'SuperSecret123';

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: dbPassword,
  database: 'testdb'
});

app.use(express.json());

// Vulnerable SQL injection endpoint
app.post('/login', (req, res) => {
  const { username, password } = req.body;
  const query = `SELECT * FROM users WHERE username = '${username}' AND password = '${password}'`;
  connection.query(query, (err, results) => {
    if (err) return res.status(500).send('DB error');
    if (results.length > 0) {
      res.send('Login successful');
    } else {
      res.status(401).send('Invalid credentials');
    }
  });
});

// Vulnerable XSS endpoint
app.get('/greet', (req, res) => {
  const name = req.query.name || 'Guest';
  res.send(`<h1>Hello, ${name}</h1>`);
});

app.listen(port, () => {
  console.log(`Node app listening at http://localhost:${port}`);
});
