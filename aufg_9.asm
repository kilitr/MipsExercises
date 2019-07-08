	.data
prompt_p:	.asciiz "\np>"
prompt_q:	.asciiz "q>"
print_d:	.asciiz "D="
fp1:	.double	4
	.text
main:
	jal	get_values
	jal	quadsolve
	j	end

quadsolve:
	mul.d	$f16, $f12, $f12	# p^2
	l.d	$f18, fp1
	div.d	$f16, $f16, $f18	# p^2/4
	sub.d	$f16, $f16, $f14	# (p^2/4)-q
	la	$a0, print_d
	li	$v0, 4
	syscall
	mov.d	$f12, $f16
	li	$v0, 3
	syscall
	jr	$ra

get_values:	#f12 - p ; f14 - q
	la	$a0, prompt_p
	li	$v0, 4
	syscall
	li	$v0, 7
	syscall
	mov.d	$f12, $f0
	la	$a0, prompt_q
	li	$v0, 4
	syscall
	li	$v0, 7
	syscall
	mov.d	$f14, $f0
	jr	$ra

end:
	li $v0, 10
	syscall
