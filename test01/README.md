# Lab 3 — Zephyr IoT Security

## Сборка и запуск

```bash
source ~/zephyrproject/.venv/bin/activate
cd ~/zephyrproject

sudo apt install -y qemu-system-arm qemu-system-x86 qemu-utils

# Скопировать test01 в ~/zephyrproject/labs_cybersecurity_IoT
cp -r test01 ~/zephyrproject/labs_cybersecurity_IoT
cd ~/zephyrproject/labs_cybersecurity_IoT

# Сборка (итерация 1 — с утечкой пароля)
west build -b qemu_cortex_m3 .
west build -t run
# Ctrl+A, X — выход

# Итерация 2 — без утечки
cp src/main_fixed.c src/main.c
west build -b qemu_cortex_m3 . -p
west build -t run
```

## Файлы
- `src/main.c` — первая итерация (с логином/паролем в консоли)
- `src/main_fixed.c` — вторая итерация (без утечки)
- `CMakeLists.txt` — конфиг сборки
- `prj.conf` — конфиг Zephyr
