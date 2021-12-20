FROM  python:3-alpine

RUN apk update \
        && apk add build-base postgresql-dev libpq --no-cache --virtual .build-deps 
       
RUN adduser -D  flaskblog
WORKDIR /home/flaskblog

COPY  requirements.txt requirements.txt 
COPY app app
COPY migrations migrations
COPY flaskblog.py config.py boot.sh ./
RUN chmod +x boot.sh


RUN python -m venv venv \
        && venv/bin/pip install pip --upgrade pip \
        && venv/bin/pip install  -r requirements.txt \
        && venv/bin/pip install gunicorn

RUN chown -R flaskblog:flaskblog ./
USER flaskblog

ENTRYPOINT [ "sh", "./boot.sh" ]