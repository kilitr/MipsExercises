	.text
	ori	$4, $0, 0x11	#(1) r4 <-- 210					0040 0000
	ori	$5, $0, 0x33	#(2) r5 <-- 28					0040 0004
euklid:	or	$2, $0, $5	#(3) r2 <-- r5					0040 0008
	beq	$4, $0, loop	#(4) if(r4 == 0) goto (10)			0040 000c
test:	beq	$5, $0, setval	#(5) if(r5 == 0) goto (9)			0040 0010
	slt	$8, $5, $4	#(6) if(r4 > r5)				0040 0014
	beq	$8, $0, else	#						0040 0018
	sub	$4, $4, $5	# r4 <-- r4 - r5				0040 001c
	j	after		#						0040 0020
else:	sub	$5, $5, $4	#(7) else r5 <-- r5 - r4			0040 0024
after:	j test			#(8) goto (5)					0040 0028
setval:	or	$2, $0, $4	#(9) r2 <-- r4					0040 002c
loop:	j	loop		#(10) goto (10)					0040 0030
