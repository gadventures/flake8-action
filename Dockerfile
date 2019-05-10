FROM python:2.7-alpine

LABEL "com.github.actions.name"="Flake8 action"
LABEL "com.github.actions.description"="Run flake8 on your code"
LABEL "com.github.actions.icon"="search"
LABEL "com.github.actions.color"="green"
LABEL "repository"="http://github.com/wmak/flake8-action"
LABEL "maintainer"="Wmak"

RUN apk add --no-cache bash git && \
	pip install flake8

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
