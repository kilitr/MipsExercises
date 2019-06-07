	.text
	j	main
	ori	$4, $0, 0x11	#(1) r4 <-- 210
	ori	$5, $0, 0x33	#(2) r5 <-- 28
euklid:	or	$2, $0, $5	#(3) r2 <-- r5
	beq	$4, $0, return	#(4) if(r4 == 0) goto (10)
test:	beq	$5, $0, setval	#(5) if(r5 == 0) goto (9)
	slt	$8, $5, $4	#(6) if(r4 > r5)
	beq	$8, $0, false
	sub	$4, $4, $5	# r4 <-- r4 - r5
	j	true
false:	sub	$5, $5, $4	#(7) else r5 <-- r5 - r4
true:	j test			#(8) goto (5)
setval:	or	$2, $0, $4	#(9) r2 <-- r4
return:	jr	$31

main:	ori	$4, $0, 0x1e	# 30
	ori	$5, $0, 0x19	# 25
	jal	euklid
	ori	$4, $0, 0x19	# 25
	ori	$5, $0, 0x23	# 35
	jal	euklid
	ori	$4, $0, 0xd2	# 210
	ori	$5, $0, 0x1c	# 28
	jal	euklid
	ori	$4, $0, 0x2a	# 42
	ori	$5, $0, 0x31	# 31
	jal	euklid
	ori	$4, $0, 0x11	# 17
	ori	$5, $0, 0x03	# 3
	jal	euklid
	ori	$4, $0, 0x11	# 17
	ori	$5, $0, 0x33	# 51
	jal	euklid
