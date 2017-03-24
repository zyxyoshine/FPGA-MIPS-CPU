sll $0,$0,0
lui $21,0x005f
ori $19,$21,0xffff
lui $21,0x003f
ori $20,$21,0xffff
addiu $10,$0,0x1000
addiu $25,$0,0x0001

addiu $1,$0,0x0042
addiu $2,$0,0x003b
addiu $3,$0,0x0033
addiu $4,$0,0x0034
addiu $5,$0,0x002b
addiu $6,$0,0x0023
addiu $7,$0,0x001b
addiu $8,$0,0x001c

lui $21,0xffff
addu $27,$0,$0

xia:
	addiu $23,$25,0x0033
	andi $25,$23,0x0007
	addiu $9,$0,0x0000
	beq $25,$9,NOW1
	addiu $9,$0,0x0001
	beq $25,$9,NOW2
	addiu $9,$0,0x0002
	beq $25,$9,NOW3
	addiu $9,$0,0x0003
	beq $25,$9,NOW4
	addiu $9,$0,0x0004
	beq $25,$9,NOW5
	addiu $9,$0,0x0005
	beq $25,$9,NOW6
	addiu $9,$0,0x0006
	beq $25,$9,NOW7
	addiu $9,$0,0x0007
	beq $25,$9,NOW8
j xia

SUCC:
	addu $17,$0,$0
	addi $27,$27,1
	rests:
		add $18,$0,$0
	_times:
		nop
		beq $18,$19,xia
		addi $18,$18,1
	j _times

FAIL:
	or $29,$21,$27
	addu $17,$0,$29
	restf:
		add $18,$0,$0
	_timef:
		nop
		beq $18,$19,xia
		addi $18,$18,1
	j _timef


NOW1:
	addiu $17,$0,0x0008
	rest1:
		add $18,$0,$0
	_time1:
		lw $16,0($10)
		beq $16,$1,SUCC
		beq $18,$20,FAIL
		addi $18,$18,1
	j _time1

NOW2:
	addiu $17,$0,0x0080
	rest2:
		add $18,$0,$0
	_time2:
		lw $16,0($10)
		beq $16,$2,SUCC
		beq $18,$20,FAIL
		addi $18,$18,1
	j _time2
	
NOW3:
	addiu $17,$0,0x0800
	rest3:
		add $18,$0,$0
	_time3:
		lw $16,0($10)
		beq $16,$3,SUCC
		beq $18,$20,FAIL
		addi $18,$18,1
	j _time3
	
NOW4:
	ori $17,$0,0x8000
	rest4:
		add $18,$0,$0
	_time4:
		lw $16,0($10)
		beq $16,$4,SUCC
		beq $18,$20,FAIL
		addi $18,$18,1
	j _time4
	
NOW5:
	lui $17,0x0008
	rest5:
		add $18,$0,$0
	_time5:
		lw $16,0($10)
		beq $16,$5,SUCC
		beq $18,$20,FAIL
		addi $18,$18,1
	j _time5
	
NOW6:
	lui $17,0x0080
	rest6:
		add $18,$0,$0
	_time6:
		lw $16,0($10)
		beq $16,$6,SUCC
		beq $18,$20,FAIL
		addi $18,$18,1
	j _time6
	
NOW7:
	lui $17,0x0800
	rest7:
		add $18,$0,$0
	_time7:
		lw $16,0($10)
		beq $16,$7,SUCC
		beq $18,$20,FAIL
		addi $18,$18,1
	j _time7
	
NOW8:
	lui $17,0x8000
	rest8:
		add $18,$0,$0
	_time8:
		lw $16,0($10)
		beq $16,$8,SUCC
		beq $18,$20,FAIL
		addi $18,$18,1
	j _time8
