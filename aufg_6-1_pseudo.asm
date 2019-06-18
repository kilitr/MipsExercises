	.data
	.align 2
	str1:	.asciiz "Lager"
	.align 2
	str2:	.asciiz "Regal"
	.align 2
	str3:	.space	10
		.byte	0xff
		.byte	0xff
	
	.text
	j	main
length:			# Needs a0 to be the Adress of a string
			# uses t0(counter) and t1(character)
			# returns length in $v0
	ori	$t0, $zero, 0
ilstart:
	lb	$t1, 0($a0)		# tempchar = *(Adresse+0)
	beq	$t1, $zero, ilend	# while(tempchar != '\0')
	addi	$a0, $a0, 1		# Adresse++
	addi	$t0, $t0, 1		# Counter++
	j	ilstart			# while(tempchar != '\0')
ilend:
	or	$v0, $zero, $t0		# return Counter;
	jr	$ra



strtolower:		# Needs a0 to be the Adress of a string
			# uses t0(character), t1(boolean), t2(boolean), t3(temporary value)
	lb	$t0, 0($a0)		# tempchar = *(Adresse+0)
	beq	$t0, $zero, stlend	# while(tempchar != '\0')
	ori	$t3, $zero, 0x5b	# if((x>='A') && (x<='Z'))
	slt	$t1, $t0, $t3		# if((x>='A') && (x<='Z'))
	ori	$t3, $zero, 0x40	# if((x>='A') && (x<='Z'))
	slt	$t2, $t3, $t0		# if((x>='A') && (x<='Z'))
	beq	$t1,$t2, stllowca	# goto stllowca
	j	stlinc			# else
stllowca:
	addi	$t0, $t0, 0x20		# tempchar = tempchar + ('a'-'A');
	sb	$t0, 0($a0)
stlinc:
	addi	$a0, $a0, 1		# Adresse++;
	j	strtolower		# while(tempchar != '\0')
stlend:
	jr	$ra
	
	
	
main:
	la	$a0, str1
	jal	strtolower
	