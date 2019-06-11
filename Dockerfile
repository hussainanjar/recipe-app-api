FROM python:3.7-alpine
LABEL maintainer="Hussain Fakhruddin"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

# dependency for postgres sql
# --no-cache is recommended to keep image size less and store no cache
RUN apk add --update --no-cache postgresql-client
# --virtual allows to add alias so to dependency which you can
# delete later as only required to install python postgres package
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app app

RUN adduser -D user
USER user