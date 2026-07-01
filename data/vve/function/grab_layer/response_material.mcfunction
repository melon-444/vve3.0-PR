#vve:grab_layer/response_material
# vve:_detect_material调用

# 摩擦响应
scoreboard players operation friction_response int = stemp_gf int

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

# 脱离附着层的速度忽略
execute if score stemp_v int matches ..-1 run return fail

# 速度过大直接忽略
execute if score stemp_v int > grab_layer_v int run return fail

# 施加支持力冲量
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
scoreboard players operation stemp_x int /= 10000 int
scoreboard players operation stemp_y int /= 10000 int
scoreboard players operation stemp_z int /= 10000 int
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
scoreboard players operation stemp_k int = stemp_gft int
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