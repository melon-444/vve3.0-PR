#vve:cublock/return_impulse
# vve:cublock/response调用

scoreboard players operation impulse_fx int /= stemp_mass int
scoreboard players operation impulse_fy int /= stemp_mass int
scoreboard players operation impulse_fz int /= stemp_mass int

# 返还的冲量部分
scoreboard players operation stemp_fx int = @s nvec_x
scoreboard players operation stemp_fx int *= impulse_fx int
scoreboard players operation stemp_fy int = @s nvec_y
scoreboard players operation stemp_fy int *= impulse_fy int
scoreboard players operation stemp_fx int += stemp_fy int
scoreboard players operation stemp_fz int = @s nvec_z
scoreboard players operation stemp_fz int *= impulse_fz int
scoreboard players operation stemp_fx int += stemp_fz int
scoreboard players operation stemp_fx int /= 10000 int
execute store result score stemp_fy int store result score stemp_fz int \
	run scoreboard players operation stemp_fx int > 0 int
scoreboard players operation stemp_fx int *= @s nvec_x
scoreboard players operation stemp_fy int *= @s nvec_y
scoreboard players operation stemp_fz int *= @s nvec_z
scoreboard players operation stemp_fx int /= 10000 int
scoreboard players operation stemp_fy int /= 10000 int
scoreboard players operation stemp_fz int /= 10000 int

scoreboard players operation impulse_fx int *= stemp_mass int
scoreboard players operation impulse_fy int *= stemp_mass int
scoreboard players operation impulse_fz int *= stemp_mass int
scoreboard players operation stemp_fx int *= stemp_mass int
scoreboard players operation stemp_fy int *= stemp_mass int
scoreboard players operation stemp_fz int *= stemp_mass int

# 吸收冲量
scoreboard players operation impulse_fx int -= stemp_fx int
scoreboard players operation impulse_fy int -= stemp_fy int
scoreboard players operation impulse_fz int -= stemp_fz int
scoreboard players operation impulse_fx int *= -1 int
scoreboard players operation impulse_fy int *= -1 int
scoreboard players operation impulse_fz int *= -1 int
function vve:impulse/_model
data modify entity @s data.impulse_receiver append from storage vve:io result
scoreboard players operation impulse_fx int *= -1 int
scoreboard players operation impulse_fy int *= -1 int
scoreboard players operation impulse_fz int *= -1 int

# 返还冲量
scoreboard players operation impulse_fx int += stemp_fx int
scoreboard players operation impulse_fy int += stemp_fy int
scoreboard players operation impulse_fz int += stemp_fz int
scoreboard players operation impulse_fx int += stemp_fx int
scoreboard players operation impulse_fy int += stemp_fy int
scoreboard players operation impulse_fz int += stemp_fz int