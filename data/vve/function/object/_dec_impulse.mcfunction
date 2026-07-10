#vve:object/_dec_impulse
# 接收并分解冲量响应
# 输入{<x,int,1w>,<y,int,1w>,<z,int,1w>}
# 迭代receiver{...}
# 迭代couple{...}
# 输出<couple_response,int>

function vve:impulse/_add_couple

scoreboard players add impulse_receiver_response int 1
execute if score impulse_receiver_response int matches 1 run return run function vve:object/first_impulse

scoreboard players operation impulse_receiver_sx int += impulse_x int
scoreboard players operation impulse_receiver_sy int += impulse_y int
scoreboard players operation impulse_receiver_sz int += impulse_z int
scoreboard players operation impulse_receiver_sx int -= impulse_receiver_x int
scoreboard players operation impulse_receiver_sy int -= impulse_receiver_y int
scoreboard players operation impulse_receiver_sz int -= impulse_receiver_z int

scoreboard players operation impulse_receiver_fx int += impulse_fx int
scoreboard players operation impulse_receiver_fy int += impulse_fy int
scoreboard players operation impulse_receiver_fz int += impulse_fz int