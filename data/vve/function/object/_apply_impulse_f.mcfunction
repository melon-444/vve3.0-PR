#vve:object/_apply_impulse_f
# 仅应用冲量响应到平动速度
# 输入<mass,int>
# 输入impulse{...}

# 输入冲量向量
scoreboard players operation fvec_x int = impulse_fx int
scoreboard players operation fvec_y int = impulse_fy int
scoreboard players operation fvec_z int = impulse_fz int

# 改变速度
scoreboard players operation fvec_x int /= mass int
scoreboard players operation fvec_y int /= mass int
scoreboard players operation fvec_z int /= mass int
scoreboard players operation vx int += fvec_x int
scoreboard players operation vy int += fvec_y int
scoreboard players operation vz int += fvec_z int