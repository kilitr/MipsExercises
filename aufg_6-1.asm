	.data
	str:	.asciiz "Hello World"
	
	.text
	j	main
countChr:
	lb	$10, 0($8)
	beq	$10, $0, end
	addi	$8, $8, 1
	addi	$9, $9, 1
	j	countChr
end:	jr	$31
main:
	lui	$8, str
	ori	$8, str
	ori	$9, $0, 0
	jal	countChr
	