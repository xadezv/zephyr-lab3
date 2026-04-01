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
