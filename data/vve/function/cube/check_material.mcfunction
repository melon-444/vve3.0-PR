#vve:cube/check_material
# vve:call_material调用

scoreboard players operation vec_x int = c_x int
scoreboard players operation vec_y int = c_y int
scoreboard players operation vec_z int = c_z int
scoreboard players operation vec_x int -= @s x
scoreboard players operation vec_y int -= @s y
scoreboard players operation vec_z int -= @s z
# 转换局部坐标
execute store result score u int store result score v int store result score w int run scoreboard players operation vec_x int /= 10 int
execute store result score sstemp_u1 int store result score sstemp_v1 int store result score sstemp_w1 int run scoreboard players operation vec_y int /= 10 int
execute store result score sstemp_u2 int store result score sstemp_v2 int store result score sstemp_w2 int run scoreboard players operation vec_z int /= 10 int
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

scoreboard players operation u int /= 1000 int
scoreboard players operation v int /= 1000 int
scoreboard players operation w int /= 1000 int

# 获取边长一半
scoreboard players operation sstemp_s0 int = @s scale_u
scoreboard players operation sstemp_s1 int = @s scale_v
scoreboard players operation sstemp_s2 int = @s scale_w
scoreboard players operation sstemp_s0 int /= 2 int
scoreboard players operation sstemp_s1 int /= 2 int
scoreboard players operation sstemp_s2 int /= 2 int

# 计算绝对值
scoreboard players operation sstemp_s0_abs int = sstemp_s0 int
scoreboard players operation sstemp_s1_abs int = sstemp_s1 int
scoreboard players operation sstemp_s2_abs int = sstemp_s2 int
execute if score sstemp_s0 int matches ..-1 run scoreboard players operation sstemp_s0_abs int *= -1 int
execute if score sstemp_s1 int matches ..-1 run scoreboard players operation sstemp_s1_abs int *= -1 int
execute if score sstemp_s2 int matches ..-1 run scoreboard players operation sstemp_s2_abs int *= -1 int

# 计算符号和绝对值
scoreboard players set sstemp_sign_u int 1
execute if score u int matches ..-1 run scoreboard players set sstemp_sign_u int -1
scoreboard players operation sstemp_abs_u int = u int
scoreboard players operation sstemp_abs_u int *= sstemp_sign_u int

scoreboard players set sstemp_sign_v int 1
execute if score v int matches ..-1 run scoreboard players set sstemp_sign_v int -1
scoreboard players operation sstemp_abs_v int = v int
scoreboard players operation sstemp_abs_v int *= sstemp_sign_v int

scoreboard players set sstemp_sign_w int 1
execute if score w int matches ..-1 run scoreboard players set sstemp_sign_w int -1
scoreboard players operation sstemp_abs_w int = w int
scoreboard players operation sstemp_abs_w int *= sstemp_sign_w int

execute if score sstemp_abs_u int <= sstemp_s0_abs int \
	if score sstemp_abs_v int <= sstemp_s1_abs int \
	if score sstemp_abs_w int <= sstemp_s2_abs int \
	run function vve:cube/response