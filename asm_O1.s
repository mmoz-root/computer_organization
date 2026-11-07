	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	mark_grade
	.type	mark_grade, @function
mark_grade:
.LVL0:
.LFB0:
.LM1:
	.cfi_startproc
.LM2:
.LM3:
	ori	a0,a0,256
.LVL1:
.LM4:
	ret
	.cfi_endproc
.LFE0:
	.size	mark_grade, .-mark_grade
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
.LM5:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	sw	s1,24(sp)
	sw	s2,20(sp)
	sw	s3,16(sp)
	sw	s4,12(sp)
	sw	s5,8(sp)
	sw	s6,4(sp)
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	.cfi_offset 18, -12
	.cfi_offset 19, -16
	.cfi_offset 20, -20
	.cfi_offset 21, -24
	.cfi_offset 22, -28
.LM6:
.LM7:
.LM8:
.LVL2:
.LM9:
.LM10:
.LM11:
.LM12:
	lui	a2,%hi(.LANCHOR0)
	addi	a2,a2,%lo(.LANCHOR0)
	addi	a6,a2,176
.LM13:
	mv	a1,a2
.LM14:
	li	a3,1228800
	addi	a3,a3,1220
.LM15:
	li	t3,1662976
	addi	t3,t3,1549
.LM16:
	li	t1,1013903360
	addi	t1,t1,863
.LM17:
	li	a7,1148157952
	addi	a7,a7,1623
	li	t4,101
.LVL3:
.L3:
.LM18:
.LM19:
	mul	a3,a3,t3
.LVL4:
.LM20:
	add	a3,a3,t1
.LVL5:
.LM21:
.LM22:
	srli	a4,a3,16
.LM23:
	mulhu	a5,a4,a7
	sub	a0,a4,a5
	srli	a0,a0,1
	add	a5,a5,a0
	srli	a5,a5,6
	mul	a5,a5,t4
	sub	a4,a4,a5
.LM24:
	sw	a4,0(a1)
.LM25:
.LM26:
	addi	a1,a1,4
	bne	a6,a1,.L3
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lw	s3,192(a5)
	lw	s2,188(a5)
	lw	t2,184(a5)
	lw	t5,180(a5)
	lw	a7,196(a5)
	lw	a0,176(a5)
	mv	a5,a2
	li	t4,0
	li	s6,0
	li	s5,0
	li	s1,0
	li	t0,0
	li	t3,0
.LM27:
	li	a3,0
.LVL6:
.LM28:
	li	t1,49
.LM29:
	li	t6,64
.LM30:
	li	a1,1
.LM31:
	li	s0,74
.LM32:
	li	s4,84
	j	.L10
.LVL7:
.L4:
.LM33:
.LM34:
	bgt	a4,t6,.L6
.LM35:
.LM36:
	addi	t5,t5,1
	mv	t0,a1
.L7:
.LM37:
.LM38:
.LM39:
	addi	a7,a7,1
	mv	t4,a1
.L5:
.LM40:
.LM41:
	addi	a5,a5,4
	beq	a6,a5,.L25
.LVL8:
.L10:
.LM42:
.LM43:
	lw	a4,0(a5)
.LVL9:
.LM44:
.LM45:
	add	a3,a3,a4
.LVL10:
.LM46:
.LM47:
	bgt	a4,t1,.L4
.LM48:
.LM49:
	addi	a0,a0,1
.LM50:
.LM51:
	mv	t3,a1
	j	.L5
.L6:
.LM52:
.LM53:
	bgt	a4,s0,.L8
.LM54:
.LM55:
	addi	t2,t2,1
	mv	s1,a1
	j	.L7
.L8:
.LM56:
.LM57:
	bgt	a4,s4,.L9
.LM58:
.LM59:
	addi	s2,s2,1
	mv	s5,a1
	j	.L7
.L9:
.LM60:
.LM61:
	addi	s3,s3,1
	mv	s6,a1
	j	.L7
