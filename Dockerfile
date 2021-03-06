FROM python:3.9.6-slim

WORKDIR /app
COPY . ./

RUN pip install -r requirements.txt

EXPOSE 8000
CMD sleep 5 && uvicorn --host=0.0.0.0 --port 8000 app:app
