# Listing 1 extended - two procedures: sep and stars
.data
title:    .asciiz "SCORE REPORT\n"
endMsg:   .asciiz "END\n"
line:     .asciiz "----------\n"
starLine: .asciiz "**********\n"

.text
.globl main
main:
    jal stars           # In dòng 1: **********
    
    li $v0, 4
    la $a0, title
    syscall             # In dòng 2: SCORE REPORT
    
    jal sep             # In dòng 3: ----------
    
    li $v0, 4
    la $a0, endMsg
    syscall             # In dòng 4: END
    
    jal stars           # In dòng 5: **********
    
    li $v0, 10
    syscall             # Kết thúc chương trình

# sep: prints a separator line
sep:
    li $v0, 4
    la $a0, line
    syscall
    jr $ra              # return to the caller

# stars: prints a line of asterisks
stars:
    li $v0, 4
    la $a0, starLine
    syscall
    jr $ra              # return to the caller