#vve:test/explode/tnt/_del
# 销毁实体对象
# 输入执行实体

# 冲击范围内方块
execute at @s as @e[distance=..5,tag=vve_explode_block,tag=!vve_exploded] run function vve:test/explode/block/wake_up
execute at @s as @e[distance=..5,tag=vve_explode_block_object,tag=!vve_exploded] run function vve:test/explode/block_object/wake_up

execute at @s run particle minecraft:explosion ~ ~ ~ 0.0 0.0 0.0 0.0 1 force @a
execute at @s run particle minecraft:smoke ~ ~ ~ 0.0 0.0 0.0 0.25 100 force @a
execute at @s run particle minecraft:white_smoke ~ ~ ~ 0.0 0.0 0.0 0.18 100 force @a
execute at @s run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 5.0 1.0

execute at @s run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air

kill @s