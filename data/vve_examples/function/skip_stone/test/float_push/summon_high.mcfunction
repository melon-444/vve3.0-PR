#vve_examples:skip_stone/test/float_push/summon_high
# vve_examples:skip_stone/test/float_push/main调用

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
data modify storage vve_examples:io input set from storage vve_examples:class skip_stone_plate
function vve_examples:skip_stone/_proj
scoreboard players set inp int 2100
execute as @e[tag=math_marker,limit=1] at @s positioned ~ ~4 ~-4 rotated 0.0 0.0 run function vve:point/_anchor_to
function vve_examples:skip_stone/_model
data modify storage vve_examples:io input set from storage vve_examples:io result
data modify entity @e[tag=math_marker,limit=1] Pos set from storage vve_examples:io input.center
execute at @e[tag=math_marker,limit=1] run function vve_examples:skip_stone/_new
tag @e[tag=result,limit=1] add test