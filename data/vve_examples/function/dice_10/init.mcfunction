#vve_examples:dice_10/init
# 初始化dice_10模块

scoreboard players set 5257 int 5257
scoreboard players set 3820 int 3820
scoreboard players set 8507 int 8507
scoreboard players set 2008 int 2008
scoreboard players set -2008 int -2008
scoreboard players set 6180 int 6180
scoreboard players set -6498 int -6498
scoreboard players set -16180 int -16180
scoreboard players set 10515 int 10515

scoreboard objectives add a dummy
scoreboard objectives add mass dummy
scoreboard objectives add inertia dummy
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

function vve_examples:dice_10/_consts

function vve_examples:dice_10/_class