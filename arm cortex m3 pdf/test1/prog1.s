.syntax unified
.cpu cortex-m3
.thumb

        .equ STACKINIT,         0x20005000
		.equ NVIC_IRQ_SETEN0, 0xE000E100
		.equ NVIC_IRQ0_ENABLE, 0x1

.word 0x20000400
.word 0x080000ed
.space 0xe4


 main: @ Main program
 
	nop		@ Do Nothing
	MRS r0, BASEPRI @ Read BASEPRI register into R0
	MRS r0, PRIMASK @ Read PRIMASK register into R0
	MRS r0, FAULTMASK @ Read FAULTMASK register into R0
	MSR BASEPRI, r0 @ Write R0 into BASEPRI register
	MSR PRIMASK, r0 @ Write R0 into PRIMASK register
	MSR FAULTMASK, r0 @ Write R0 into FAULTMASK register
	 MOV R0, #0x12 @ Set R0 = 0x12 (hexadecimal)
	 MOV R1, #'A' @ Set R1 = ASCII character A
    BL function1 @ Call function1 using Branch with Link
	@ instruction.
	 @ PC  function1 and
	@ LR  the next instruction in main

function1:
 @ Program code for function 1
 BX LR @ Return


