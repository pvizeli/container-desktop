#!/bin/bash

TMP_FOLDER=$(mktemp -d)
export XDG_RUNTIME_DIR="${TMP_FOLDER}"
export DISPLAY=":0"

tigervncserver \
    -name "Hass.io - Desktop" \
    -geometry 1920x1080 \
    -depth 24 \
    -localhost yes \
    -SecurityTypes None \
    "${DISPLAY}" \
    &

./usr/src/noVNC/utils/launch.sh --vnc localhost:5900 --listen 8099
