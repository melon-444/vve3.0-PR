#vve_examples:dice_4/test/cp/rotate_here

execute as @e[tag=dice_4_test,limit=1] run function vve:object/_get
execute as @e[tag=math_marker,limit=1] run function vve:object/_rotate_here
execute as @e[tag=dice_4_test,limit=1] run function vve:object/_store