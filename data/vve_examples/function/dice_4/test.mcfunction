#vve_examples:dice_4/test

scoreboard players set roll int 0
execute as @p positioned 199 -55 56 rotated 0.0 0.0 \
	anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_4/_quat_test

scoreboard players set roll int 1
execute as @p positioned 199 -55 56 rotated 0.0 0.0 \
	anchored eyes positioned ^ ^1.0 ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_4/_quat_test

scoreboard players set roll int 2
execute as @p positioned 199 -55 56 rotated 0.0 0.0 \
	anchored eyes positioned ^ ^2.0 ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_4/_quat_test

scoreboard players set roll int 3
execute as @p positioned 199 -55 56 rotated 0.0 0.0 \
	anchored eyes positioned ^ ^3.0 ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_4/_quat_test