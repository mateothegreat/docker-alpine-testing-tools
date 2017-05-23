FROM alpine:3.5

# Optional Configuration Parameter
ARG SYSTEM_TZ

# Default Settings
ENV SYSTEM_TZ ${SYSTEM_TZ:-America/Chicago}

RUN \
  apk add --no-cache \
    curl \
    dumb-init \
    openssl \
    tzdata && \
  cp /usr/share/zoneinfo/${SYSTEM_TZ} /etc/localtime && \
  echo "${SYSTEM_TZ}" > /etc/TZ && \
  apk del tzdata

# ENTRYPOINT [ "/usr/bin/dumb-init", "curl" ]

# CMD [ "--help" ]
