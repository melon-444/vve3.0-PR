#vve_examples:test_car/_set_rotation
# 设置水平旋转角速度
# 输入转弯半径<r,int,1w>
# 输入旋转符号<sign,int> (取值-1,0,1)
# 传入世界实体为执行者

# 计算水平线速度
scoreboard players operation stemp_v int = vx int
scoreboard players operation stemp_v int *= kvec_x int
scoreboard players operation stemp_0 int = vy int
scoreboard players operation stemp_0 int *= kvec_y int
scoreboard players operation stemp_v int += stemp_0 int
scoreboard players operation stemp_0 int = vz int
scoreboard players operation stemp_0 int *= kvec_z int
scoreboard players operation stemp_v int += stemp_0 int

# 除以转弯半径，设置旋转方向
scoreboard players operation stemp_v int /= r int
scoreboard players operation stemp_v int *= sign int

# 剔除水平原有角速度
scoreboard players operation stemp_x int = angular_x int
scoreboard players operation stemp_y int = angular_y int
scoreboard players operation stemp_z int = angular_z int
scoreboard players operation angular_x int /= 100 int
scoreboard players operation angular_y int /= 100 int
scoreboard players operation angular_z int /= 100 int
scoreboard players operation angular_x int *= jvec_x int
scoreboard players operation angular_y int *= jvec_y int
scoreboard players operation angular_z int *= jvec_z int
scoreboard players operation angular_x int += angular_y int
scoreboard players operation angular_x int += angular_z int
execute store result score angular_y int store result score angular_z int run scoreboard players operation angular_x int /= 10000 int
scoreboard players operation angular_x int *= jvec_x int
scoreboard players operation angular_y int *= jvec_y int
scoreboard players operation angular_z int *= jvec_z int
scoreboard players operation angular_x int /= 100 int
scoreboard players operation angular_y int /= 100 int
scoreboard players operation angular_z int /= 100 int
scoreboard players operation stemp_x int -= angular_x int
scoreboard players operation stemp_y int -= angular_y int
scoreboard players operation stemp_z int -= angular_z int

# 设置水平角速度
execute store result score angular_y int store result score angular_z int run scoreboard players operation angular_x int = stemp_v int
scoreboard players operation angular_x int *= jvec_x int
scoreboard players operation angular_y int *= jvec_y int
scoreboard players operation angular_z int *= jvec_z int
scoreboard players operation angular_x int /= 100 int
scoreboard players operation angular_y int /= 100 int
scoreboard players operation angular_z int /= 100 int

# 叠加原有角速度
scoreboard players operation angular_x int += stemp_x int
scoreboard players operation angular_y int += stemp_y int
scoreboard players operation angular_z int += stemp_z int

function vve:object/_set_angular