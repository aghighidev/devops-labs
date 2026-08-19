from flask import Flask
from redis import Redis

app = Flask(__name__)

redis = Redis(host="redis", port=6379)

@app.route("/")
def home():
    count = redis.incr("visits")
    return f"Hello! You visited this page {count} times."


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
