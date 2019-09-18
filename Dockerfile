FROM python:2.7-alpine

RUN apk add --no-cache bash git && \
	pip install flake8

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
