# Listing 1 - first steps with registers
.text
.globl main
main:
    addi $t0, $zero, 12      # $t0 = $zero + 12
    addi $t1, $zero, 30      # $t1 = $zero + 30
    add  $t2, $t0, $t1       # $t2 = $t0 + $t1
    addi $zero, $zero, 5     # try to put $zero + 5 into $zero
    add  $t3, $zero, $t2     # $t3 = $zero + $t2
    li   $v0, 10             # end of program (see Experiment 3)
    syscall
