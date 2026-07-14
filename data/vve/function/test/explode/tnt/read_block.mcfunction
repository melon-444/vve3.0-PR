#vve:test/explode/tnt/read_block
# vve:test/explode/tnt/set_operation异步调用

scoreboard players add test_cnt int 1
#tellraw @a ["result: ", {"nbt":"result","storage":"vve:io"}]

# 黑曜石不读取
execute if block ~ ~ ~ minecraft:obsidian run return fail
# 检测这个格子是否已经存在vve_explode_block
execute if entity @e[tag=vve_explode_block,distance=..0.1] run return fail

data modify storage vve:io temp set from storage vve:io result

data modify storage vve:io input set from storage vve:class explode_block_plate
function vve:test/explode/block/_proj
execute rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
function vve:test/explode/block/_model
data modify storage vve:io input set from storage vve:io result
function vve:test/explode/block/_new
execute as @e[tag=result,limit=1] on passengers run data modify entity @s block_state set from storage vve:io temp