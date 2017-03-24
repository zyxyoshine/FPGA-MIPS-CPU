addiu $sp,$zero,0x0ff0
addiu $fp,$zero,0x0ff0
j main
partions:
addiu	$sp,$sp,-16
sw	$fp,8($sp)
or $fp,$zero,$sp
sw	$a0,16($fp)
sw	$a1,20($fp)
sw	$a2,24($fp)
lw	$v0,20($fp)
sll $zero,$zero,0
or $v1,$zero,$v0
sll	$v0,$v1,2
lw	$v1,16($fp)
sll $zero,$zero,0
addu	$v0,$v0,$v1
lw	$v1,0($v0)
sll $zero,$zero,0
sw	$v1,0($fp)
_80020040:
lw	$v0,20($fp)
lw	$v1,24($fp)
sll $zero,$zero,0
slt	$v0,$v0,$v1
sll $zero,$zero,0
bne $v0,$zero,_80020060
sll $zero,$zero,0
beq $zero,$zero,_800201cc
_80020060:
lw	$v0,20($fp)
lw	$v1,24($fp)
sll $zero,$zero,0
slt	$v0,$v0,$v1
sll $zero,$zero,0
beq $v0,$zero,_800200b4
lw	$v0,24($fp)
sll $zero,$zero,0
or $v1,$zero,$v0
sll	$v0,$v1,2
lw	$v1,16($fp)
sll $zero,$zero,0
addu	$v0,$v0,$v1
lw	$v1,0($v0)
lw	$v0,0($fp)
sll $zero,$zero,0
slt	$v1,$v1,$v0
sll $zero,$zero,0
beq $v1,$zero,_800200bc
sll $zero,$zero,0
beq $zero,$zero,_800200b4
_800200b4:
sll $zero,$zero,0
beq $zero,$zero,_800200d0
_800200bc:
lw	$v0,24($fp)
sll $zero,$zero,0
addiu	$v1,$v0,-1
sw	$v1,24($fp)
beq $zero,$zero,_80020060
_800200d0:
lw	$v0,20($fp)
sll $zero,$zero,0
or $v1,$zero,$v0
sll	$v0,$v1,2
lw	$v1,16($fp)
sll $zero,$zero,0
addu	$v0,$v0,$v1
lw	$v1,24($fp)
sll $zero,$zero,0
or $a0,$zero,$v1
sll	$v1,$a0,2
lw	$a0,16($fp)
sll $zero,$zero,0
addu	$v1,$v1,$a0
lw	$a0,0($v1)
sll $zero,$zero,0
sw	$a0,0($v0)
_80020114:
lw	$v0,20($fp)
lw	$v1,24($fp)
sll $zero,$zero,0
slt	$v0,$v0,$v1
sll $zero,$zero,0
beq $v0,$zero,_80020168
lw	$v0,20($fp)
sll $zero,$zero,0
or $v1,$zero,$v0
sll	$v0,$v1,2
lw	$v1,16($fp)
sll $zero,$zero,0
addu	$v0,$v0,$v1
lw	$v1,0($v0)
lw	$v0,0($fp)
sll $zero,$zero,0
slt	$v1,$v0,$v1
sll $zero,$zero,0
beq $v1,$zero,_80020170
sll $zero,$zero,0
beq $zero,$zero,_80020168
_80020168:
sll $zero,$zero,0
beq $zero,$zero,_80020184
_80020170:
lw	$v0,20($fp)
sll $zero,$zero,0
addiu	$v1,$v0,1
sw	$v1,20($fp)
beq $zero,$zero,_80020114
_80020184:
lw	$v0,24($fp)
sll $zero,$zero,0
or $v1,$zero,$v0
sll	$v0,$v1,2
lw	$v1,16($fp)
sll $zero,$zero,0
addu	$v0,$v0,$v1
lw	$v1,20($fp)
sll $zero,$zero,0
or $a0,$zero,$v1
sll	$v1,$a0,2
lw	$a0,16($fp)
sll $zero,$zero,0
addu	$v1,$v1,$a0
lw	$a0,0($v1)
sll $zero,$zero,0
sw	$a0,0($v0)
beq $zero,$zero,_80020040
_800201cc:
lw	$v0,20($fp)
sll $zero,$zero,0
or $v1,$zero,$v0
sll	$v0,$v1,2
lw	$v1,16($fp)
sll $zero,$zero,0
addu	$v0,$v0,$v1
lw	$v1,0($fp)
sll $zero,$zero,0
sw	$v1,0($v0)
lw	$v1,20($fp)
sll $zero,$zero,0
or $v0,$zero,$v1
beq $zero,$zero,_80020204
_80020204:
or $sp,$zero,$fp
lw	$fp,8($sp)
addiu	$sp,$sp,16
jr	$ra

