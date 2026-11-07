	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/Users/ozbey/Desktop/26-27 Fall" "/Users/ozbey/Desktop/26-27 Fall/COMP_ORG/project_comporg/main.c"
	.globl	SID
	.section	.rodata
	.align	2
	.type	SID, @object
	.size	SID, 4
SID:
	.word	1230020
	.globl	grades
	.bss
	.align	2
	.type	grades, @object
	.size	grades, 176
grades:
	.zero	176
	.globl	bucket
	.align	2
	.type	bucket, @object
	.size	bucket, 20
bucket:
	.zero	20
	.globl	mean
	.align	2
	.type	mean, @object
	.size	mean, 4
mean:
	.zero	4
	.globl	below_count
	.align	2
	.type	below_count, @object
	.size	below_count, 4
below_count:
	.zero	4
	.globl	pass_count
	.align	2
	.type	pass_count, @object
	.size	pass_count, 4
pass_count:
	.zero	4
	.text
	.align	2
	.globl	mark_grade
	.type	mark_grade, @function
mark_grade:
.LFB0:
	.file 1 "/Users/ozbey/Desktop/26-27 Fall/COMP_ORG/project_comporg/main.c"
	.loc 1 10 27
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 1 11 18
	lw	a5,-20(s0)
	ori	a5,a5,256
	.loc 1 12 1
	mv	a0,a5
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	mark_grade, .-mark_grade
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 14 15
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 15 22
	li	a5,1228800
	addi	a5,a5,1220
	.loc 1 15 18
	sw	a5,-20(s0)
	.loc 1 17 9
	sw	zero,-28(s0)
	.loc 1 19 20
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
	.loc 1 19 9
	addi	a5,a4,50
	sw	a5,-32(s0)
	.loc 1 21 10
	sw	zero,-24(s0)
	.loc 1 21 5
	j	.L4
.L5:
	.loc 1 22 22
	lw	a4,-20(s0)
	li	a5,1662976
	addi	a5,a5,1549
	mul	a4,a4,a5
	.loc 1 22 11
	li	a5,1013903360
	addi	a5,a5,863
	add	a5,a4,a5
	sw	a5,-20(s0)
	.loc 1 23 29
	lw	a5,-20(s0)
	srli	a5,a5,16
	.loc 1 23 35
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
	.loc 1 23 20
	mv	a3,a4
	.loc 1 23 18
	lui	a5,%hi(grades)
	addi	a4,a5,%lo(grades)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a3,0(a5)
	.loc 1 21 20 discriminator 3
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L4:
	.loc 1 21 15 discriminator 1
	lw	a4,-24(s0)
	li	a5,43
	ble	a4,a5,.L5
	.loc 1 26 10
	sw	zero,-24(s0)
	.loc 1 26 5
	j	.L6
.L13:
	.loc 1 27 15
	lui	a5,%hi(grades)
	addi	a4,a5,%lo(grades)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-36(s0)
	.loc 1 28 13
	lw	a4,-28(s0)
	lw	a5,-36(s0)
	add	a5,a4,a5
	sw	a5,-28(s0)
	.loc 1 30 11
	lw	a4,-36(s0)
	li	a5,49
	bgt	a4,a5,.L7
	.loc 1 31 19
	lui	a5,%hi(bucket)
	addi	a5,a5,%lo(bucket)
	lw	a5,0(a5)
	.loc 1 31 22
	addi	a4,a5,1
	lui	a5,%hi(bucket)
	addi	a5,a5,%lo(bucket)
	sw	a4,0(a5)
	j	.L8
.L7:
	.loc 1 33 17
	lw	a4,-36(s0)
	li	a5,64
	bgt	a4,a5,.L9
	.loc 1 34 19
	lui	a5,%hi(bucket)
	addi	a5,a5,%lo(bucket)
	lw	a5,4(a5)
	.loc 1 34 22
	addi	a4,a5,1
	lui	a5,%hi(bucket)
	addi	a5,a5,%lo(bucket)
	sw	a4,4(a5)
	j	.L8
.L9:
	.loc 1 36 16
	lw	a4,-36(s0)
	li	a5,74
	bgt	a4,a5,.L10
	.loc 1 37 19
	lui	a5,%hi(bucket)
	addi	a5,a5,%lo(bucket)
	lw	a5,8(a5)
	.loc 1 37 22
	addi	a4,a5,1
	lui	a5,%hi(bucket)
	addi	a5,a5,%lo(bucket)
	sw	a4,8(a5)
	j	.L8
.L10:
	.loc 1 39 16
	lw	a4,-36(s0)
	li	a5,84
	bgt	a4,a5,.L11
	.loc 1 40 19
	lui	a5,%hi(bucket)
	addi	a5,a5,%lo(bucket)
	lw	a5,12(a5)
	.loc 1 40 22
	addi	a4,a5,1
	lui	a5,%hi(bucket)
	addi	a5,a5,%lo(bucket)
	sw	a4,12(a5)
	j	.L8
.L11:
	.loc 1 43 19
	lui	a5,%hi(bucket)
	addi	a5,a5,%lo(bucket)
	lw	a5,16(a5)
	.loc 1 43 22
	addi	a4,a5,1
	lui	a5,%hi(bucket)
	addi	a5,a5,%lo(bucket)
	sw	a4,16(a5)
