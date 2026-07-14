#vve_examples:test_car/engine/set_velocity
# vve_examples:test_car/engine/main调用

# 剔除前进速度
scoreboard players operation stemp_vx int = vx int
scoreboard players operation stemp_vy int = vy int
scoreboard players operation stemp_vz int = vz int
scoreboard players operation stemp_vx int *= kvec_x int
scoreboard players operation stemp_vy int *= kvec_y int
scoreboard players operation stemp_vz int *= kvec_z int
scoreboard players operation stemp_vx int += stemp_vy int
scoreboard players operation stemp_vx int += stemp_vz int
execute store result score stemp_vy int store result score stemp_vz int run scoreboard players operation stemp_vx int /= 10000 int
scoreboard players operation stemp_vx int *= kvec_x int
scoreboard players operation stemp_vy int *= kvec_y int
scoreboard players operation stemp_vz int *= kvec_z int
scoreboard players operation stemp_vx int /= 10000 int
scoreboard players operation stemp_vy int /= 10000 int
scoreboard players operation stemp_vz int /= 10000 int
scoreboard players operation vx int -= stemp_vx int
scoreboard players operation vy int -= stemp_vy int
scoreboard players operation vz int -= stemp_vz int

scoreboard players operation dec int = kvec_x int
scoreboard players operation idec int = temp_p int
function math:dec/_mult
scoreboard players operation dec int /= mass int
scoreboard players operation stemp_vx int = dec int

scoreboard players operation dec int = kvec_y int
scoreboard players operation idec int = temp_p int
function math:dec/_mult
scoreboard players operation dec int /= mass int
scoreboard players operation stemp_vy int = dec int

scoreboard players operation dec int = kvec_z int
scoreboard players operation idec int = temp_p int
function math:dec/_mult
scoreboard players operation dec int /= mass int
scoreboard players operation stemp_vz int = dec int

# 设置前进速度
scoreboard players operation vx int += stemp_vx int
scoreboard players operation vy int += stemp_vy int
scoreboard players operation vz int += stemp_vz int

execute if score temp_p int matches ..-1 run function vve_examples:test_car/engine/backward_friction