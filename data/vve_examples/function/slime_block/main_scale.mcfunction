#vve_examples:slime_block/main_scale
# vve_examples:slime_block/main调用

scoreboard players operation impulse_fx int /= mass int
scoreboard players operation impulse_fy int /= mass int
scoreboard players operation impulse_fz int /= mass int

# 接收冲量
execute if score impulse_response int matches 1 run scoreboard players operation vx int += impulse_fx int
execute if score impulse_response int matches 1 run scoreboard players operation vz int += impulse_fz int
scoreboard players operation impulse_fy int /= 10 int
execute if score impulse_response int matches 1 run scoreboard players operation damp_v int -= impulse_fy int
scoreboard players operation impulse_fy int *= -1 int
execute if score impulse_response int matches 1 run scoreboard players operation vy int = impulse_fy int
#function vve:impulse/_print
#tellraw @a ["damp_v: ", {"score":{"name":"damp_v","objective":"int"}}]
#scoreboard players set test int 1

# 计算弹力
scoreboard players operation damp_f int = damp_x int
execute if score damp_x int matches ..-1 run scoreboard players operation damp_f int *= -1 int
scoreboard players operation damp_f int /= 20 int

function math:damp/_iter
# 质心受力
scoreboard players operation temp_f int = damp_f int
scoreboard players operation temp_f int *= 35 int
scoreboard players operation temp_f int /= 10 int
execute if score damp_x int matches 1.. run scoreboard players operation vy int -= temp_f int
execute if score damp_x int matches ..-1 run scoreboard players operation vy int += temp_f int

# 判定迭代终止
function math:damp/_energy
scoreboard players operation temp_e int = res int
function math:damp/_threshold
scoreboard players operation res int *= 10 int
execute if score temp_e int <= res int run function math:damp/_converge