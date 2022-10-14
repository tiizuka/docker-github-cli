FROM alpine

RUN apk add -U --no-cache \
            github-cli \
            gzip \
        && \
    gzexe /usr/bin/gh \
        && \
    rm /usr/bin/gh~ \
        && \
    apk del --purge \
            gzip
