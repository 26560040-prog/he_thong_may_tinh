# Listing 7 - sum3 with $s0 saved on the stack (Fix B)
sum3:
    addi $sp, $sp, -4           # make room for one word on the stack
    # >>> save $s0 at 0($sp)
    add  $s0, $a0, $a1
    add  $v0, $s0, $a2
    # >>> restore $s0 from 0($sp)
    # >>> give the room back: add 4 to $sp
    jr   $ra
