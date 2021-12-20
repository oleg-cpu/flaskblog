#!/bin/sh

if [ "$DATABASE" == "postgres" ]
then
    echo "Waiting for postgress"
    while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
            sleep 0.1
    done

    echo "Postgresql started"

fi
source venv/bin/activate
flask db upgrade
exec gunicorn --workers=4 -b :5000 flaskblog:app
