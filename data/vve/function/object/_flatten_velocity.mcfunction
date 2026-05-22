#vve:object/_flatten_velocity
# 压平物体平动速度
# 传入nvec{...}

scoreboard players operation vec_x int = nvec_x int
scoreboard players operation vec_y int = nvec_y int
scoreboard players operation vec_z int = nvec_z int
scoreboard players operation vec_x int *= vx int
scoreboard players operation vec_y int *= vy int
scoreboard players operation vec_z int *= vz int
scoreboard players operation vec_x int += vec_y int
scoreboard players operation vec_x int += vec_z int
execute store result score vec_y int store result score vec_z int run scoreboard players operation vec_x int /= 10000 int
scoreboard players operation vec_x int *= nvec_x int
scoreboard players operation vec_y int *= nvec_y int
scoreboard players operation vec_z int *= nvec_z int
scoreboard players operation vec_x int /= 10000 int
scoreboard players operation vec_y int /= 10000 int
scoreboard players operation vec_z int /= 10000 int
scoreboard players operation vx int -= vec_x int
scoreboard players operation vy int -= vec_y int
scoreboard players operation vz int -= vec_z int