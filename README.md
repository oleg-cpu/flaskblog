# Simple flask blog run in docker deploy on aws 

Simple flask blog run in three docker comtainers. Fisrt container app, second container PostgreSQL.
Three container nginx proxy server.
Deploy application in aws with use terraform.
Backup database use bash script and cron.

## Run projects
1.Create .env.prod in root directory.
Set environment variables in file .env.prod 
+ FLASK_APP=
+ DATABASE_URL=
+ DATABASE=
+ POSTGRES_HOST=
+ POSTGRES_PORT=

2.Create .env.prod.db in root directory
+ POSTGRES_PASSWORD=
+ POSTGRES_USER=
+ POSTGRES_DB=
+ PGDATA=

3.Run command docker-compose up

#### Technologies
1. Python / Flask
2. Nginx
3. Gunicorn
4. PostgreSQL
5. Docker, docker-compose
6. AWS / Terraform
7. Bash

