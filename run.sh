#!/bin/bash

TMP_FOLDER=$(mktemp -d)
export XDG_RUNTIME_DIR="${TMP_FOLDER}"
export DISPLAY=":0"
export E_NO_DBUS_SESSION=1

tigervncserver \
    -name "Hass.io - Desktop" \
    -geometry 1920x1080 \
    -depth 24 \
    -localhost yes \
    -SecurityTypes None \
    -xstartup /usr/bin/enlightenment_start \
    "${DISPLAY}" \
    &

# wait for port 5900
sleep 5

./usr/src/noVNC/utils/launch.sh --vnc localhost:5900 --listen 8099

sleep 600
