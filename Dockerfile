FROM alpine:3.5

ARG SYSTEM_TZ
ENV SYSTEM_TZ ${SYSTEM_TZ:-America/Chicago}

RUN \
  apk add --no-cache \
    curl \
    openssl \
    tzdata && \
  cp /usr/share/zoneinfo/${SYSTEM_TZ} /etc/localtime && \
  echo "${SYSTEM_TZ}" > /etc/TZ && \
  apk del tzdata

