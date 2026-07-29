ARG PAPERLESS_VERSION=3.0.4

FROM ghcr.io/paperless-ngx/paperless-ngx:${PAPERLESS_VERSION}

LABEL org.opencontainers.image.title="AIT DMS"
LABEL org.opencontainers.image.description="Paperless-ngx with German E-Rechnung parser"
LABEL org.opencontainers.image.source="https://github.com/GITHUB-OWNER/ait-dms"

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        default-jre-headless \
        fop \
    && rm -rf /var/lib/apt/lists/*

ARG ERECHNUNG_VERSION=0.1.1

RUN pip install --no-cache-dir \
    "paperless-ngx-erechnung==${ERECHNUNG_VERSION}"

USER paperless
