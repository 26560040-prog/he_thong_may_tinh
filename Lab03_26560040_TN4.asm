# Listing 6 - a procedure that breaks the convention
.text
.globl main
main:
    addi $s0, $zero, 2          # $s0 = class number, still needed later
    addi $a0, $zero, 8          # three marks of one student
    addi $a1, $zero, 7
    addi $a2, $zero, 9
    jal  sum3                   # $v0 = 8 + 7 + 9
    add  $s1, $v0, $zero        # $s1 = the sum
    add  $a0, $s0, $zero        # print the class number
    li   $v0, 1
    syscall
    li   $v0, 11                # print a space (ASCII 32)
    addi $a0, $zero, 32
    syscall
    add  $a0, $s1, $zero        # print the sum
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall
 
# sum3(a = $a0, b = $a1, c = $a2): returns a + b + c in $v0
sum3:
    add  $s0, $a0, $a1          # $s0 is used as a work register
    add  $v0, $s0, $a2
    jr   $ra
