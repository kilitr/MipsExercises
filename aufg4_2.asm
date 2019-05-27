# Aufgabe 4.4
	.data
	vala: .byte 	0xa0
	valb: .half 	0xb1b0
	valc: .word 	0xc3c2c1c0
	vald: .ascii 	"Das Ende"

# Aufgabe 4.2
	.text
	andi	$8, $0, 0x0
	ori	$9, $0, 0xb
	ori	$10, $0, 0x1000
	addi	$11, $0, -0x1
	addi	$12, $0, -0x8000
	ori	$13, $0, 0x8000
	
	#ori	$14, $0, 0xffff
	#sll	$14, $14, 0x10
	lui	$14, 0xffff
	
	#ori	$15, $0, 0x7fff
	#sll	$15, $15, 0x10
	#ori	$15, $15, 0xffff
	lui	$15, 0x7fff
	ori	$15, $15, 0xffff
	
	addi	$24, $0, 0x14ca
	addi	$25, $0, 0x4a

# Aufgabe 4.3
	add	$2, $10, $9
	sub	$3, $10, $9
	
	nor	$4, $9, $0
	add	$4, $4, $10
	addi	$4, $4, 0x1
	
	sll	$5, $13, 0x5
	sra	$6, $13, 0x5
	sra	$7, $12, 0x5
	srl	$16, $12, 0x5
	srlv	$17, $13, $9
	
	div	$24, $25
	mflo	$18
	mfhi	$19
	
	addiu	$20, $15, 0x1
	#addi	$21, $15, 0x1
	clo	$22, $11
	clo	$23, $14
	