.L25:
.LM62:
	beq	t4,zero,.L11
	lui	a5,%hi(.LANCHOR0+196)
	sw	a7,%lo(.LANCHOR0+196)(a5)
.L11:
	beq	s6,zero,.L12
	lui	a5,%hi(.LANCHOR0+192)
	sw	s3,%lo(.LANCHOR0+192)(a5)
.L12:
	beq	s5,zero,.L13
	lui	a5,%hi(.LANCHOR0+188)
	sw	s2,%lo(.LANCHOR0+188)(a5)
.L13:
	beq	s1,zero,.L14
	lui	a5,%hi(.LANCHOR0+184)
	sw	t2,%lo(.LANCHOR0+184)(a5)
.L14:
	beq	t0,zero,.L15
	lui	a5,%hi(.LANCHOR0+180)
	sw	t5,%lo(.LANCHOR0+180)(a5)
.L15:
	beq	t3,zero,.L16
	lui	a5,%hi(.LANCHOR0+176)
	sw	a0,%lo(.LANCHOR0+176)(a5)
.L16:
.LM63:
.LM64:
	li	a4,780902400
.LVL11:
.LM65:
	addi	a4,a4,745
	mulh	a4,a3,a4
	srai	a4,a4,3
	srai	a3,a3,31
.LVL12:
.LM66:
	sub	a4,a4,a3
.LM67:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	sw	a4,200(a5)
.LM68:
.LVL13:
.LM69:
	lw	a3,204(a5)
.LM70:
	li	a1,0
.LM71:
	li	a0,1
	j	.L18
.LVL14:
.L17:
.LM72:
.LM73:
	addi	a2,a2,4
	beq	a6,a2,.L26
.LVL15:
.L18:
.LM74:
.LM75:
	lw	a5,0(a2)
.LVL16:
.LM76:
.LM77:
	ble	a4,a5,.L17
.LM78:
.LM79:
	addi	a3,a3,1
.LM80:
.LVL17:
.LBB4:
.LBI4:
.LM81:
.LBB5:
.LM82:
.LM83:
	ori	a5,a5,256
.LVL18:
.LM84:
.LBE5:
.LBE4:
.LM85:
	sw	a5,0(a2)
.LVL19:
.LM86:
	mv	a1,a0
	j	.L17
.L26:
	beq	a1,zero,.L20
	lui	a5,%hi(.LANCHOR0+204)
	sw	a3,%lo(.LANCHOR0+204)(a5)
.LM87:
.L20:
.LM88:
	li	a0,0
	lw	s0,28(sp)
	.cfi_restore 8
	lw	s1,24(sp)
	.cfi_restore 9
	lw	s2,20(sp)
	.cfi_restore 18
	lw	s3,16(sp)
	.cfi_restore 19
	lw	s4,12(sp)
	.cfi_restore 20
	lw	s5,8(sp)
	.cfi_restore 21
	lw	s6,4(sp)
	.cfi_restore 22
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	pass_count
	.globl	below_count
	.globl	mean
	.globl	bucket
	.globl	grades
	.globl	SID
	.section	.rodata
	.align	2
	.type	SID, @object
	.size	SID, 4
SID:
	.word	1230020
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	grades, @object
	.size	grades, 176
grades:
	.zero	176
	.type	bucket, @object
	.size	bucket, 20
bucket:
	.zero	20
	.type	pass_count, @object
	.size	pass_count, 4
pass_count:
	.zero	4
	.type	mean, @object
	.size	mean, 4
mean:
	.zero	4
	.type	below_count, @object
	.size	below_count, 4
