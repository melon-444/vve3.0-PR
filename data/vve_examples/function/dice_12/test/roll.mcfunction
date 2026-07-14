#vve_examples:dice_12/test/roll

tellraw @a "--- dice_12 roll result ---"

execute positioned 193 -53 54 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve_examples:dice_12/_roll