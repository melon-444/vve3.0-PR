#tag重整

tag @s remove dice_4
tag @s remove result
tag @s add dice_display
tag @s add dice_current

scoreboard players set @s dice_dfaces 4
scoreboard players operation @s dice_dpoint = point dice_dpoint

execute if score $optplayer dice_var matches 1 run data modify entity @s glow_color_override set value 8441855
execute if score $optplayer dice_var matches 1 run tag @s add dice_p1
execute if score $optplayer dice_var matches 2 run data modify entity @s glow_color_override set value 16744576
execute if score $optplayer dice_var matches 2 run tag @s add dice_p2

#对象写入列表
data modify storage dice:temp dice_struct set value {UUID:[0,0,0,0],face:0,point:1}
data modify storage dice:temp dice_struct.UUID set from entity @s UUID
execute store result storage dice:temp dice_struct.face int 1 run scoreboard players get @s dice_dfaces
execute store result storage dice:temp dice_struct.point int 1 run scoreboard players get @s dice_dpoint

data modify storage dice:temp dice_list append from storage dice:temp dice_struct