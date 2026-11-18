# Listing 0 - quick check: a first procedure
.text
.globl main
main:
    addi $a0, $zero, 7      # x = 7
    jal  twice              # call twice(7)
    add  $a0, $v0, $zero    # the result comes back in $v0
    li   $v0, 1             # print integer
    syscall
    li   $v0, 10            # exit
    syscall
 
# twice(x): returns x + x in $v0
twice:
    add  $v0, $a0, $a0
    jr   $ra
