FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/postman"

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates libasound2t64 libnss3 libxss1 xdg-utils && \
    mkdir -p /usr/share/icons/hicolor/128x128/apps && \
    ln -sf /Postman/Postman /usr/bin/postman && \
    ln -sf /Postman/app/resources/app/assets/icon.png /usr/share/icons/hicolor/128x128/apps/postman.png && \
    cpak-clean-junk

COPY postman.desktop /usr/share/applications/postman.desktop
