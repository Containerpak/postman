FROM ubuntu:26.04 AS source

ADD --checksum=sha256:ca32cc0264ebc4c919be38dbeadb91a89f746e874b92e5a84cdc595901e9b7ae https://dl.pstmn.io/download/version/12.23.7/linux64 /tmp/app.tar.gz

RUN mkdir -p /out && \
    tar -xzf /tmp/app.tar.gz -C /out

FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/postman"

COPY --from=source /out/Postman /opt/postman

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates libasound2t64 libnss3 libxss1 xdg-utils && \
    ln -sf /opt/postman/Postman /usr/bin/postman && \
    cpak-clean-junk

COPY icon.png /usr/share/icons/hicolor/128x128/apps/postman.png
COPY postman.desktop /usr/share/applications/postman.desktop
