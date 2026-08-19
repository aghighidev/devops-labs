from flask import Flask
import os
import mysql.connector

app = Flask(__name__)

db = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    database=os.getenv("DB_NAME")
)

@app.route("/")
def home():
    return f"Connected successfully to {os.getenv('DB_NAME')}"

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=int(os.getenv("APP_PORT", 5000))
    )
