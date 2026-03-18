#!/bin/bash
# Шаг 7: Перехват трафика (терминал 2 - атакующий)
PORT=$1
ss -tnlp | grep zephyr
sudo tcpdump -A -i lo port $PORT