qsort:
addiu	$sp,$sp,-32
sw	$ra,28($sp)
sw	$fp,24($sp)
or $fp,$zero,$sp
sw	$a0,32($fp)
sw	$a1,36($fp)
sw	$a2,40($fp)
lw	$v0,36($fp)
lw	$v1,40($fp)
sll $zero,$zero,0
slt	$v0,$v0,$v1
sll $zero,$zero,0
beq $v0,$zero,_8002029c
lw	$a0,32($fp)
lw	$a1,36($fp)
lw	$a2,40($fp)
sll $zero,$zero,0
jal partions
sll $0,$0,0
sw	$v0,16($fp)
lw	$v1,16($fp)
sll $zero,$zero,0
addiu	$v0,$v1,-1
lw	$a0,32($fp)
lw	$a1,36($fp)
or $a2,$zero,$v0
jal qsort
sll $0,$0,0
lw	$v1,16($fp)
sll $zero,$zero,0
addiu	$v0,$v1,1
lw	$a0,32($fp)
or $a1,$zero,$v0
lw	$a2,40($fp)
sll $zero,$zero,0
jal qsort
sll $0,$0,0
_8002029c:
or $sp,$zero,$fp
lw	$ra,28($sp)
lw	$fp,24($sp)
addiu	$sp,$sp,32
jr	$ra

quicksort:
addiu	$sp,$sp,-24
sw	$ra,20($sp)
sw	$fp,16($sp)
or $fp,$zero,$sp
sw	$a0,24($fp)
sw	$a1,28($fp)
lw	$v1,28($fp)
sll $zero,$zero,0
addiu	$v0,$v1,-1
lw	$a0,24($fp)
or $a1,$zero,$zero
or $a2,$zero,$v0
jal qsort
sll $0,$0,0
or $sp,$zero,$fp
lw	$ra,20($sp)
lw	$fp,16($sp)
addiu	$sp,$sp,24
jr	$ra

main:
addiu	$sp,$sp,-32
sw	$ra,28($sp)
sw	$fp,24($sp)
or $fp,$zero,$sp
ori $v0,$zero,920
sw	$v0,16($fp)
sw	$zero,20($fp)
_80020314:
addiu	$v0,$fp,20
lw	$v1,0($v0)
sll $zero,$zero,0
or $a0,$zero,$v1
addiu	$v1,$v1,1
sw	$v1,0($v0)
slti	$v0,$a0,20
sll $zero,$zero,0
bne $v0,$zero,_80020340
sll $zero,$zero,0
beq $zero,$zero,_80020364
_80020340:
lw	$v0,16($fp)
ori $v1,$zero,17
lw	$a0,20($fp)
sll $zero,$zero,0
subu	$v1,$v1,$a0
sw	$v1,0($v0)
addiu	$v0,$v0,4
sw	$v0,16($fp)
beq $zero,$zero,_80020314
_80020364:
ori $v0,$zero,920
sw	$v0,16($fp)
lw	$a0,16($fp)
ori $a1,$zero,20
jal quicksort
sll $0,$0,0
or $v0,$zero,$zero
beq $zero,$zero,_80020380
_80020380:
or $sp,$zero,$fp
lw	$ra,28($sp)
lw	$fp,24($sp)
addiu	$sp,$sp,32
#jr	$ra

#16=kb 17=dig
addi $4,$zero,0x0000039c
#add $6,$0,$0
#addi $6,$6,0x0000005a
#addi $7,$0,0x0000ffff
lui $1,0x0000000f
ori $7,$1,0x0000ffff
#add $7,$7,$7
addi $11,$0,0x00000010
reset:
add $10,$0,$0
addi $4,$zero,0x0000039c
loop:
lw $17,0($4)
#lw $16,0($15)
#lw $17,0($15)
#beq $16,$6,addr
j tsp
addr:
addi $4,$4,0x00000004
addi $10,$10,1
beq $10,$11,reset
j loop
tsp:
add $8,$0,$0
_time:
nop
beq $8,$7,addr
addi $8,$8,1
j _time
