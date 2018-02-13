FROM node:8-alpine

RUN apk update \
    && apk add --update curl bash openssl openssh \
    && apk upgrade \
    && rm -rf /var/cache/apk/*

RUN export CONSUL_VERSION=1.0.1 \
    && export CONSUL_CHECKSUM=eac5755a1d19e4b93f6ce30caaf7b3bd8add4557b143890b1c07f5614a667a68 \
    && curl --retry 7 --fail -vo /tmp/consul.zip "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" \
    && echo "${CONSUL_CHECKSUM}  /tmp/consul.zip" | sha256sum -c \
    && unzip /tmp/consul -d /usr/local/bin \
    && rm /tmp/consul.zip \
    && mkdir /config

# Install ContainerPilot
ENV CONTAINERPILOT_VERSION 3.6.0
RUN export CP_SHA1=1248784ff475e6fda69ebf7a2136adbfb902f74b \
    && curl -Lso /tmp/containerpilot.tar.gz \
         "https://github.com/joyent/containerpilot/releases/download/${CONTAINERPILOT_VERSION}/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz" \
    && echo "${CP_SHA1}  /tmp/containerpilot.tar.gz" | sha1sum -c \
    && tar zxf /tmp/containerpilot.tar.gz -C /bin \
    && rm /tmp/containerpilot.tar.gz

# COPY ContainerPilot configuration
ENV CONTAINERPILOT_PATH=/etc/containerpilot.json5
ENV CONTAINERPILOT=${CONTAINERPILOT_PATH}
COPY ./prestart.sh /bin/prestart.sh
RUN chmod 700 /bin/prestart.sh
COPY ./containerpilot.json5 /etc/containerpilot.json5

CMD ["containerpilot"]
