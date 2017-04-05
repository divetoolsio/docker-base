FROM alpine

MAINTAINER eg

ENV \
    TIMEZONE=UTC

RUN \
    # Add edge repo
    echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \ 
    echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \ 
    echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \

    # Update packages
    apk --no-cache upgrade && \

    # Install Bash
    apk --no-cache add bash && \

    # Set timezone
    apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    apk del tzdata

ENTRYPOINT ["bash"]
