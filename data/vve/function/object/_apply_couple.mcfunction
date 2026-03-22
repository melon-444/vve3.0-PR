#vve:object/_apply_couple
# 应用力偶矩响应
# 输入<inertia,int,100>
# 输入couple{...}
# 传入世界实体为执行者

# 输入力偶矩向量
scoreboard players operation vec_x int = couple_x int
scoreboard players operation vec_y int = couple_y int
scoreboard players operation vec_z int = couple_z int

# 改变角速度
scoreboard players operation sstemp_x int = vec_x int
scoreboard players operation sstemp_y int = vec_y int
scoreboard players operation sstemp_z int = vec_z int
scoreboard players operation vec_x int /= inertia int
scoreboard players operation vec_y int /= inertia int
scoreboard players operation vec_z int /= inertia int
scoreboard players operation sstemp_x int %= inertia int
scoreboard players operation sstemp_y int %= inertia int
scoreboard players operation sstemp_z int %= inertia int
scoreboard players operation vec_x int *= 10000 int
scoreboard players operation vec_y int *= 10000 int
scoreboard players operation vec_z int *= 10000 int
scoreboard players operation sstemp_x int *= 10000 int
scoreboard players operation sstemp_y int *= 10000 int
scoreboard players operation sstemp_z int *= 10000 int
scoreboard players operation sstemp_x int /= inertia int
scoreboard players operation sstemp_y int /= inertia int
scoreboard players operation sstemp_z int /= inertia int
scoreboard players operation vec_x int += sstemp_x int
scoreboard players operation vec_y int += sstemp_y int
scoreboard players operation vec_z int += sstemp_z int
scoreboard players operation angular_x int += vec_x int
scoreboard players operation angular_y int += vec_y int
scoreboard players operation angular_z int += vec_z int
function vve:object/_set_angular