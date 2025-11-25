FROM python:3.11-slim

ENV PIP_NO_PROGRESS_BAR=1
ENV PYTHONUNBUFFERED=1

WORKDIR /home/myapp

RUN pip install --no-cache-dir flask --progress-bar off

COPY ./static ./static
COPY ./templates ./templates
COPY sample_app.py .

EXPOSE 8080

CMD ["python", "sample_app.py"]
