/* defi ne constants */
 .equ STACK_TOP, 0x20000800
 .text
 .global _start
 .code 16
 .syntax unified
 /* .thumbfunc */
 /* .thumbfunc is only needed with CodeSourcery GNU tool chain prior to 2006Q3-26 */
_start:
 .word STACK_TOP, start
 .type start, function
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
 .end