below_count:
	.zero	4
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x18a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0xc
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x3
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x4
	.4byte	.LASF3
	.uleb128 0x8
	.string	"SID"
	.byte	0x1
	.byte	0x3
	.byte	0xb
	.4byte	0x4b
	.uleb128 0x5
	.byte	0x3
	.4byte	SID
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xa
	.4byte	0x44
	.uleb128 0x4
	.4byte	0x44
	.4byte	0x60
	.uleb128 0x5
	.4byte	0x2c
	.byte	0x2b
	.byte	0
	.uleb128 0x1
	.4byte	.LASF4
	.byte	0x4
	.4byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	grades
	.uleb128 0x4
	.4byte	0x44
	.4byte	0x80
	.uleb128 0x5
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0x1
	.4byte	.LASF5
	.byte	0x5
	.4byte	0x70
	.uleb128 0x5
	.byte	0x3
	.4byte	bucket
	.uleb128 0x1
	.4byte	.LASF6
	.byte	0x6
	.4byte	0x44
	.uleb128 0x5
	.byte	0x3
	.4byte	mean
	.uleb128 0x1
	.4byte	.LASF7
	.byte	0x7
	.4byte	0x44
	.uleb128 0x5
	.byte	0x3
	.4byte	below_count
	.uleb128 0x1
	.4byte	.LASF8
	.byte	0x8
	.4byte	0x44
	.uleb128 0x5
	.byte	0x3
	.4byte	pass_count
	.uleb128 0xb
	.4byte	.LASF11
	.byte	0x1
	.byte	0xe
	.byte	0x5
	.4byte	0x44
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x152
	.uleb128 0x2
	.string	"x"
	.byte	0xf
	.byte	0x12
	.4byte	0x2c
	.4byte	.LLST1
	.4byte	.LVUS1
	.uleb128 0x2
	.string	"i"
	.byte	0x10
	.byte	0x9
	.4byte	0x44
	.4byte	.LLST2
	.4byte	.LVUS2
	.uleb128 0x2
	.string	"sum"
	.byte	0x11
	.byte	0x9
	.4byte	0x44
	.4byte	.LLST3
	.4byte	.LVUS3
	.uleb128 0xc
	.4byte	.LASF9
	.byte	0x1
	.byte	0x12
	.byte	0x9
	.4byte	0x44
	.4byte	.LLST4
	.4byte	.LVUS4
	.uleb128 0xd
	.string	"p"
	.byte	0x1
	.byte	0x13
	.byte	0x9
	.4byte	0x44
	.byte	0x32
	.uleb128 0xe
	.4byte	0x152
	.4byte	.LBI4
	.byte	0x4c
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x1
	.byte	0x38
	.byte	0x19
	.uleb128 0x6
	.4byte	0x163
	.4byte	.LLST5
	.4byte	.LVUS5
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	.LASF12
	.byte	0x1
	.byte	0xa
	.byte	0x5
	.4byte	0x44
	.byte	0x1
	.4byte	0x170
	.uleb128 0x10
	.4byte	.LASF9
	.byte	0x1
	.byte	0xa
	.byte	0x14
	.4byte	0x44
	.byte	0
	.uleb128 0x11
	.4byte	0x152
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	0x163
	.4byte	.LLST0
	.4byte	.LVUS0
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
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x2138
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x57
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LVUS1:
	.uleb128 0x7
	.uleb128 0xd
	.uleb128 0xd
	.uleb128 0xf
	.uleb128 0x10
	.uleb128 0x17
.LLST1:
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LVL3-.Ltext0
	.uleb128 0x6
	.byte	0xc
	.4byte	0x12c4c4
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL3-.Ltext0
	.uleb128 .LVL4-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0x4
	.uleb128 .LVL5-.Ltext0
	.uleb128 .LVL6-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LVUS2:
	.uleb128 0x7
	.uleb128 0xd
	.uleb128 0x40
	.uleb128 0x43
.LLST2:
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LVL3-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL13-.Ltext0
	.uleb128 .LVL14-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LVUS3:
	.uleb128 0x4
	.uleb128 0x1c
	.uleb128 0x1c
	.uleb128 0x3d
.LLST3:
	.byte	0x4
	.uleb128 .LVL2-.Ltext0
	.uleb128 .LVL7-.Ltext0
	.uleb128 0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x4
	.uleb128 .LVL7-.Ltext0
	.uleb128 .LVL12-.Ltext0
	.uleb128 0x1
	.byte	0x5d
	.byte	0