.L8:
	.loc 1 46 12
	lw	a4,-36(s0)
	lw	a5,-32(s0)
	blt	a4,a5,.L12
	.loc 1 47 23
	lui	a5,%hi(pass_count)
	lw	a5,%lo(pass_count)(a5)
	addi	a4,a5,1
	lui	a5,%hi(pass_count)
	sw	a4,%lo(pass_count)(a5)
.L12:
	.loc 1 26 22 discriminator 2
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L6:
	.loc 1 26 16 discriminator 1
	lw	a4,-24(s0)
	li	a5,43
	ble	a4,a5,.L13
	.loc 1 50 16
	lw	a5,-28(s0)
	li	a4,780902400
	addi	a4,a4,745
	mulh	a4,a5,a4
	srai	a4,a4,3
	srai	a5,a5,31
	sub	a4,a4,a5
	.loc 1 50 10
	lui	a5,%hi(mean)
	sw	a4,%lo(mean)(a5)
	.loc 1 51 11
	sw	zero,-24(s0)
	.loc 1 51 5
	j	.L14
.L16:
	.loc 1 52 15
	lui	a5,%hi(grades)
	addi	a4,a5,%lo(grades)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-36(s0)
	.loc 1 54 17
	lui	a5,%hi(mean)
	lw	a5,%lo(mean)(a5)
	.loc 1 54 11
	lw	a4,-36(s0)
	bge	a4,a5,.L15
	.loc 1 55 24
	lui	a5,%hi(below_count)
	lw	a5,%lo(below_count)(a5)
	addi	a4,a5,1
	lui	a5,%hi(below_count)
	sw	a4,%lo(below_count)(a5)
	.loc 1 56 25
	lw	a0,-36(s0)
	call	mark_grade
	mv	a3,a0
	.loc 1 56 23 discriminator 1
	lui	a5,%hi(grades)
	addi	a4,a5,%lo(grades)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a3,0(a5)
.L15:
	.loc 1 51 22 discriminator 2
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L14:
	.loc 1 51 17 discriminator 1
	lw	a4,-24(s0)
	li	a5,43
	ble	a4,a5,.L16
	.loc 1 59 12
	li	a5,0
	.loc 1 60 1
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x13a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0xc
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x6
	.string	"SID"
	.byte	0x1
	.byte	0x3
	.byte	0xb
	.4byte	0x3f
	.uleb128 0x5
	.byte	0x3
	.4byte	SID
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x8
	.4byte	0x38
	.uleb128 0x3
	.4byte	0x38
	.4byte	0x54
	.uleb128 0x4
	.4byte	0x54
	.byte	0x2b
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x1
	.4byte	.LASF3
	.byte	0x4
	.4byte	0x44
	.uleb128 0x5
	.byte	0x3
	.4byte	grades
	.uleb128 0x3
	.4byte	0x38
	.4byte	0x7b
	.uleb128 0x4
	.4byte	0x54
	.byte	0x4
	.byte	0
	.uleb128 0x1
	.4byte	.LASF4
	.byte	0x5
	.4byte	0x6b
	.uleb128 0x5
	.byte	0x3
	.4byte	bucket
	.uleb128 0x1
	.4byte	.LASF5
	.byte	0x6
	.4byte	0x38
	.uleb128 0x5
	.byte	0x3
	.4byte	mean
	.uleb128 0x1
	.4byte	.LASF6
	.byte	0x7
	.4byte	0x38
	.uleb128 0x5
	.byte	0x3
	.4byte	below_count
	.uleb128 0x1
	.4byte	.LASF7
	.byte	0x8
	.4byte	0x38
	.uleb128 0x5
	.byte	0x3
	.4byte	pass_count
	.uleb128 0xa
	.4byte	.LASF10
	.byte	0x1
	.byte	0xe
	.byte	0x5
	.4byte	0x38
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x117
	.uleb128 0x2
	.string	"x"
	.byte	0xf
	.byte	0x12
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.string	"i"
	.byte	0x10
	.byte	0x9
	.4byte	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"sum"
	.byte	0x11
	.byte	0x9
	.4byte	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.4byte	.LASF8
	.byte	0x1
	.byte	0x12
	.byte	0x9
	.4byte	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.string	"p"
	.byte	0x13
	.byte	0x9
	.4byte	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xc
	.4byte	.LASF11
	.byte	0x1
	.byte	0xa
	.byte	0x5
	.4byte	0x38
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF8
	.byte	0x1
	.byte	0xa
	.byte	0x14
	.4byte	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"unsigned int"
.LASF7:
	.string	"pass_count"
.LASF11:
	.string	"mark_grade"
.LASF8:
	.string	"grade"
.LASF10:
	.string	"main"
.LASF5:
	.string	"mean"
.LASF6:
	.string	"below_count"
.LASF3:
	.string	"grades"
.LASF4:
	.string	"bucket"
.LASF9:
	.string	"GNU C99 15.2.0 -mabi=ilp32 -mno-small-data-limit=0 -misa-spec=20191213 -march=rv32im_zmmul -g -O0 -std=c99 -fno-pic"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/Users/ozbey/Desktop/26-27 Fall"
.LASF0:
	.string	"/Users/ozbey/Desktop/26-27 Fall/COMP_ORG/project_comporg/main.c"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC arm64) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
