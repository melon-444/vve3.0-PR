#vve:object/_receive_impulse_f
# 接收冲量响应
# 迭代receiver{...}

scoreboard players add impulse_receiver_response int 1

scoreboard players operation impulse_receiver_fx int += impulse_fx int
scoreboard players operation impulse_receiver_fy int += impulse_fy int
scoreboard players operation impulse_receiver_fz int += impulse_fz int