#vve_examples:impulse_lamp/return_impulse
# vve_examples:impulse_lamp/response调用

# 返还的冲量部分
scoreboard players operation dec int = @s nvec_x
scoreboard players operation idec int = impulse_fx int
function math:dec/_mult
scoreboard players operation stemp_fx int = dec int
scoreboard players operation dec int = @s nvec_y
scoreboard players operation idec int = impulse_fy int
function math:dec/_mult
scoreboard players operation stemp_fx int += dec int
scoreboard players operation dec int = @s nvec_z
scoreboard players operation idec int = impulse_fz int
function math:dec/_mult
scoreboard players operation stemp_fx int += dec int
scoreboard players operation stemp_fx int > 0 int
scoreboard players operation idec int = stemp_fx int
scoreboard players operation dec int = @s nvec_x
function math:dec/_mult
scoreboard players operation stemp_fx int = dec int
scoreboard players operation dec int = @s nvec_y
function math:dec/_mult
scoreboard players operation stemp_fy int = dec int
scoreboard players operation dec int = @s nvec_z
function math:dec/_mult
scoreboard players operation stemp_fz int = dec int

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

scoreboard players operation dec int = nvec_x int
scoreboard players operation dec int *= @s nvec_x
scoreboard players operation res int = nvec_y int
scoreboard players operation res int *= @s nvec_y
scoreboard players operation dec int += res int
scoreboard players operation res int = nvec_z int
scoreboard players operation res int *= @s nvec_z
scoreboard players operation dec int += res int
function math:dec/_sqr_8
execute store result score res int run scoreboard players operation dec int /= 10000 int
scoreboard players remove res int 10000
scoreboard players operation res int *= c_mass int
scoreboard players operation inp int = @s mass
scoreboard players operation inp int *= 10 int
scoreboard players operation res int /= inp int

scoreboard players operation impulse_fx int *= res int
scoreboard players operation impulse_fy int *= res int
scoreboard players operation impulse_fz int *= res int
scoreboard players operation impulse_fx int /= 1000 int
scoreboard players operation impulse_fy int /= 1000 int
scoreboard players operation impulse_fz int /= 1000 int

scoreboard players operation stemp_fx int = nvec_x int
scoreboard players operation stemp_fy int = nvec_y int
scoreboard players operation stemp_fz int = nvec_z int
scoreboard players operation stemp_fx int *= stemp_v int
scoreboard players operation stemp_fy int *= stemp_v int
scoreboard players operation stemp_fz int *= stemp_v int
scoreboard players operation stemp_fx int /= vve_solid_bounce_inv int
scoreboard players operation stemp_fy int /= vve_solid_bounce_inv int
scoreboard players operation stemp_fz int /= vve_solid_bounce_inv int
scoreboard players operation stemp_fx int *= c_mass int
scoreboard players operation stemp_fy int *= c_mass int
scoreboard players operation stemp_fz int *= c_mass int

scoreboard players operation impulse_fx int += stemp_fx int
scoreboard players operation impulse_fy int += stemp_fy int
scoreboard players operation impulse_fz int += stemp_fz int