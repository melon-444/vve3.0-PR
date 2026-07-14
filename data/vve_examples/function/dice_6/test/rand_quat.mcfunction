#vve_examples:dice_6/test/rand_quat

tellraw @a "--- dice_6 rand_quat result ---"

scoreboard players set loop int 0
scoreboard players set quat_phi int 0
execute as @p positioned 191.40069617510176 -53.88349863207186 47.96821444487924 rotated 3.1442566 44.099842 \
	anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_6/_roll
kill @e[tag=result,limit=1]

scoreboard players set loop int 0
scoreboard players set quat_phi int 1800000
execute as @p positioned 191.40069617510176 -53.88349863207186 47.96821444487924 rotated 3.1442566 44.099842 \
	anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_6/_roll
kill @e[tag=result,limit=1]