.LVUS4:
	.uleb128 0x1c
	.uleb128 0x25
	.uleb128 0x27
	.uleb128 0x3c
	.uleb128 0x47
	.uleb128 0x4f
	.uleb128 0x4f
	.uleb128 0x51
.LLST4:
	.byte	0x4
	.uleb128 .LVL7-.Ltext0
	.uleb128 .LVL8-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL9-.Ltext0
	.uleb128 .LVL11-.Ltext0
	.uleb128 0x1
	.byte	0x5e
	.byte	0x4
	.uleb128 .LVL16-.Ltext0
	.uleb128 .LVL18-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0x4
	.uleb128 .LVL18-.Ltext0
	.uleb128 .LVL19-.Ltext0
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
.LVUS5:
	.uleb128 0x4c
	.uleb128 0x4e
.LLST5:
	.byte	0x4
	.uleb128 .LVL17-.Ltext0
	.uleb128 .LVL17-.Ltext0
	.uleb128 0x1
	.byte	0x5f
	.byte	0
.LVUS0:
	.uleb128 0
	.uleb128 0x3
	.uleb128 0x3
	.uleb128 0
.LLST0:
	.byte	0x4
	.uleb128 .LVL0-.Ltext0
	.uleb128 .LVL1-.Ltext0
	.uleb128 0x1
	.byte	0x5a
	.byte	0x4
	.uleb128 .LVL1-.Ltext0
	.uleb128 .LFE0-.Ltext0
	.uleb128 0xa
	.byte	0xa3
	.uleb128 0x3
	.byte	0xa5
	.uleb128 0xa
	.uleb128 0x26
	.byte	0xa8
	.uleb128 0x2c
	.byte	0xa8
	.uleb128 0
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
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
	.4byte	.LELT0-.LSLT0
.LSLT0:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	.LELTP0-.LASLTP0
.LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf2
	.byte	0xd
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x1f
	.uleb128 0x2
	.4byte	.LASF1
	.4byte	.LASF13
	.byte	0x2
	.uleb128 0x1
	.uleb128 0x1f
	.uleb128 0x2
	.uleb128 0xb
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0
	.4byte	.LASF14
	.byte	0x1
