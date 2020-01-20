FROM debian:buster-slim

ARG NOVNC_VERSION=1.1.0
ARG WEBSOCKIFY_VERSION=0.9.0

WORKDIR /usr/src
RUN apt-get update && apt-get install -y --no-install-recommends \
        enlightenment \
        git \
        python \
        python-numpy \
        tigervnc-standalone-server \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --depth 1 -b v${NOVNC_VERSION} https://github.com/novnc/noVNC \
    && git clone --depth 1 -b v${WEBSOCKIFY_VERSION} https://github.com/novnc/websockify noVNC/utils/websockify \
    && rm -rf noVNC/.git noVNC/utils/websockify/.git

WORKDIR /
COPY run.sh /

CMD ["/run.sh"]
