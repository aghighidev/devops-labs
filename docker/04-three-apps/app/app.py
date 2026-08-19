from flask import Flask
import socket

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello from " + socket.gethostname() + "\n"

@app.route("/health")
def health():
    return "OK", 200

app.run(host="0.0.0.0", port=5000)

