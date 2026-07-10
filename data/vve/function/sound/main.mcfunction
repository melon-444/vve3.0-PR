#vve:sound/main
# 预设声音主程序
# 输入<bounce_layer_response,int>
# 输入<grab_layer_response,int>
# 输入<material_response,int>
# 输入<friction_response,int>
# 输入<impulse_response,int>
# 输入impulse{...}
# 传入世界实体为执行者

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get impulse_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get impulse_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get impulse_z int
data modify entity @s Pos set from storage math:io xyz

execute unless score vve_last_material int matches -1 if score material_response int matches -1 at @s run function vve:sound/bounce_liquid
execute unless score vve_last_material int matches -7 if score material_response int matches -7 at @s run function vve:sound/bounce_water
execute unless score vve_last_material int matches -8 if score material_response int matches -8 at @s run function vve:sound/bounce_lava
execute if score bounce_layer_response int matches 1.. at @s run function vve:sound/bounce

scoreboard players operation temp_mod int = vve_sound_timer int
scoreboard players operation temp_mod int %= 5 int
execute if score bounce_layer_response int matches 0 \
	if score grab_layer_response int matches 1.. \
	if score temp_mod int matches 0 \
	at @s run function vve:sound/friction

scoreboard players operation temp_mod int = vve_sound_timer int
scoreboard players operation temp_mod int %= 10 int

scoreboard players add vve_sound_timer int 1
scoreboard players operation vve_last_material int = material_response int