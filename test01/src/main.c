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
