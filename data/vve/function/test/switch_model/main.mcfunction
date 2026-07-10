#vve:test/switch_model/main

execute if score @s killtime matches 38 run data modify entity @s transformation.left_rotation set value [0.7071f,0.0f,0.0f,0.7071f]
execute if score @s killtime matches 38 run data modify entity @s interpolation_start set value 0

execute if score @s killtime matches 28 run item replace entity @s container.0 with minecraft:verdant_froglight

execute if score @s killtime matches 18 run data modify entity @s item.components."minecraft:item_model" set value "minecraft:raw_gold_block"