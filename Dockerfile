ARG GH_BIN="/usr/bin/gh"


FROM alpine AS builder
ARG GH_BIN

RUN apk add -U --no-cache \
            github-cli \
            gzip \
    && \
    gzexe ${GH_BIN}


FROM alpine
ARG GH_BIN

RUN apk add -U --no-cache \
            github-cli \
    && \
    rm ${GH_BIN}

COPY --from=builder ${GH_BIN} ${GH_BIN}
