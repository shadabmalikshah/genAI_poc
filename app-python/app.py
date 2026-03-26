from flask import Flask, request
import mysql.connector

app = Flask(__name__)

# Hardcoded secret for POC
DB_PASSWORD = 'SuperSecret123'

db = mysql.connector.connect(
    host='localhost',
    user='root',
    password=DB_PASSWORD,
    database='testdb'
)

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')
    query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"
    cursor = db.cursor()
    cursor.execute(query)
    result = cursor.fetchall()
    if result:
        return 'Login successful'
    else:
        return 'Invalid credentials', 401

@app.route('/greet')
def greet():
    name = request.args.get('name', 'Guest')
    return f"<h1>Hello, {name}</h1>"

if __name__ == '__main__':
    app.run(port=5000)
