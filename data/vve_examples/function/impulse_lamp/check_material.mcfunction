#vve_examples:impulse_lamp/check_material
# vve:call_material调用

scoreboard players operation vec_x int = c_x int
scoreboard players operation vec_y int = c_y int
scoreboard players operation vec_z int = c_z int
# 转换局部坐标
execute store result score u int store result score v int store result score w int run scoreboard players operation vec_x int -= @s x
execute store result score sstemp_u1 int store result score sstemp_v1 int store result score sstemp_w1 int run scoreboard players operation vec_y int -= @s y
execute store result score sstemp_u2 int store result score sstemp_v2 int store result score sstemp_w2 int run scoreboard players operation vec_z int -= @s z
scoreboard players operation u int *= @s ivec_x
scoreboard players operation sstemp_u1 int *= @s ivec_y
scoreboard players operation u int += sstemp_u1 int
scoreboard players operation sstemp_u2 int *= @s ivec_z
scoreboard players operation u int += sstemp_u2 int
scoreboard players operation v int *= @s jvec_x
scoreboard players operation sstemp_v1 int *= @s jvec_y
scoreboard players operation v int += sstemp_v1 int
scoreboard players operation sstemp_v2 int *= @s jvec_z
scoreboard players operation v int += sstemp_v2 int
scoreboard players operation w int *= @s kvec_x
scoreboard players operation sstemp_w1 int *= @s kvec_y
scoreboard players operation w int += sstemp_w1 int
scoreboard players operation sstemp_w2 int *= @s kvec_z
scoreboard players operation w int += sstemp_w2 int

# 获取缩放坐标
scoreboard players operation sstemp_s0 int = u int
scoreboard players operation sstemp_s1 int = v int
scoreboard players operation sstemp_s2 int = w int
scoreboard players operation sstemp_s0 int /= @s scale_u
scoreboard players operation sstemp_s1 int /= @s scale_v
scoreboard players operation sstemp_s2 int /= @s scale_w

execute if score sstemp_s0 int matches -5000..5000 \
	if score sstemp_s1 int matches -5000..5000 \
	if score sstemp_s2 int matches -5000..5000 \
	run function vve_examples:impulse_lamp/response