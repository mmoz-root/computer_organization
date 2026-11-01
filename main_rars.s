# Muhammed Mustafa Ozbey | Student ID: 5001230020 | G2 | RV32IM

#Derived from main.c with xPack GCC 15.2.0, C99, -O0, -march=rv32im, -mabi=ilp32, -g0, -fno-pic, -msmall-data-limit=0, -S.
#RARS adaptations: data directives, symbol-address loads, local label names, and main renamed c_main so the wrapper works with Start at main enabled.
#The C algorithm is unchanged. Addresses differ from the Spike executable.

.text
.globl main
main:
    andi sp, sp, -16
    jal ra, c_main
program_done:
    li a7, 93
    ecall

	.text
	.globl	SID
.data
	.align	2
SID:
	.word	1230020
	.globl	grades
.data
	.align	2
grades:
	.space	176
	.globl	bucket
	.align	2
bucket:
	.space	20
	.globl	mean
	.align	2
mean:
	.space	4
	.globl	below_count
	.align	2
below_count:
	.space	4
	.globl	pass_count
	.align	2
pass_count:
	.space	4
	.text
	.align	2
	.globl	mark_grade
mark_grade:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	ori	a5,a5,256
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.align	2
	.globl	c_main
c_main:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	li	a5,1228800
	addi	a5,a5,1220
	sw	a5,-20(s0)
	sw	zero,-28(s0)
	li	a5,1228800
	addi	a3,a5,1220
	li	a5,1717985280
	addi	a5,a5,1639
	mulh	a5,a3,a5
	srai	a4,a5,2
	srai	a5,a3,31
	sub	a4,a4,a5
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	sub	a4,a3,a5
	addi	a5,a4,50
	sw	a5,-32(s0)
	sw	zero,-24(s0)
	j	gcc_L4
gcc_L5:
	lw	a4,-20(s0)
	li	a5,1662976
	addi	a5,a5,1549
	mul	a4,a4,a5
	li	a5,1013903360
	addi	a5,a5,863
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a5,a5,16
	li	a4,1148157952
	addi	a4,a4,1623
	mulhu	a4,a5,a4
	sub	a3,a5,a4
	srli	a3,a3,1
	add	a4,a4,a3
	srli	a4,a4,6
	li	a3,101
	mul	a4,a4,a3
	sub	a4,a5,a4
	mv	a3,a4
    la a5, grades
    addi a4, a5, 0
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a3,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
gcc_L4:
	lw	a4,-24(s0)
	li	a5,43
	ble	a4,a5,gcc_L5
	sw	zero,-24(s0)
	j	gcc_L6
gcc_L13:
    la a5, grades
    addi a4, a5, 0
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-36(s0)
	lw	a4,-28(s0)
	lw	a5,-36(s0)
	add	a5,a4,a5
	sw	a5,-28(s0)
	lw	a4,-36(s0)
	li	a5,49
	bgt	a4,a5,gcc_L7
    la a5, bucket
    addi a5, a5, 0
	lw	a5,0(a5)
	addi	a4,a5,1
    la a5, bucket
    addi a5, a5, 0
	sw	a4,0(a5)
	j	gcc_L8
gcc_L7:
	lw	a4,-36(s0)
	li	a5,64
	bgt	a4,a5,gcc_L9
    la a5, bucket
    addi a5, a5, 0
	lw	a5,4(a5)
	addi	a4,a5,1
    la a5, bucket
    addi a5, a5, 0
	sw	a4,4(a5)
	j	gcc_L8
gcc_L9:
	lw	a4,-36(s0)
	li	a5,74
	bgt	a4,a5,gcc_L10
    la a5, bucket
    addi a5, a5, 0
	lw	a5,8(a5)
	addi	a4,a5,1
    la a5, bucket
    addi a5, a5, 0
	sw	a4,8(a5)
	j	gcc_L8
gcc_L10:
	lw	a4,-36(s0)
	li	a5,84
	bgt	a4,a5,gcc_L11
    la a5, bucket
    addi a5, a5, 0
	lw	a5,12(a5)
	addi	a4,a5,1
    la a5, bucket
    addi a5, a5, 0
	sw	a4,12(a5)
	j	gcc_L8
gcc_L11:
    la a5, bucket
    addi a5, a5, 0
	lw	a5,16(a5)
	addi	a4,a5,1
    la a5, bucket
    addi a5, a5, 0
	sw	a4,16(a5)
gcc_L8:
	lw	a4,-36(s0)
	lw	a5,-32(s0)
	blt	a4,a5,gcc_L12
    la a5, pass_count
    lw a5, 0(a5)
	addi	a4,a5,1
    la a5, pass_count
    sw a4, 0(a5)
gcc_L12:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
gcc_L6:
	lw	a4,-24(s0)
	li	a5,43
	ble	a4,a5,gcc_L13
	lw	a5,-28(s0)
	li	a4,780902400
	addi	a4,a4,745
	mulh	a4,a5,a4
	srai	a4,a4,3
	srai	a5,a5,31
	sub	a4,a4,a5
    la a5, mean
    sw a4, 0(a5)
	sw	zero,-24(s0)
	j	gcc_L14
gcc_L16:
    la a5, grades
    addi a4, a5, 0
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-36(s0)
    la a5, mean
    lw a5, 0(a5)
	lw	a4,-36(s0)
	bge	a4,a5,gcc_L15
    la a5, below_count
    lw a5, 0(a5)
	addi	a4,a5,1
    la a5, below_count
    sw a4, 0(a5)
	lw	a0,-36(s0)
	call	mark_grade
	mv	a3,a0
    la a5, grades
    addi a4, a5, 0
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a3,0(a5)
gcc_L15:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
gcc_L14:
	lw	a4,-24(s0)
	li	a5,43
	ble	a4,a5,gcc_L16
	li	a5,0
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