.LELTP0:
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM1
	.byte	0x20
	.byte	0x5
	.uleb128 0x1b
	.byte	0x9
	.2byte	.LM2-.LM1
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM3-.LM2
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0x9
	.2byte	.LM4-.LM3
	.byte	0x1
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	.LM5
	.byte	0x6
	.byte	0x19
	.byte	0x5
	.uleb128 0xf
	.byte	0x9
	.2byte	.LM6-.LM5
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM7-.LM6
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM8-.LM7
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM9-.LM8
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM10-.LM9
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM11-.LM10
	.byte	0x19
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM12-.LM11
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0x9
	.2byte	.LM13-.LM12
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x6
	.byte	0x10
	.byte	0x5
	.uleb128 0xf
	.byte	0x9
	.2byte	.LM14-.LM13
	.byte	0x18
	.byte	0x5
	.uleb128 0x12
	.byte	0x9
	.2byte	.LM15-.LM14
	.byte	0x1e
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM16-.LM15
	.byte	0x1
	.byte	0x5
	.uleb128 0xb
	.byte	0x9
	.2byte	.LM17-.LM16
	.byte	0x18
	.byte	0x5
	.uleb128 0x23
	.byte	0x9
	.2byte	.LM18-.LM17
	.byte	0x6
	.byte	0x16
	.byte	0x5
	.uleb128 0x9
	.byte	0x9
	.2byte	.LM19-.LM18
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM20-.LM19
	.byte	0x1
	.byte	0x5
	.uleb128 0xb
	.byte	0x9
	.2byte	.LM21-.LM20
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0x9
	.byte	0x9
	.2byte	.LM22-.LM21
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x1d
	.byte	0x9
	.2byte	.LM23-.LM22
	.byte	0x1
	.byte	0x5
	.uleb128 0x23
	.byte	0x9
	.2byte	.LM24-.LM23
	.byte	0x1
	.byte	0x5
	.uleb128 0x12
	.byte	0x9
	.2byte	.LM25-.LM24
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x3
	.byte	0x6
	.byte	0x15
	.byte	0x5
	.uleb128 0x14
	.byte	0x9
	.2byte	.LM26-.LM25
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0x9
	.2byte	.LM27-.LM26
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x6
	.byte	0x13
	.byte	0x5
	.uleb128 0x9
	.byte	0x9
	.2byte	.LM28-.LM27
	.byte	0x24
	.byte	0x5
	.uleb128 0xb
	.byte	0x9
	.2byte	.LM29-.LM28
	.byte	0x1a
	.byte	0x5
	.uleb128 0x11
	.byte	0x9
	.2byte	.LM30-.LM29
	.byte	0x25
	.byte	0x5
	.uleb128 0x17
	.byte	0x9
	.2byte	.LM31-.LM30
	.byte	0x3
	.sleb128 -11
	.byte	0x1
	.byte	0x5
	.uleb128 0x10
	.byte	0x9
	.2byte	.LM32-.LM31
	.byte	0x1a
	.byte	0x5
	.uleb128 0x10
	.byte	0x9
	.2byte	.LM33-.LM32
	.byte	0x6
	.byte	0x11
	.byte	0x5
	.uleb128 0xe
	.byte	0x9
	.2byte	.LM34-.LM33
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x11
	.byte	0x9
	.2byte	.LM35-.LM34
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0xd
	.byte	0x9
	.2byte	.LM36-.LM35
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM37-.LM36
	.byte	0x6
	.byte	0x23
	.byte	0x5
	.uleb128 0x9
	.byte	0x9
	.2byte	.LM38-.LM37
	.byte	0x18
	.byte	0x5
	.uleb128 0xd
	.byte	0x9
	.2byte	.LM39-.LM38
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x17
	.byte	0x9
	.2byte	.LM40-.LM39
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x2
	.byte	0x6
	.byte	0x3
	.sleb128 -21
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM41-.LM40
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0x10
	.byte	0x9
	.2byte	.LM42-.LM41
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x18
	.byte	0x5
	.uleb128 0x9
	.byte	0x9
	.2byte	.LM43-.LM42
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0x9
	.2byte	.LM44-.LM43
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0x9
	.byte	0x9
	.2byte	.LM45-.LM44
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0xd
	.byte	0x9
	.2byte	.LM46-.LM45
	.byte	0x6
	.byte	0x19
	.byte	0x5
	.uleb128 0x9
	.byte	0x9
	.2byte	.LM47-.LM46
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0xb
	.byte	0x9
	.2byte	.LM48-.LM47
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0xd
	.byte	0x9
	.2byte	.LM49-.LM48
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM50-.LM49
	.byte	0x6
	.byte	0x26
	.byte	0x5
	.uleb128 0x9
	.byte	0x9
	.2byte	.LM51-.LM50
	.byte	0x6
	.byte	0x3
	.sleb128 -15
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM52-.LM51
	.byte	0x6
	.byte	0x1c
	.byte	0x5
	.uleb128 0xe
	.byte	0x9
	.2byte	.LM53-.LM52
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x10
	.byte	0x9
	.2byte	.LM54-.LM53
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0xd
	.byte	0x9
	.2byte	.LM55-.LM54
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM56-.LM55
	.byte	0x6
	.byte	0x19
	.byte	0x5
	.uleb128 0xe
	.byte	0x9
	.2byte	.LM57-.LM56
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x10
	.byte	0x9
	.2byte	.LM58-.LM57
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0xd
	.byte	0x9
	.2byte	.LM59-.LM58
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM60-.LM59
	.byte	0x6
	.byte	0x1a
	.byte	0x5
	.uleb128 0xd
	.byte	0x9
	.2byte	.LM61-.LM60
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM62-.LM61
	.byte	0x1
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM63-.LM62
	.byte	0x6
	.byte	0x1e
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM64-.LM63
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x10
	.byte	0x9
	.2byte	.LM65-.LM64
	.byte	0x1
	.byte	0x5
	.uleb128 0x10
	.byte	0x9
	.2byte	.LM66-.LM65
	.byte	0x1
	.byte	0x5
	.uleb128 0x10
	.byte	0x9
	.2byte	.LM67-.LM66
	.byte	0x1
	.byte	0x5
	.uleb128 0xa
	.byte	0x9
	.2byte	.LM68-.LM67
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM69-.LM68
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0x11
	.byte	0x9
	.2byte	.LM70-.LM69
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x6
	.byte	0x16
	.byte	0x5
	.uleb128 0xa
	.byte	0x9
	.2byte	.LM71-.LM70
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1d
	.byte	0x5
	.uleb128 0x17
	.byte	0x9
	.2byte	.LM72-.LM71
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x2
	.byte	0x6
	.byte	0x12
	.byte	0x5
	.uleb128 0x16
	.byte	0x9
	.2byte	.LM73-.LM72
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x5
	.uleb128 0x11
	.byte	0x9
	.2byte	.LM74-.LM73
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x18
	.byte	0x5
	.uleb128 0x9
	.byte	0x9
	.2byte	.LM75-.LM74
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0xf
	.byte	0x9
	.2byte	.LM76-.LM75
	.byte	0x6
	.byte	0x19
	.byte	0x5
	.uleb128 0x9
	.byte	0x9
	.2byte	.LM77-.LM76
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0xb
	.byte	0x9
	.2byte	.LM78-.LM77
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0xd
	.byte	0x9
	.2byte	.LM79-.LM78
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x18
	.byte	0x9
	.2byte	.LM80-.LM79
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0xd
	.byte	0x9
	.2byte	.LM81-.LM80
	.byte	0x3
	.sleb128 -46
	.byte	0x1
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM82-.LM81
	.byte	0x18
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM83-.LM82
	.byte	0x6
	.byte	0x1
	.byte	0x5
	.uleb128 0x12
	.byte	0x9
	.2byte	.LM84-.LM83
	.byte	0x1
	.byte	0x5
	.uleb128 0x12
	.byte	0x9
	.2byte	.LM85-.LM84
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0x1
	.byte	0x44
	.byte	0x5
	.uleb128 0x17
	.byte	0x9
	.2byte	.LM86-.LM85
	.byte	0x1
	.byte	0x5
	.uleb128 0x17
	.byte	0x9
	.2byte	.LM87-.LM86
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.uleb128 0
	.byte	0x6
	.byte	0x1a
	.byte	0x5
	.uleb128 0x5
	.byte	0x9
	.2byte	.LM88-.LM87
	.byte	0x6
	.byte	0x18
	.byte	0x5
	.uleb128 0x1
	.byte	0
	.uleb128 0x5
	.byte	0x2
	.4byte	.Letext0
	.byte	0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF3:
	.string	"unsigned int"
.LASF8:
	.string	"pass_count"
.LASF10:
	.string	"GNU C99 15.2.0 -mabi=ilp32 -mno-small-data-limit=0 -misa-spec=20191213 -march=rv32im_zmmul -g -O1 -std=c99 -fno-pic"
.LASF12:
	.string	"mark_grade"
.LASF9:
	.string	"grade"
.LASF11:
	.string	"main"
.LASF2:
	.string	"long long unsigned int"
.LASF6:
	.string	"mean"
.LASF7:
	.string	"below_count"
.LASF4:
	.string	"grades"
.LASF5:
	.string	"bucket"
	.section	.debug_line_str,"MS",@progbits,1
.LASF13:
	.string	"/Users/ozbey/Desktop/26-27 Fall/COMP_ORG/project_comporg"
.LASF14:
	.string	"main.c"
.LASF1:
	.string	"/Users/ozbey/Desktop/26-27 Fall"
.LASF0:
	.string	"/Users/ozbey/Desktop/26-27 Fall/COMP_ORG/project_comporg/main.c"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC arm64) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
