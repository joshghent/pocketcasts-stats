# See https://hub.docker.com/r/library/python/
FROM python:3-alpine

LABEL Name=pocketcasts-stats

WORKDIR /app
ADD . /app

# Using pip:
RUN python3 -m pip install -r requirements.txt
CMD ["python3", "./main.py"]
