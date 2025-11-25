#!/bin/bash

# Create directories safely
mkdir -p tempdir/templates
mkdir -p tempdir/static

# Copy application files
cp sample_app.py tempdir/
cp -r templates/* tempdir/templates/
cp -r static/* tempdir/static/

# Create Dockerfile cleanly (overwrite every time)
cat > tempdir/Dockerfile <<EOF
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
EOF


# Build image
cd tempdir

docker build -t sampleapp . --no-cache

# Stop & delete old container if exists
docker rm -f samplerunning 2>/dev/null || true

# Run container
docker run -d -p 8088:8080 --name samplerunning sampleapp

docker ps -a
