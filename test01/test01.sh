#!/bin/bash
# Lab 3 — Zephyr IoT Security

# Установка QEMU
sudo apt update
sudo apt install -y qemu-system-arm qemu-system-x86 qemu-utils

# Проверка
qemu-system-arm --version
west --version

# Активация venv
source ~/zephyrproject/.venv/bin/activate
cd ~/zephyrproject

# Создание директории проекта
mkdir -p ~/zephyrproject/labs_cybersecurity_IoT/src
cd ~/zephyrproject/labs_cybersecurity_IoT

# CMakeLists.txt
cat > CMakeLists.txt << 'EOF'
cmake_minimum_required(VERSION 3.20.0)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(lab3)
target_sources(app PRIVATE src/main.c)
EOF

# prj.conf
cat > prj.conf << 'EOF'
CONFIG_PRINTK=y
EOF

# main.c (итерация 1 — с утечкой пароля)
cat > src/main.c << 'EOF'
#include <zephyr/kernel.h>

void main(void) {
    while (1) {
        printk("------------------------------\n");
        printk("Device: sensor-01\n");
        printk("Temperature: 24 C\n");
        printk("Debug: admin password = 12345678\n");
        printk("------------------------------\n");
        k_sleep(K_SECONDS(2));
    }
}
EOF

# Сборка
west build -b qemu_cortex_m3 .

# Запуск → СКРИН 1 (видно пароль)
# west build -t run
# Выход: Ctrl+A, X

# main.c (итерация 2 — без утечки)
cat > src/main.c << 'EOF'
#include <zephyr/kernel.h>

void main(void) {
    while (1) {
        printk("------------------------------\n");
        printk("Device: sensor-01\n");
        printk("Temperature: 24 C\n");
        printk("System status: normal\n");
        printk("------------------------------\n");
        k_sleep(K_SECONDS(2));
    }
}
EOF

# Пересборка
west build -b qemu_cortex_m3 . -p

# Запуск → СКРИН 2 (пароля нет)
# west build -t run
