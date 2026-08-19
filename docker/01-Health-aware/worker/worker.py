import time
import requests

while True:
    try:
        response = requests.get("http://app:5000/health")
        print(f"App response: {response.status_code} - {response.text}")
    except requests.RequestException as e:
        print(f"Request failed: {e}")

    time.sleep(5)
