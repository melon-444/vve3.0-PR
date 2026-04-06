#vve:object/_apply_friction
# 接收摩擦响应
# 输入<friction_response,int,1w>

# 速度缩放
scoreboard players operation vx int *= friction_response int
scoreboard players operation vy int *= friction_response int
scoreboard players operation vz int *= friction_response int
execute if score vx int matches ..-1 run scoreboard players add vx int 9999
execute if score vy int matches ..-1 run scoreboard players add vy int 9999
execute if score vz int matches ..-1 run scoreboard players add vz int 9999
scoreboard players operation vx int /= 10000 int
scoreboard players operation vy int /= 10000 int
scoreboard players operation vz int /= 10000 int

# 角速度缩放
scoreboard players operation stemp_mod int = angular_len int
scoreboard players operation angular_len int /= 10000 int
scoreboard players operation angular_len int *= friction_response int
scoreboard players operation stemp_mod int %= 10000 int
scoreboard players operation stemp_mod int *= friction_response int
scoreboard players operation stemp_mod int /= 10000 int
scoreboard players operation angular_len int += stemp_mod int

# 角速度分量缩放
scoreboard players operation stemp_x int = angular_x int
scoreboard players operation stemp_y int = angular_y int
scoreboard players operation stemp_z int = angular_z int
scoreboard players operation stemp_x int /= 10000 int
scoreboard players operation stemp_y int /= 10000 int
scoreboard players operation stemp_z int /= 10000 int
scoreboard players operation stemp_x int *= friction_response int
scoreboard players operation stemp_y int *= friction_response int
scoreboard players operation stemp_z int *= friction_response int
scoreboard players operation angular_x int %= 10000 int
scoreboard players operation angular_y int %= 10000 int
scoreboard players operation angular_z int %= 10000 int
scoreboard players operation angular_x int *= friction_response int
scoreboard players operation angular_y int *= friction_response int
scoreboard players operation angular_z int *= friction_response int
execute if score stemp_x int matches ..-1 run scoreboard players add angular_x int 9999
execute if score stemp_y int matches ..-1 run scoreboard players add angular_y int 9999
execute if score stemp_z int matches ..-1 run scoreboard players add angular_z int 9999
scoreboard players operation angular_x int /= 10000 int
scoreboard players operation angular_y int /= 10000 int
scoreboard players operation angular_z int /= 10000 int
scoreboard players operation angular_x int += stemp_x int
scoreboard players operation angular_y int += stemp_y int
scoreboard players operation angular_z int += stemp_z int