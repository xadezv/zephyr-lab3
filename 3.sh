#!/bin/bash
# Шаг 3: Клонирование исходного кода Zephyr
west init ~/zephyrproject
cd ~/zephyrproject
west update
west zephyr-export
west packages pip --install
