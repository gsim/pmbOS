#include "../includes/kernel.h"
#include "../includes/terminal.h"
/* Hardware text mode color constants. */

void kernel_main()
{
	terminal_initialize();
	terminal_moveto(30,7);
	terminal_writestring("Welcome to pmbOS 0.1");
	for(;;);
}