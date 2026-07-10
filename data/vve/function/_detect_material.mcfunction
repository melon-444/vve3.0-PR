#vve:_detect_material
# 介质探测
# 输入执行位置
# 输入cpoint{...}
# 输出介质响应(各模块的临时对象)
# 传入世界实体为执行者(不保证Pos位于执行位置)

# 各模块响应信号重置
scoreboard players set shift_response int 0
scoreboard players set impulse_response int 0
scoreboard players set friction_response int 10000
scoreboard players set grab_layer_response int 0
scoreboard players set bounce_layer_response int 0
scoreboard players set material_response int 0
scoreboard players set surface_response int 0

# 检测不同介质

# 补充非方块介质
# ...
execute as @e[tag=vve_material_box,dx=0,dy=0,dz=0] positioned ~-0.9999 ~-0.9999 ~-0.9999 if entity @s[dx=0,dy=0,dz=0] run function vve:call_material
execute if score material_response int matches 1.. run return fail

# 流体介质
#execute if block ~ ~ ~ #vve:liquid run return run function vve:liquid/response_friction
execute if block ~ ~ ~ minecraft:water run return run function vve:water/response_friction
execute if block ~ ~ ~ minecraft:lava run return run function vve:lava/response_friction

# 空气介质
execute if block ~ ~ ~ #vve:pass run return run scoreboard players operation friction_response int = vve_air_friction int

# 补充其它方块介质
# ...

scoreboard players set material_response int -2
# 获取材质参数
scoreboard players operation stemp_gf int = vve_grab_friction int
scoreboard players operation stemp_sf int = vve_solid_friction int
scoreboard players operation stemp_sbi int = vve_solid_bounce_inv int
scoreboard players operation stemp_gft int = vve_grab_friction_tan int
scoreboard players operation stemp_sft int = vve_solid_friction_tan int
execute if block ~ ~ ~ #vve:type_1 run function vve:material/load_type_1
execute if block ~ ~ ~ #vve:type_2 run function vve:material/load_type_2
execute if block ~ ~ ~ #vve:type_3 run function vve:material/load_type_3
execute if block ~ ~ ~ #vve:type_4 run function vve:material/load_type_4

# 实心介质
scoreboard players operation stemp_x int = c_x int
scoreboard players operation stemp_y int = c_y int
scoreboard players operation stemp_z int = c_z int
scoreboard players operation stemp_x int %= 10000 int
scoreboard players operation stemp_y int %= 10000 int
scoreboard players operation stemp_z int %= 10000 int
scoreboard players set stemp_rx int 0
scoreboard players set stemp_ry int 0
scoreboard players set stemp_rz int 0
execute if score stemp_x int matches 0..4999 unless block ~-1 ~ ~ #vve:pass run scoreboard players set stemp_rx int -1
execute if score stemp_x int matches 5000.. unless block ~1 ~ ~ #vve:pass run scoreboard players set stemp_rx int 1
execute if score stemp_y int matches 0..4999 unless block ~ ~-1 ~ #vve:pass run scoreboard players set stemp_ry int -1
execute if score stemp_y int matches 5000.. unless block ~ ~1 ~ #vve:pass run scoreboard players set stemp_ry int 1
execute if score stemp_z int matches 0..4999 unless block ~ ~ ~-1 #vve:pass run scoreboard players set stemp_rz int -1
execute if score stemp_z int matches 5000.. unless block ~ ~ ~1 #vve:pass run scoreboard players set stemp_rz int 1
execute store result storage vve:io rx int 1 run scoreboard players get stemp_rx int
execute store result storage vve:io ry int 1 run scoreboard players get stemp_ry int
execute store result storage vve:io rz int 1 run scoreboard players get stemp_rz int
function vve:solid/search with storage vve:io {}
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
execute if score grab_depth int <= grab_depth_max int run return run function vve:grab_layer/response_material
# 实心层反弹
scoreboard players set bounce_layer_response int 1
# 取消附着层响应
scoreboard players set grab_layer_response int 0

# 摩擦响应
scoreboard players operation friction_response int = stemp_sf int

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
scoreboard players operation stemp_x int /= stemp_sbi int
scoreboard players operation stemp_y int /= stemp_sbi int
scoreboard players operation stemp_z int /= stemp_sbi int
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
scoreboard players operation stemp_k int = stemp_sft int
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