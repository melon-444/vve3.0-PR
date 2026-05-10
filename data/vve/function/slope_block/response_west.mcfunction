#vve:slope_block/response_west
# vve:slope_block/detect_west调用

scoreboard players set grab_layer_response int 1
#function vve:slope_block/nvec_up
#function vve:slope_block/nvec_west
#execute if score stemp_x int matches ..9000 run function vve:slope_block/nvec_up
#execute if score stemp_x int matches 9001.. run function vve:slope_block/nvec_west
scoreboard players set nvec_x int -7071
scoreboard players set nvec_y int 7071
scoreboard players set nvec_z int 0
scoreboard players operation grab_depth int *= 2378 int
scoreboard players operation grab_depth int /= 3363 int

#scoreboard players set test int 1
#execute if score test_n int matches 17 run tellraw @a "---"
#execute if score test_n int matches 17 run tellraw @a "slope response"
#execute if score test_n int matches 17 run function vve:cpoint/_print
#execute if score test_n int matches 17 run tellraw @a ["grab_depth: ", {"score":{"name":"grab_depth","objective":"int"}}]
#execute if score test_n int matches 17 run tellraw @a ["stemp: ",{"score":{"name":"stemp_x","objective":"int"}},", ",{"score":{"name":"stemp_y","objective":"int"}},", ",{"score":{"name":"stemp_z","objective":"int"}}]

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
execute if score grab_depth int <= grab_depth_max int run return run function vve:slope_block/grab_layer_response
# 实心层反弹
scoreboard players set bounce_layer_response int 1
# 取消附着层响应
scoreboard players set grab_layer_response int 0

# 摩擦响应
scoreboard players operation friction_response int = vve_solid_friction int

# 位移至特定深度
scoreboard players set shift_response int 1
scoreboard players operation shift_x int = nvec_x int
scoreboard players operation shift_y int = nvec_y int
scoreboard players operation shift_z int = nvec_z int
scoreboard players operation shift_x int *= grab_depth int
scoreboard players operation shift_y int *= grab_depth int
scoreboard players operation shift_z int *= grab_depth int
scoreboard players operation shift_x int /= 10000 int
scoreboard players operation shift_y int /= 10000 int
scoreboard players operation shift_z int /= 10000 int
scoreboard players operation stemp_0 int = c_y int
scoreboard players operation stemp_0 int %= 10000 int
execute unless score stemp_0 int = stemp_y int run function vve:slope_block/shift_up

# 脱离速度忽略
execute if score stemp_v int matches ..-1 run return fail

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

#function vve:slope_block/nvec_west