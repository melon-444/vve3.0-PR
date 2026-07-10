#vve:water/response
# vve:_detect_liquid调用

scoreboard players set material_response int -7

# 摩擦系数
scoreboard players operation friction_response int = vve_water_friction int

# 获取深度
scoreboard players set stemp_h int 10000
scoreboard players operation stemp_h int -= stemp_y int
execute if block ~ ~1 ~ #vve:liquid run scoreboard players add stemp_h int 10000
execute if block ~ ~2 ~ #vve:liquid run scoreboard players add stemp_h int 10000
execute if block ~ ~3 ~ #vve:liquid run scoreboard players add stemp_h int 10000
execute if block ~ ~4 ~ #vve:liquid run scoreboard players add stemp_h int 10000
scoreboard players operation stemp_h int < buoyancy_h int

# 浮力冲量
scoreboard players set impulse_response int 1
scoreboard players operation impulse_x int = c_x int
scoreboard players operation impulse_y int = c_y int
scoreboard players operation impulse_z int = c_z int
scoreboard players set impulse_fx int 0
scoreboard players set impulse_fz int 0

scoreboard players operation impulse_fy int = buoyancy_area int
scoreboard players operation impulse_fy int *= stemp_h int
scoreboard players operation impulse_fy int /= 100 int
scoreboard players operation impulse_fy int *= vve_water_c int
scoreboard players operation impulse_fy int /= 10000 int