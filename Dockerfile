FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV EXECUTION_GAP_DB=/data/execution_gap.sqlite3

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /data

EXPOSE 8765

CMD ["python", "run.py", "web", "--host", "0.0.0.0", "--port", "8765", "--db", "/data/execution_gap.sqlite3"]
