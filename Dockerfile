FROM python:3.8-slim

WORKDIR /app
COPY . ./

RUN apt update && apt install -y postgresql && rm -rf /var/lib/apt/lists/*
RUN pip install -r requirements.txt

EXPOSE 8000
CMD sleep 5 && uvicorn --host=0.0.0.0 --port 8000 app:app
