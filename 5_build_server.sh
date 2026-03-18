#!/bin/bash
# Шаг 5: Сборка echo-сервера
cd ~/zephyrproject
source .venv/bin/activate
west build -b native_sim samples/net/sockets/echo_server \
  --DEXTRA_CONF_FILE=overlay-nsos.conf
