add  $a0, $s2, $zero        # parameter 1: a = x ($s2)
addi $a1, $zero, 10         # parameter 2: b = 10
jal  diff                   # called diff(x, 10)
add  $s3, $v0, $zero        # store result return ($v0) in y ($s3)

# return a - b in $v0
diff:
    sub  $v0, $a0, $a1      # $v0 = a - b
    jr   $ra                # return caller 