/* Main program */
 .text
 .global _start
 .global start
 .global nmi_handler
 .code 16
 .syntax unified
 .type start, function
 .type nmi_handler, function
_start:
 /* Start of main program */
start:
 movs r0, #10
 movs r1, #0
 /* Calculate 1098...1 */
loop:
 adds r1, r0
 subs r0, #1
 bne loop
 /* Result is now in R1 */
deadloop:
 b deadloop
 /* Dummy NMI handler for illustration */
nmi_handler:
 bx lr
 .end

