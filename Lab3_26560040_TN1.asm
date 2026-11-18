# Listing 1 - one procedure, called from two places
.data
title:  .asciiz "SCORE REPORT\n"
endMsg: .asciiz "END\n"
line:   .asciiz "----------\n"
 
.text
.globl main
main:
    li   $v0, 4
    la   $a0, title
    syscall
    jal  sep                # call (1)
    li   $v0, 4
    la   $a0, endMsg
    syscall
    jal  sep                # call (2)
    li   $v0, 10
    syscall
 
# sep: prints a separator line
sep:
    li   $v0, 4
    la   $a0, line
    syscall
    jr   $ra                # return to the caller
