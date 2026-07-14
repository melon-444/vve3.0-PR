#vve:test/explode/tnt/read_block_object
# vve:test/explode/tnt/set_operation异步调用

scoreboard players add test_cnt int 1
#tellraw @a ["result: ", {"nbt":"result","storage":"vve:io"}]

# 黑曜石不读取
#execute if score test_cnt int matches 2.. run return fail
execute if block ~ ~ ~ minecraft:obsidian run return fail
# 检测这个格子是否已经存在vve_explode_block
execute if entity @e[tag=vve_explode_block_object,distance=..0.1] run return fail

data modify storage vve:io temp set from storage vve:io result

data modify storage vve:io input set from storage vve:class explode_block_object_plate
function vve:test/explode/block_object/_proj
execute rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
# 计算爆炸冲量
# 获取tnt中心
execute as @e[tag=vve_tnt,limit=1,sort=nearest] run data modify storage math:io xyz set from entity @s Pos
execute store result score stemp_x int run data get storage math:io xyz[0] 10000
execute store result score stemp_y int run data get storage math:io xyz[1] 10000
execute store result score stemp_z int run data get storage math:io xyz[2] 10000
# 获取冲量作用点
scoreboard players operation impulse_x int = stemp_x int
scoreboard players operation impulse_y int = stemp_y int
scoreboard players operation impulse_z int = stemp_z int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation impulse_x int -= x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation impulse_y int -= y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation impulse_z int -= z int
data modify entity 0-0-0-0-0 Pos set from storage math:io xyz
execute as 0-0-0-0-0 positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^15.0
data modify storage math:io xyz set from entity 0-0-0-0-0 Pos
execute store result score impulse_x int run data get storage math:io xyz[0] 10000
execute store result score impulse_y int run data get storage math:io xyz[1] 10000
execute store result score impulse_z int run data get storage math:io xyz[2] 10000
scoreboard players operation impulse_x int += x int
scoreboard players operation impulse_y int += y int
scoreboard players operation impulse_z int += z int
# 获取冲量矢量部分
scoreboard players set impulse_fx int 0
scoreboard players set impulse_fy int 0
scoreboard players set impulse_fz int 0
execute store result score fvec_x int store result score fvec_y int run scoreboard players operation fvec_z int = a int
function vve:test/explode/tnt/calc_impulse_f
scoreboard players operation fvec_x int *= -1 int
function vve:test/explode/tnt/calc_impulse_f
scoreboard players operation fvec_z int *= -1 int
function vve:test/explode/tnt/calc_impulse_f
scoreboard players operation fvec_x int *= -1 int
function vve:test/explode/tnt/calc_impulse_f
scoreboard players operation fvec_y int *= -1 int
#function vve:test/explode/tnt/calc_impulse_f
scoreboard players operation fvec_z int *= -1 int
#function vve:test/explode/tnt/calc_impulse_f
scoreboard players operation fvec_x int *= -1 int
#function vve:test/explode/tnt/calc_impulse_f
scoreboard players operation fvec_z int *= -1 int
#function vve:test/explode/tnt/calc_impulse_f
scoreboard players operation impulse_fx int /= 5 int
scoreboard players operation impulse_fy int /= 5 int
scoreboard players operation impulse_fz int /= 5 int
execute as 0-0-0-0-0 run function vve:object/_apply_impulse
function vve:test/explode/block_object/_model
data modify storage vve:io input set from storage vve:io result
function vve:test/explode/block_object/_new
execute as @e[tag=result,limit=1] run data modify entity @s block_state set from storage vve:io temp