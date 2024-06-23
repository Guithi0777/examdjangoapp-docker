### Alpine est mieux pour le build car alpine est la plus petite image.
FROM python:3.9.2-alpine

COPY db.sqlite3 /data/

RUN mkdir -p /data/backupsqlite

RUN apk update && apk --update-cache add sqlite 

RUN sqlite3 --version

VOLUME sqlite_data:/data

CMD ["sqlite3", "/data/db.sqlite3"]


