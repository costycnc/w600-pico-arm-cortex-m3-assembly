
prog1.bin:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	5000      	str	r0, [r0, r0]
   2:	2000      	movs	r0, #0
   4:	001d      	movs	r5, r3
   6:	0800      	lsrs	r0, r0, #32
   8:	0085      	lsls	r5, r0, #2
   a:	0800      	lsrs	r0, r0, #32
   c:	0085      	lsls	r5, r0, #2
   e:	0800      	lsrs	r0, r0, #32
  10:	0085      	lsls	r5, r0, #2
  12:	0800      	lsrs	r0, r0, #32
  14:	0085      	lsls	r5, r0, #2
  16:	0800      	lsrs	r0, r0, #32
  18:	0085      	lsls	r5, r0, #2
  1a:	0800      	lsrs	r0, r0, #32
  1c:	4e1c      	ldr	r6, [pc, #112]	; (0x90)
  1e:	6835      	ldr	r5, [r6, #0]
  20:	f045 0502 	orr.w	r5, r5, #2
  24:	6035      	str	r5, [r6, #0]
  26:	6835      	ldr	r5, [r6, #0]
  28:	f025 0502 	bic.w	r5, r5, #2
  2c:	6035      	str	r5, [r6, #0]
  2e:	4e19      	ldr	r6, [pc, #100]	; (0x94)
  30:	6835      	ldr	r5, [r6, #0]
  32:	f045 0502 	orr.w	r5, r5, #2
  36:	6035      	str	r5, [r6, #0]
  38:	4e17      	ldr	r6, [pc, #92]	; (0x98)
  3a:	6835      	ldr	r5, [r6, #0]
  3c:	f425 4540 	bic.w	r5, r5, #49152	; 0xc000
  40:	f445 4580 	orr.w	r5, r5, #16384	; 0x4000
  44:	6035      	str	r5, [r6, #0]
  46:	4e15      	ldr	r6, [pc, #84]	; (0x9c)
  48:	6835      	ldr	r5, [r6, #0]
  4a:	f025 0580 	bic.w	r5, r5, #128	; 0x80
  4e:	6035      	str	r5, [r6, #0]
  50:	4e13      	ldr	r6, [pc, #76]	; (0xa0)
  52:	6835      	ldr	r5, [r6, #0]
  54:	f425 4540 	bic.w	r5, r5, #49152	; 0xc000
  58:	6035      	str	r5, [r6, #0]
  5a:	4e12      	ldr	r6, [pc, #72]	; (0xa4)
  5c:	6835      	ldr	r5, [r6, #0]
  5e:	f425 4540 	bic.w	r5, r5, #49152	; 0xc000
  62:	6035      	str	r5, [r6, #0]
  64:	4e10      	ldr	r6, [pc, #64]	; (0xa8)
  66:	6835      	ldr	r5, [r6, #0]
  68:	f025 0580 	bic.w	r5, r5, #128	; 0x80
  6c:	6035      	str	r5, [r6, #0]
  6e:	490f      	ldr	r1, [pc, #60]	; (0xac)
  70:	3901      	subs	r1, #1
  72:	d1fd      	bne.n	0x70
  74:	6835      	ldr	r5, [r6, #0]
  76:	f045 0580 	orr.w	r5, r5, #128	; 0x80
  7a:	6035      	str	r5, [r6, #0]
  7c:	490b      	ldr	r1, [pc, #44]	; (0xac)
  7e:	3901      	subs	r1, #1
  80:	d1fd      	bne.n	0x7e
  82:	e7f0      	b.n	0x66
  84:	f100 0001 	add.w	r0, r0, #1
  88:	f101 0101 	add.w	r1, r1, #1
  8c:	e7fa      	b.n	0x84
  8e:	0000      	movs	r0, r0
  90:	3810      	subs	r0, #16
  92:	4002      	ands	r2, r0
  94:	381c      	subs	r0, #28
  96:	4002      	ands	r2, r0
  98:	0400      	lsls	r0, r0, #16
  9a:	4002      	ands	r2, r0
  9c:	0404      	lsls	r4, r0, #16
  9e:	4002      	ands	r2, r0
  a0:	0408      	lsls	r0, r1, #16
  a2:	4002      	ands	r2, r0
  a4:	040c      	lsls	r4, r1, #16
  a6:	4002      	ands	r2, r0
  a8:	0414      	lsls	r4, r2, #16
  aa:	4002      	ands	r2, r0
  ac:	3500      	adds	r5, #0
  ae:	000c      	movs	r4, r1
