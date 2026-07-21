#vve_examples:sphere/init
# 初始化sphere模块

# 初始化模块控制
scoreboard objectives add int dummy
execute unless score module_control_inited int matches 1 run function module_control:_init

# 注册本模块
data modify storage module_control:io input set value {prefix:"vve_examples:sphere/",namespace:"vve_examples"}
function module_control:data/_reg
scoreboard players operation #vve_examples:sphere/ module_id = res int


scoreboard objectives add r dummy
scoreboard objectives add scale_u dummy
scoreboard objectives add scale_v dummy
scoreboard objectives add scale_w dummy
scoreboard objectives add vx dummy
scoreboard objectives add vy dummy
scoreboard objectives add vz dummy
scoreboard objectives add angular_x dummy
scoreboard objectives add angular_y dummy
scoreboard objectives add angular_z dummy
scoreboard objectives add angular_len dummy
scoreboard objectives add ivec_x dummy
scoreboard objectives add ivec_y dummy
scoreboard objectives add ivec_z dummy
scoreboard objectives add jvec_x dummy
scoreboard objectives add jvec_y dummy
scoreboard objectives add jvec_z dummy
scoreboard objectives add kvec_x dummy
scoreboard objectives add kvec_y dummy
scoreboard objectives add kvec_z dummy
scoreboard objectives add quat_x dummy
scoreboard objectives add quat_y dummy
scoreboard objectives add quat_z dummy
scoreboard objectives add quat_w dummy
scoreboard objectives add quat_start_x dummy
scoreboard objectives add quat_start_y dummy
scoreboard objectives add quat_start_z dummy
scoreboard objectives add quat_start_w dummy
scoreboard objectives add quat_orth_x dummy
scoreboard objectives add quat_orth_y dummy
scoreboard objectives add quat_orth_z dummy
scoreboard objectives add quat_orth_w dummy
scoreboard objectives add quat_phi dummy

function vve_examples:sphere/_consts

function vve_examples:sphere/_class