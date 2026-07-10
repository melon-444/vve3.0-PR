#vve:point/_iter_motion_slow_key
# 对临时对象运行一次慢倍速运动学迭代
# 输入<inv_dt,int>

# 速度迭代
scoreboard players operation stemp_vx int = vx int
scoreboard players operation stemp_vy int = vy int
scoreboard players operation stemp_vz int = vz int

scoreboard players operation stemp_vx int /= inv_dt int
scoreboard players operation stemp_mod int = vx int
scoreboard players operation stemp_mod int %= inv_dt int
scoreboard players operation stemp_vx int += stemp_mod int

scoreboard players operation stemp_vy int /= inv_dt int
scoreboard players operation stemp_mod int = vy int
scoreboard players operation stemp_mod int %= inv_dt int
scoreboard players operation stemp_vy int += stemp_mod int

scoreboard players operation stemp_vz int /= inv_dt int
scoreboard players operation stemp_mod int = vz int
scoreboard players operation stemp_mod int %= inv_dt int
scoreboard players operation stemp_vz int += stemp_mod int

scoreboard players operation x int += stemp_vx int
scoreboard players operation y int += stemp_vy int
scoreboard players operation z int += stemp_vz int