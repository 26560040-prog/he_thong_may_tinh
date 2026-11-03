# Listing 6 - energy used between two readings
.data
prompt1: .asciiz "Enter previous reading (kWh): "
prompt2: .asciiz "Enter current reading (kWh): "
label:   .asciiz "Usage (kWh) : "
newline: .asciiz "\n"

.text
.globl main
main:
    # --- read the previous reading into $s0 ---
    li   $v0, 4
    la   $a0, prompt1
    syscall
    li   $v0, 5          # service 5: read integer, result in $v0
    syscall
    add  $s0, $v0, $zero # keep the value in $s0

    # >>> read the current reading into $s1 (print prompt2, then service 5)
    li   $v0, 4
    la   $a0, prompt2
    syscall
    li   $v0, 5          # read integer
    syscall
    add  $s1, $v0, $zero # keep the value in $s1

    # >>> usage = current - previous, into $t0
    sub  $t0, $s1, $s0   # $t0 = $s1 - $s0 (1350 - 1200 = 150)

    # >>> print label, then the usage (service 1), then newline
    # 1. Print label
    li   $v0, 4
    la   $a0, label
    syscall

    # 2. Print usage integer ($t0)
    li   $v0, 1
    add  $a0, $t0, $zero
    syscall

    # 3. Print newline
    li   $v0, 4
    la   $a0, newline
    syscall

    # Exit program
    li   $v0, 10
    syscall