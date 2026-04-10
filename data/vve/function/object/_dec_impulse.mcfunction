#vve:object/_dec_impulse
# 接收并分解冲量响应
# 输入{<x,int,1w>,<y,int,1w>,<z,int,1w>}
# 迭代receiver{...}
# 迭代couple{...}
# 输出<couple_response,int>

scoreboard players add impulse_receiver_response int 1

function vve:impulse/_add_couple

scoreboard players operation impulse_receiver_fx int += impulse_fx int
scoreboard players operation impulse_receiver_fy int += impulse_fy int
scoreboard players operation impulse_receiver_fz int += impulse_fz int