# Step 3.3 - Three-month summary
.data
prompt: .asciiz "Enter reading (kWh): "
m1:     .asciiz "Month 1: "
m2:     .asciiz "Month 2: "
m3:     .asciiz "Month 3: "
tot:    .asciiz "Total: "
nl:     .asciiz "\n"

.text
.globl main
main:
    # --- 1. Nhập 4 chỉ số vào $s0, $s1, $s2, $s3 ---
    # reading0 -> $s0
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s0, $v0, $zero

    # reading1 -> $s1
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero

    # reading2 -> $s2
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s2, $v0, $zero

    # reading3 -> $s3
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s3, $v0, $zero

    # --- 2. Tính toán lượng tiêu thụ vào $t0, $t1, $t2, $t3 ---
    sub  $t0, $s1, $s0   # Month 1 = reading1 - reading0
    sub  $t1, $s2, $s1   # Month 2 = reading2 - reading1
    sub  $t2, $s3, $s2   # Month 3 = reading3 - reading2

    add  $t3, $t0, $t1   # Total = Month 1 + Month 2 + Month 3
    add  $t3, $t3, $t2

    # --- 3. In kết quả theo đúng định dạng ---
    # In Month 1
    li   $v0, 4
    la   $a0, m1
    syscall
    li   $v0, 1
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # In Month 2
    li   $v0, 4
    la   $a0, m2
    syscall
    li   $v0, 1
    add  $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # In Month 3
    li   $v0, 4
    la   $a0, m3
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # In Total
    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    add  $a0, $t3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    # Kết thúc
    li   $v0, 10
    syscall