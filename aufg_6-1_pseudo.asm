	.data
	.align	2
	str1:	.asciiz "Lager"
	.align	2
	str2:	.asciiz "Regal"
	.align	2
	str3:	.space	10
		.byte	0xff
		.byte	0xff
	
	.text
	j	main
	
strlength:	# v0	-Länge des Strings (Return)
		# t0	-Arbeitskopie der Adresse
		# t1	-Charakter des Strings
	or	$t0, $a0, $a0		# nicht mit a0 direkt arbeiten!
	or	$v0, $0, $0		# Zähler initialisieren
strlength_1:
	lbu	$t1, 0($t0)		# Character aus String holen
	beq	$t1, $0, strlength_end	# Mit Null vergleichen und return falls true
	addi	$t0, $t0, 1		# Zählen
	j	strlength_1		# nächster Buchstabe
strlength_end:
	sub	$v0, $t0, $a0
	subi	$v0, $v0, 1		# Terminator Zeichen von der Länge abziehen
	jr	$ra			# zurückkehren



strtolower:		# Needs a0 to be the Adress of a string
			# uses t0(character), t1(boolean), t2(boolean), t3(temporary value)
	lb	$t0, 0($a0)		# tempchar = *(Adresse+0)
	beq	$t0, $zero, stl_end	# while(tempchar != '\0')
	ori	$t3, $zero, 0x5b	# if((x>='A') && (x<='Z'))
	slt	$t1, $t0, $t3		# if((x>='A') && (x<='Z'))
	ori	$t3, $zero, 0x40	# if((x>='A') && (x<='Z'))
	slt	$t2, $t3, $t0		# if((x>='A') && (x<='Z'))
	beq	$t1,$t2, stl_lowca	# goto stllowca
	j	stl_inc			# else
stl_lowca:
	addi	$t0, $t0, 0x20		# tempchar = tempchar + ('a'-'A');
	sb	$t0, 0($a0)
stl_inc:
	addi	$a0, $a0, 1		# Adresse++;
	j	strtolower		# while(tempchar != '\0')
stl_end:
	jr	$ra
	

strturnaround:	# a0	-Startaddress String
		# t0	-Endaddress String
		# t1	-character vorn
		# t2	-character hinten
	or	$t0, $a0, $a0
strta_get_end:					# Bestimme end adresse
	lbu	$t1, 0($t0)
	beq	$t1, $zero, strta_reverse
	addi	$t0, $t0, 1
	j	strta_get_end
strta_reverse:
	subi	$t0, $t0, 1			# ziehe zuerst 1 von der endadresse ab, da inhalt NULL ist
	blt	$t0, $a0, strta_end		# wenn die beiden Adressen aneinander vorbeigelaufen sind ist string reversed
	lbu	$t1, 0($a0)			# Swap start
	lbu	$t2, 0($t0)
	sb	$t1, 0($t0)
	sb	$t2, 0($a0)			# Swap ende
	addi	$a0, $a0, 1
	j	strta_reverse			# wiederhole bis abbruchbedingung erfüllt
strta_end:
	jr	$ra


strcat:
	

	
main:
	la	$a0, str1
	jal	strtolower
	la	$a0, str2
	jal	strtolower
	la	$a0, str1
	jal	strturnaround
	la	$a0, str2
	jal	strturnaround
	la	$a0, str1
	la	$a1, str2
	la	$a2, str3
	jal	strcat