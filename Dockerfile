FROM node:8.11-alpine

RUN apk add --no-cache --update curl bash openssl openssh tini python build-base \
    && apk upgrade

COPY bin /bin
RUN chmod 700 /bin/entrypoint.sh
RUN chmod 700 /bin/prestart.sh

RUN mkdir -p /opt/app/
WORKDIR /opt/app/

ENTRYPOINT ["/sbin/tini", "--", "/bin/entrypoint.sh"]
