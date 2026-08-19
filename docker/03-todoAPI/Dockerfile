FROM python:3.11-alpine
LABEL CREATOR="ELESSAR"
LABEL VERSION="1.0.0"
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]
