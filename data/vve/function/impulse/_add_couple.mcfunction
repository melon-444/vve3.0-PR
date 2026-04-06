#vve:impulse/_add_couple
# 计算并累加力偶矩
# 输入couple{...}
# 输入{<x,int,1w>,<y,int,1w>,<z,int,1w>}
# 输出couple{...}
# 输出<couple_response,int>

scoreboard players set couple_response int 1

# 输入位矢向量
scoreboard players operation vec_x int = impulse_x int
scoreboard players operation vec_y int = impulse_y int
scoreboard players operation vec_z int = impulse_z int
scoreboard players operation vec_x int -= x int
scoreboard players operation vec_y int -= y int
scoreboard players operation vec_z int -= z int
# 输入冲量向量
scoreboard players operation fvec_x int = impulse_fx int
scoreboard players operation fvec_y int = impulse_fy int
scoreboard players operation fvec_z int = impulse_fz int
# 计算叉乘
function math:vec/_cross_fvec_high

#tellraw @a ["vec: ",{"score":{"name":"vec_x","objective":"int"}},", ",{"score":{"name":"vec_y","objective":"int"}},", ",{"score":{"name":"vec_z","objective":"int"}}]
scoreboard players operation couple_x int += vec_x int
scoreboard players operation couple_y int += vec_y int
scoreboard players operation couple_z int += vec_z int