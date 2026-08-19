FROM python:3.11-alpine
LABEL "author"="elessar"
LABEL "version"="1.0.0"
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/health')"
RUN addgroup gtest && adduser -D -G gtest utest 
COPY --chown=utest:gtest . .
USER utest:gtest
CMD ["python", "app.py"]
