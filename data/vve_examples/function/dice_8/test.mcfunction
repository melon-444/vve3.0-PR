#vve_examples:dice_8/test

scoreboard players set roll int 0
execute anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_8/_quat_test

scoreboard players set roll int 1
execute positioned ~ ~1.0 ~ anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_8/_quat_test

scoreboard players set roll int 2
execute positioned ~ ~2.0 ~ anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_8/_quat_test

scoreboard players set roll int 3
execute positioned ~ ~3.0 ~ anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_8/_quat_test

scoreboard players set roll int 4
execute positioned ~ ~4.0 ~ anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_8/_quat_test

scoreboard players set roll int 5
execute positioned ~ ~5.0 ~ anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_8/_quat_test

scoreboard players set roll int 6
execute positioned ~ ~6.0 ~ anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_8/_quat_test

scoreboard players set roll int 7
execute positioned ~ ~7.0 ~ anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_8/_quat_test

kill @e[tag=dice_8]