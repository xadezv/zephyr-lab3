#!/bin/bash
# Шаг 4: Установка Zephyr SDK и инструментов
cd ~/zephyrproject/zephyr
west sdk install
sudo apt install -y wireshark tcpdump netcat-openbsd
