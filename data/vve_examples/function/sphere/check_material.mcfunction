#vve_examples:sphere/check_material
# vve:call_material调用

scoreboard players operation vec_x int = c_x int
scoreboard players operation vec_y int = c_y int
scoreboard players operation vec_z int = c_z int
scoreboard players operation vec_x int -= @s x
scoreboard players operation vec_y int -= @s y
scoreboard players operation vec_z int -= @s z
execute as 0-0-0-0-0 run function math:vec/_unit

execute if score res int <= @s r \
	run function vve_examples:sphere/response