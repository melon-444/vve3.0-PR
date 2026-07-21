#vve_examples:sphere/response
# vve_examples:sphere/check_material调用

# 响应信号
scoreboard players operation material_response int = @s vve_material_type

scoreboard players set grab_layer_response int 1
scoreboard players operation nvec_x int = uvec_x int
scoreboard players operation nvec_y int = uvec_y int
scoreboard players operation nvec_z int = uvec_z int
scoreboard players operation grab_depth int = r int
scoreboard players operation grab_depth int -= res int
scoreboard players operation grab_depth int *= 10 int

# 计算沿法线反方向的速度
scoreboard players operation stemp_v int = c_vx int
scoreboard players operation stemp_v int *= nvec_x int
scoreboard players operation stemp_0 int = c_vy int
scoreboard players operation stemp_0 int *= nvec_y int
scoreboard players operation stemp_v int += stemp_0 int
scoreboard players operation stemp_0 int = c_vz int
scoreboard players operation stemp_0 int *= nvec_z int
scoreboard players operation stemp_v int += stemp_0 int
scoreboard players operation stemp_v int /= -10000 int
# 附着层响应
execute if score grab_depth int <= grab_depth_max int \
	if score stemp_v int <= grab_layer_v int \
	run return run function vve:cube/grab_layer_response
# 实心层反弹
scoreboard players set bounce_layer_response int 1
# 取消附着层响应
scoreboard players set grab_layer_response int 0

# 摩擦响应
scoreboard players operation friction_response int = vve_solid_friction int

# 位移至特定深度
scoreboard players set shift_response int 1
scoreboard players operation stemp_depth int = grab_depth int
scoreboard players operation stemp_depth int -= grab_depth_mid int
scoreboard players operation shift_x int = nvec_x int
scoreboard players operation shift_y int = nvec_y int
scoreboard players operation shift_z int = nvec_z int
scoreboard players operation shift_x int *= stemp_depth int
scoreboard players operation shift_y int *= stemp_depth int
scoreboard players operation shift_z int *= stemp_depth int
scoreboard players operation shift_x int /= 10000 int
scoreboard players operation shift_y int /= 10000 int
scoreboard players operation shift_z int /= 10000 int

# 施加反弹冲量
scoreboard players set impulse_response int 1
scoreboard players operation impulse_x int = c_x int
scoreboard players operation impulse_y int = c_y int
scoreboard players operation impulse_z int = c_z int
scoreboard players operation stemp_x int = nvec_x int
scoreboard players operation stemp_y int = nvec_y int
scoreboard players operation stemp_z int = nvec_z int
scoreboard players operation stemp_x int *= stemp_v int
scoreboard players operation stemp_y int *= stemp_v int
scoreboard players operation stemp_z int *= stemp_v int
scoreboard players operation stemp_x int /= vve_solid_bounce_inv int
scoreboard players operation stemp_y int /= vve_solid_bounce_inv int
scoreboard players operation stemp_z int /= vve_solid_bounce_inv int
scoreboard players operation stemp_x int *= c_mass int
scoreboard players operation stemp_y int *= c_mass int
scoreboard players operation stemp_z int *= c_mass int

# 施加切向摩擦力
scoreboard players operation impulse_fx int = c_vx int
scoreboard players operation impulse_fy int = c_vy int
scoreboard players operation impulse_fz int = c_vz int
scoreboard players operation impulse_fx int *= nvec_x int
scoreboard players operation impulse_fy int *= nvec_y int
scoreboard players operation impulse_fz int *= nvec_z int
scoreboard players operation impulse_fz int += impulse_fx int
scoreboard players operation impulse_fz int += impulse_fy int
execute store result score impulse_fx int store result score impulse_fy int run scoreboard players operation impulse_fz int /= 10000 int
scoreboard players operation impulse_fx int *= nvec_x int
scoreboard players operation impulse_fy int *= nvec_y int
scoreboard players operation impulse_fz int *= nvec_z int
scoreboard players operation impulse_fx int /= -10000 int
scoreboard players operation impulse_fy int /= -10000 int
scoreboard players operation impulse_fz int /= -10000 int
scoreboard players operation impulse_fx int += c_vx int
scoreboard players operation impulse_fy int += c_vy int
scoreboard players operation impulse_fz int += c_vz int
scoreboard players operation stemp_k int = vve_solid_friction_tan int
scoreboard players remove stemp_k int 10000
scoreboard players operation impulse_fx int *= stemp_k int
scoreboard players operation impulse_fy int *= stemp_k int
scoreboard players operation impulse_fz int *= stemp_k int
scoreboard players operation impulse_fx int /= 10000 int
scoreboard players operation impulse_fy int /= 10000 int
scoreboard players operation impulse_fz int /= 10000 int
scoreboard players operation impulse_fx int *= c_mass int
scoreboard players operation impulse_fy int *= c_mass int
scoreboard players operation impulse_fz int *= c_mass int

scoreboard players operation impulse_fx int += stemp_x int
scoreboard players operation impulse_fy int += stemp_y int
scoreboard players operation impulse_fz int += stemp_z int

execute unless entity @s[tag=vve_impulse_receiver] run return fail
function vve:impulse/_model
data modify entity @s data.impulse_receiver append from storage vve:io result