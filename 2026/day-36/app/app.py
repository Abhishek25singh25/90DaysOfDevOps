from flask import Flask, request, jsonify
import psycopg2
import os

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST")
DB_NAME = os.getenv("POSTGRES_DB")
DB_USER = os.getenv("POSTGRES_USER")
DB_PASS = os.getenv("POSTGRES_PASSWORD")

def get_db_connection():
    return psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASS
    )

@app.route("/")
def home():
    return "Dockerized Notes App Running 🚀"

@app.route("/notes", methods=["GET"])
def get_notes():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS notes (id SERIAL PRIMARY KEY, content TEXT);")
    cur.execute("SELECT * FROM notes;")
    notes = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(notes)

@app.route("/notes", methods=["POST"])
def add_note():
    data = request.json
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("INSERT INTO notes (content) VALUES (%s);", (data["content"],))
    conn.commit()
    cur.close()
    conn.close()
    return {"message": "Note added!"}, 201

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
