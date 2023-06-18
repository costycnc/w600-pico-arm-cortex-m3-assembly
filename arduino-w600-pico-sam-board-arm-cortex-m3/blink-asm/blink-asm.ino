void setup() {
  // put your setup code here, to run once:
    asm volatile (
	
	"@ 40MHz, 4 cycles per loop \n"



	".equ	APBCLK,		40000000 \n"
	".equ	DELAY_COUNT,	APBCLK  \n"

	".equ	LED_PIN,	0 \n"

	".equ	LOADADDR,	0x08010100 \n"
	".equ	RAM,		0x20000000 \n"
	".equ	STACK,		RAM + 0x28000 \n"

	".equ	PERIPH_BASE,	0x40000000 \n"
	".equ	APB_BASE,	PERIPH_BASE + 0x10000 \n"

	".equ	GPIOA_BASE,	APB_BASE + 0x0C00 \n"
	".equ	GPIO_DATA,	0x00 \n"
	".equ	GPIO_EN,	0x04 \n"
	".equ	GPIO_DIR,	0x08 \n"
	".equ	GPIO_REN,	0x0C \n"
	".equ	GPIO_AFSEL,	0x10 \n"
	".equ	GPIO_AFS1,	0x14 \n"
	".equ	GPIO_AFS0,	0x18 \n"
    );
}

void loop() {
  // put your main code here, to run repeatedly:

  asm volatile (
"ldr	r1, stackaddr	\n"
"	mov	sp, r1	\n"
"	ldr	r1, startaddr	\n"	
"	bx	r1	\n"
"stackaddr:	\n"
"	.word	STACK	\n"
"startaddr:	\n"
"	.word	start+1	\n"
"start: \n"
"	mov 	r1, #(1<<LED_PIN)	\n"
"	ldr	r2, gpio_base	\n"

"	@ disable function connected to LED_PIN	\n"
"	ldr	r3, [r2, #GPIO_AFSEL]		\n"
"	mvn	r0, r1	\n"
"	and	r3, r0	\n"
"	str	r3, [r2, #GPIO_AFSEL]	\n"	

"	@ set pin for output (0=input, 1=output)	\n"
"	ldr	r3, [r2, #GPIO_DIR]		\n"
"	orr	r3, r1	\n"
"	str	r3, [r2, #GPIO_DIR]	\n"	

"	@ disable push-pull (0=enable pull, 1=disable pull)	\n"
"	ldr	r3, [r2, #GPIO_REN]		\n"
"	orr	r3, r1	\n"
"	str	r3, [r2, #GPIO_REN]	\n"	

"	@ enable pin	\n"
"	ldr	r3, [r2, #GPIO_EN]	\n"	
"	orr	r3, r1	\n"
"	str	r3, [r2, #GPIO_EN]	\n"	

"	ldr	r0, counter	\n"
"loop1:	\n"
"	ldr	r3, [r2, #GPIO_DATA]	\n"	
"	eor	r3, r1	\n"
"	str	r3, [r2, #GPIO_DATA]	\n"	

"	mov	r3, r0		@ set counter	\n"
"delay:	\n"
"	sub	r3, r3, #1	\n"
"	cmp	r3, #0	\n"
"	bgt	delay	\n"

"	b	loop1	\n"

"gpio_base:	\n"
"	.word	GPIOA_BASE	\n"
"counter:	\n"
"	.word	1000000	\n"
);

}
