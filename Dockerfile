ARG GH_BIN="/usr/bin/gh"


FROM alpine AS builder

RUN apk add -U --no-cache \
            github-cli \
            gzip \
    && \
    gzexe ${GH_BIN}


FROM alpine

RUN apk add -U --no-cache \
            github-cli \
    && \
    rm ${GH_BIN}

COPY --from=builder ${GH_BIN} ${GH_BIN}
