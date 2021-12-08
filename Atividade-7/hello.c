#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
MODULE_LICENSE("Dual BSD/GPL");

static int param = 3;

static int hello_init(void) {
    printk(KERN_ALERT "Hello world\n");
    return 0;
}

static void hello_exit(void) {
    printk(KERN_ALERT "Goodbye - Valor depois: %d\n", param);
}

module_param(param, int, 0);
module_init(hello_init);
module_exit(hello_exit);