#vve:point/_iter_motion_slow_mov
# 对临时对象运行一次慢倍速运动学迭代
# 输入<inv_dt,int>

# 速度迭代
scoreboard players operation stemp_vx int = vx int
scoreboard players operation stemp_vy int = vy int
scoreboard players operation stemp_vz int = vz int
scoreboard players operation stemp_vx int /= inv_dt int
scoreboard players operation stemp_vy int /= inv_dt int
scoreboard players operation stemp_vz int /= inv_dt int
scoreboard players operation x int += stemp_vx int
scoreboard players operation y int += stemp_vy int
scoreboard players operation z int += stemp_vz int