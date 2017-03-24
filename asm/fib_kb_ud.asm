nop
addiu $17,$0,0x00000001
addiu $10,$0,0x00001000
addiu $21,$0,0x00000001
addiu $22,$0,0x00000001
addiu $27,$0,0x00000075
addiu $28,$0,0x00000072
addiu $17,$0,0x00000001
lui $1,0x0000000f
ori $7,$1,0x0000ffff
next:
addu $23,$21,$22
addu $17,$0,$23
addu $21,$0,$22
addu $22,$0,$23

_rest1:
add $8,$0,$0
_time1:
nop
beq $8,$7,wait
addi $8,$8,1
j _time1

pre:
addu $17,$0,$21
subu $20,$22,$21
addu $22,$0,$21
addu $21,$0,$20

_rest2:
add $8,$0,$0
_time2:
nop
beq $8,$7,wait
addi $8,$8,1
j _time2

wait:
lw $6,0($10)
beq $6,$27,next
beq $6,$28,pre

_rest:
add $8,$0,$0
_time:
nop
beq $8,$7,wait
addi $8,$8,1
j _time
