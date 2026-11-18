# Listing 5 - count_pass, to be added to your TN3 file
# count_pass(addr = $a0, n = $a1, mark = $a2): count of words >= mark
count_pass:
    addi $v0, $zero, 0          # count = 0
    addi $t0, $zero, 0          # i = 0
cp_loop:
    # >>> leave the loop (go to cp_end) when i >= n
    # >>> $t3 = element i (its address is $a0 + 4 * i)
    # >>> if $t3 >= mark, count = count + 1
    addi $t0, $t0, 1            # i = i + 1
    j    cp_loop
cp_end:
    jr   $ra
