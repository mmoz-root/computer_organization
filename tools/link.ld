OUTPUT_FORMAT("elf32-littleriscv")
OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
    RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 64K
}

PHDRS
{
    text PT_LOAD FLAGS(5);
    data PT_LOAD FLAGS(6);
}

SECTIONS
{
    .text : ALIGN(4)
    {
        KEEP(*(.text.start))
        *(.text .text.*)
    } > RAM :text

    .rodata : ALIGN(4)
    {
        *(.rodata .rodata.* .srodata .srodata.*)
    } > RAM :text

    .data : ALIGN(64)
    {
        *(.data .data.* .sdata .sdata.*)
        KEEP(*(.tohost))
    } > RAM :data

    .bss (NOLOAD) : ALIGN(4)
    {
        __bss_start = .;
        *(.sbss .sbss.* .bss .bss.*)
        *(COMMON)
        . = ALIGN(4);
        __bss_end = .;
    } > RAM :data

    __stack_top = ORIGIN(RAM) + LENGTH(RAM);
    __stack_bottom = __stack_top - 4096;
    ASSERT(__bss_end <= __stack_bottom, "Program overlaps reserved stack")

    .riscv.attributes 0 : { *(.riscv.attributes) } :NONE
    .debug_info      0 : { *(.debug_info) } :NONE
    .debug_abbrev    0 : { *(.debug_abbrev) } :NONE
    .debug_aranges   0 : { *(.debug_aranges) } :NONE
    .debug_line      0 : { *(.debug_line) } :NONE
    .debug_str       0 : { *(.debug_str) } :NONE
    .debug_line_str  0 : { *(.debug_line_str) } :NONE
    .debug_frame    0 : { *(.debug_frame) } :NONE

    /DISCARD/ : { *(.comment) *(.note.GNU-stack) }
}