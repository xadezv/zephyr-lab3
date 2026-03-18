#!/bin/bash
# Шаг 6: Запуск сервера (терминал 1)
cd ~/zephyrproject
source .venv/bin/activate
west build -t run
# Запоминаем PORT из вывода
