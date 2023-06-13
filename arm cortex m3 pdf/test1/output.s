
prog1.bin:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	0400      	lsls	r0, r0, #16
   2:	2000      	movs	r0, #0
   4:	00ed      	lsls	r5, r5, #3
   6:	0800      	lsrs	r0, r0, #32
	...
  ec:	bf00      	nop
  ee:	f3ef 8011 	mrs	r0, BASEPRI
  f2:	f3ef 8010 	mrs	r0, PRIMASK
  f6:	f3ef 8013 	mrs	r0, FAULTMASK
  fa:	f380 8811 	msr	BASEPRI, r0
  fe:	f380 8810 	msr	PRIMASK, r0
 102:	f380 8813 	msr	FAULTMASK, r0
 106:	f04f 0012 	mov.w	r0, #18
 10a:	f04f 0141 	mov.w	r1, #65	@ 0x41
 10e:	f000 f800 	bl	0x112
 112:	4770      	bx	lr
