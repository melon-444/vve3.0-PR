#vve_examples:green_car/sound/bounce
# vve_examples:green_car/sound/bounce_check调用

scoreboard players operation vve_sound_last_bounce int = vve_sound_timer int

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get impulse_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get impulse_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get impulse_z int
data modify entity @s Pos set from storage math:io xyz

# 计算冲量L1范数
scoreboard players operation temp_imp int = impulse_fx int
execute if score temp_imp int matches ..-1 run scoreboard players operation temp_imp int *= -1 int
scoreboard players operation temp_abs int = impulse_fy int
execute if score temp_abs int matches ..-1 run scoreboard players operation temp_abs int *= -1 int
scoreboard players operation temp_imp int += temp_abs int
scoreboard players operation temp_abs int = impulse_fz int
execute if score temp_abs int matches ..-1 run scoreboard players operation temp_abs int *= -1 int
scoreboard players operation temp_imp int += temp_abs int

execute if score material_response int matches 1.. at @s run function vve_examples:green_car/sound/bounce_solid
execute if score material_response int matches -2 at @s run function vve_examples:green_car/sound/bounce_solid

execute if score material_response int matches -3 at @s run function vve_examples:green_car/sound/bounce_type_1
execute if score material_response int matches -4 at @s run function vve_examples:green_car/sound/bounce_type_2
execute if score material_response int matches -5 at @s run function vve_examples:green_car/sound/bounce_type_3
execute if score material_response int matches -6 at @s run function vve_examples:green_car/sound/bounce_type_4