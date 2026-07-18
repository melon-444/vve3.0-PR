#vve_examples:dice_10/_iter_cpoints
# 遍历顶点作为碰撞点，进行介质探测
# 输出介质响应(各模块的临时对象)
# 传入世界实体为执行者(不保证Pos位于执行位置)

# 开始接收介质响应
function vve:object/_clear_receiver

# 相对坐标组成部分
# 设置sstemp_i, sstemp_j, sstemp_k
execute store result score sstemp_ix int store result score sstemp_iy int store result score sstemp_iz int \
	store result score sstemp_jx int store result score sstemp_jy int store result score sstemp_jz int \
	store result score sstemp_kx int store result score sstemp_ky int run \
	scoreboard players operation sstemp_kz int = a int
scoreboard players operation sstemp_ix int *= ivec_x int
scoreboard players operation sstemp_iy int *= ivec_y int
scoreboard players operation sstemp_iz int *= ivec_z int
scoreboard players operation sstemp_jx int *= jvec_x int
scoreboard players operation sstemp_jy int *= jvec_y int
scoreboard players operation sstemp_jz int *= jvec_z int
scoreboard players operation sstemp_kx int *= kvec_x int
scoreboard players operation sstemp_ky int *= kvec_y int
scoreboard players operation sstemp_kz int *= kvec_z int
execute store result score sstemp_rx int run scoreboard players operation sstemp_ix int /= 10000 int
execute store result score sstemp_ry int run scoreboard players operation sstemp_iy int /= 10000 int
execute store result score sstemp_rz int run scoreboard players operation sstemp_iz int /= 10000 int
execute store result score sstemp_sx int run scoreboard players operation sstemp_jx int /= 10000 int
execute store result score sstemp_sy int run scoreboard players operation sstemp_jy int /= 10000 int
execute store result score sstemp_sz int run scoreboard players operation sstemp_jz int /= 10000 int
execute store result score sstemp_tx int run scoreboard players operation sstemp_kx int /= 10000 int
execute store result score sstemp_ty int run scoreboard players operation sstemp_ky int /= 10000 int
execute store result score sstemp_tz int run scoreboard players operation sstemp_kz int /= 10000 int

scoreboard players operation sstemp_ax int = angular_x int
scoreboard players operation sstemp_ay int = angular_y int
scoreboard players operation sstemp_az int = angular_z int
scoreboard players operation sstemp_ax int /= 100 int
scoreboard players operation sstemp_ay int /= 100 int
scoreboard players operation sstemp_az int /= 100 int

# 线速度组成部分
scoreboard players operation sstempx int = sstemp_rx int
scoreboard players operation sstemp_rx int = sstemp_ay int
scoreboard players operation sstemp_rx int *= sstemp_rz int
scoreboard players operation sstemp0 int = sstemp_ry int
scoreboard players operation sstemp0 int *= sstemp_az int
scoreboard players operation sstemp_rx int -= sstemp0 int
scoreboard players operation sstemp_rx int /= 10000 int
scoreboard players operation sstempy int = sstemp_ry int
scoreboard players operation sstemp_ry int = sstemp_az int
scoreboard players operation sstemp_ry int *= sstemp_rx int
scoreboard players operation sstemp0 int = sstemp_rz int
scoreboard players operation sstemp0 int *= sstemp_ax int
scoreboard players operation sstemp_ry int -= sstemp0 int
scoreboard players operation sstemp_ry int /= 10000 int
scoreboard players operation sstemp_rz int = sstempy int
scoreboard players operation sstemp_rz int *= sstemp_ax int
scoreboard players operation sstemp0 int = sstemp_ay int
scoreboard players operation sstemp0 int *= sstempx int
scoreboard players operation sstemp_rz int -= sstemp0 int
scoreboard players operation sstemp_rz int /= 10000 int

scoreboard players operation sstempx int = sstemp_sx int
scoreboard players operation sstemp_sx int = sstemp_ay int
scoreboard players operation sstemp_sx int *= sstemp_sz int
scoreboard players operation sstemp0 int = sstemp_sy int
scoreboard players operation sstemp0 int *= sstemp_az int
scoreboard players operation sstemp_sx int -= sstemp0 int
scoreboard players operation sstemp_sx int /= 10000 int
scoreboard players operation sstempy int = sstemp_sy int
scoreboard players operation sstemp_sy int = sstemp_az int
scoreboard players operation sstemp_sy int *= sstemp_sx int
scoreboard players operation sstemp0 int = sstemp_sz int
scoreboard players operation sstemp0 int *= sstemp_ax int
scoreboard players operation sstemp_sy int -= sstemp0 int
scoreboard players operation sstemp_sy int /= 10000 int
scoreboard players operation sstemp_sz int = sstempy int
scoreboard players operation sstemp_sz int *= sstemp_ax int
scoreboard players operation sstemp0 int = sstemp_ay int
scoreboard players operation sstemp0 int *= sstempx int
scoreboard players operation sstemp_sz int -= sstemp0 int
scoreboard players operation sstemp_sz int /= 10000 int

scoreboard players operation sstempx int = sstemp_tx int
scoreboard players operation sstemp_tx int = sstemp_ay int
scoreboard players operation sstemp_tx int *= sstemp_tz int
scoreboard players operation sstemp0 int = sstemp_ty int
scoreboard players operation sstemp0 int *= sstemp_az int
scoreboard players operation sstemp_tx int -= sstemp0 int
scoreboard players operation sstemp_tx int /= 10000 int
scoreboard players operation sstempy int = sstemp_ty int
scoreboard players operation sstemp_ty int = sstemp_az int
scoreboard players operation sstemp_ty int *= sstemp_tx int
scoreboard players operation sstemp0 int = sstemp_tz int
scoreboard players operation sstemp0 int *= sstemp_ax int
scoreboard players operation sstemp_ty int -= sstemp0 int
scoreboard players operation sstemp_ty int /= 10000 int
scoreboard players operation sstemp_tz int = sstempy int
scoreboard players operation sstemp_tz int *= sstemp_ax int
scoreboard players operation sstemp0 int = sstemp_ay int
scoreboard players operation sstemp0 int *= sstempx int
scoreboard players operation sstemp_tz int -= sstemp0 int
scoreboard players operation sstemp_tz int /= 10000 int

# 设置cpoint质量
scoreboard players operation c_mass int = mass int

# 顶点0介质探测
scoreboard players operation sstemp_ax int = sstemp_ix int
scoreboard players operation sstemp_ay int = sstemp_iy int
scoreboard players operation sstemp_az int = sstemp_iz int
scoreboard players operation sstemp_ax int *= 5257 int
scoreboard players operation sstemp_ay int *= 5257 int
scoreboard players operation sstemp_az int *= 5257 int
scoreboard players operation sstemp_bx int = sstemp_jx int
scoreboard players operation sstemp_by int = sstemp_jy int
scoreboard players operation sstemp_bz int = sstemp_jz int
scoreboard players operation sstemp_bx int *= 3820 int
scoreboard players operation sstemp_by int *= 3820 int
scoreboard players operation sstemp_bz int *= 3820 int
scoreboard players operation sstemp_ax int += sstemp_bx int
scoreboard players operation sstemp_ay int += sstemp_by int
scoreboard players operation sstemp_az int += sstemp_bz int
scoreboard players operation sstemp_bx int = sstemp_kx int
scoreboard players operation sstemp_by int = sstemp_ky int
scoreboard players operation sstemp_bz int = sstemp_kz int
scoreboard players operation sstemp_bx int *= 8507 int
scoreboard players operation sstemp_by int *= 8507 int
scoreboard players operation sstemp_bz int *= 8507 int
scoreboard players operation sstemp_ax int += sstemp_bx int
scoreboard players operation sstemp_ay int += sstemp_by int
scoreboard players operation sstemp_az int += sstemp_bz int
scoreboard players operation sstemp_ax int /= 10000 int
scoreboard players operation sstemp_ay int /= 10000 int
scoreboard players operation sstemp_az int /= 10000 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int = sstemp_rx int
scoreboard players operation sstemp_cy int = sstemp_ry int
scoreboard players operation sstemp_cz int = sstemp_rz int
scoreboard players operation sstemp_cx int *= 5257 int
scoreboard players operation sstemp_cy int *= 5257 int
scoreboard players operation sstemp_cz int *= 5257 int
scoreboard players operation sstemp_dx int = sstemp_sx int
scoreboard players operation sstemp_dy int = sstemp_sy int
scoreboard players operation sstemp_dz int = sstemp_sz int
scoreboard players operation sstemp_dx int *= 3820 int
scoreboard players operation sstemp_dy int *= 3820 int
scoreboard players operation sstemp_dz int *= 3820 int
scoreboard players operation sstemp_cx int += sstemp_dx int
scoreboard players operation sstemp_cy int += sstemp_dy int
scoreboard players operation sstemp_cz int += sstemp_dz int
scoreboard players operation sstemp_dx int = sstemp_tx int
scoreboard players operation sstemp_dy int = sstemp_ty int
scoreboard players operation sstemp_dz int = sstemp_tz int
scoreboard players operation sstemp_dx int *= 8507 int
scoreboard players operation sstemp_dy int *= 8507 int
scoreboard players operation sstemp_dz int *= 8507 int
scoreboard players operation sstemp_cx int += sstemp_dx int
scoreboard players operation sstemp_cy int += sstemp_dy int
scoreboard players operation sstemp_cz int += sstemp_dz int
scoreboard players operation sstemp_cx int /= 10000 int
scoreboard players operation sstemp_cy int /= 10000 int
scoreboard players operation sstemp_cz int /= 10000 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点11介质探测
scoreboard players operation sstemp_ax int *= -1 int
scoreboard players operation sstemp_ay int *= -1 int
scoreboard players operation sstemp_az int *= -1 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int *= -1 int
scoreboard players operation sstemp_cy int *= -1 int
scoreboard players operation sstemp_cz int *= -1 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点1介质探测
scoreboard players operation sstemp_ax int = sstemp_ix int
scoreboard players operation sstemp_ay int = sstemp_iy int
scoreboard players operation sstemp_az int = sstemp_iz int
scoreboard players operation sstemp_ax int *= -2008 int
scoreboard players operation sstemp_ay int *= -2008 int
scoreboard players operation sstemp_az int *= -2008 int
scoreboard players operation sstemp_bx int = sstemp_jx int
scoreboard players operation sstemp_by int = sstemp_jy int
scoreboard players operation sstemp_bz int = sstemp_jz int
scoreboard players operation sstemp_bx int *= 6180 int
scoreboard players operation sstemp_by int *= 6180 int
scoreboard players operation sstemp_bz int *= 6180 int
scoreboard players operation sstemp_ax int += sstemp_bx int
scoreboard players operation sstemp_ay int += sstemp_by int
scoreboard players operation sstemp_az int += sstemp_bz int
scoreboard players operation sstemp_bx int = sstemp_kx int
scoreboard players operation sstemp_by int = sstemp_ky int
scoreboard players operation sstemp_bz int = sstemp_kz int
scoreboard players operation sstemp_bx int *= 8507 int
scoreboard players operation sstemp_by int *= 8507 int
scoreboard players operation sstemp_bz int *= 8507 int
scoreboard players operation sstemp_ax int += sstemp_bx int
scoreboard players operation sstemp_ay int += sstemp_by int
scoreboard players operation sstemp_az int += sstemp_bz int
scoreboard players operation sstemp_ax int /= 10000 int
scoreboard players operation sstemp_ay int /= 10000 int
scoreboard players operation sstemp_az int /= 10000 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int = sstemp_rx int
scoreboard players operation sstemp_cy int = sstemp_ry int
scoreboard players operation sstemp_cz int = sstemp_rz int
scoreboard players operation sstemp_cx int *= -2008 int
scoreboard players operation sstemp_cy int *= -2008 int
scoreboard players operation sstemp_cz int *= -2008 int
scoreboard players operation sstemp_dx int = sstemp_sx int
scoreboard players operation sstemp_dy int = sstemp_sy int
scoreboard players operation sstemp_dz int = sstemp_sz int
scoreboard players operation sstemp_dx int *= 6180 int
scoreboard players operation sstemp_dy int *= 6180 int
scoreboard players operation sstemp_dz int *= 6180 int
scoreboard players operation sstemp_cx int += sstemp_dx int
scoreboard players operation sstemp_cy int += sstemp_dy int
scoreboard players operation sstemp_cz int += sstemp_dz int
scoreboard players operation sstemp_dx int = sstemp_tx int
scoreboard players operation sstemp_dy int = sstemp_ty int
scoreboard players operation sstemp_dz int = sstemp_tz int
scoreboard players operation sstemp_dx int *= 8507 int
scoreboard players operation sstemp_dy int *= 8507 int
scoreboard players operation sstemp_dz int *= 8507 int
scoreboard players operation sstemp_cx int += sstemp_dx int
scoreboard players operation sstemp_cy int += sstemp_dy int
scoreboard players operation sstemp_cz int += sstemp_dz int
scoreboard players operation sstemp_cx int /= 10000 int
scoreboard players operation sstemp_cy int /= 10000 int
scoreboard players operation sstemp_cz int /= 10000 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点9介质探测
scoreboard players operation sstemp_ax int *= -1 int
scoreboard players operation sstemp_ay int *= -1 int
scoreboard players operation sstemp_az int *= -1 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int *= -1 int
scoreboard players operation sstemp_cy int *= -1 int
scoreboard players operation sstemp_cz int *= -1 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点2介质探测
scoreboard players operation sstemp_ax int = sstemp_ix int
scoreboard players operation sstemp_ay int = sstemp_iy int
scoreboard players operation sstemp_az int = sstemp_iz int
scoreboard players operation sstemp_ax int *= -6498 int
scoreboard players operation sstemp_ay int *= -6498 int
scoreboard players operation sstemp_az int *= -6498 int
scoreboard players operation sstemp_bx int = sstemp_kx int
scoreboard players operation sstemp_by int = sstemp_ky int
scoreboard players operation sstemp_bz int = sstemp_kz int
scoreboard players operation sstemp_bx int *= 8507 int
scoreboard players operation sstemp_by int *= 8507 int
scoreboard players operation sstemp_bz int *= 8507 int
scoreboard players operation sstemp_ax int += sstemp_bx int
scoreboard players operation sstemp_ay int += sstemp_by int
scoreboard players operation sstemp_az int += sstemp_bz int
scoreboard players operation sstemp_ax int /= 10000 int
scoreboard players operation sstemp_ay int /= 10000 int
scoreboard players operation sstemp_az int /= 10000 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int = sstemp_rx int
scoreboard players operation sstemp_cy int = sstemp_ry int
scoreboard players operation sstemp_cz int = sstemp_rz int
scoreboard players operation sstemp_cx int *= -6498 int
scoreboard players operation sstemp_cy int *= -6498 int
scoreboard players operation sstemp_cz int *= -6498 int
scoreboard players operation sstemp_dx int = sstemp_tx int
scoreboard players operation sstemp_dy int = sstemp_ty int
scoreboard players operation sstemp_dz int = sstemp_tz int
scoreboard players operation sstemp_dx int *= 8507 int
scoreboard players operation sstemp_dy int *= 8507 int
scoreboard players operation sstemp_dz int *= 8507 int
scoreboard players operation sstemp_cx int += sstemp_dx int
scoreboard players operation sstemp_cy int += sstemp_dy int
scoreboard players operation sstemp_cz int += sstemp_dz int
scoreboard players operation sstemp_cx int /= 10000 int
scoreboard players operation sstemp_cy int /= 10000 int
scoreboard players operation sstemp_cz int /= 10000 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点10介质探测
scoreboard players operation sstemp_ax int *= -1 int
scoreboard players operation sstemp_ay int *= -1 int
scoreboard players operation sstemp_az int *= -1 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int *= -1 int
scoreboard players operation sstemp_cy int *= -1 int
scoreboard players operation sstemp_cz int *= -1 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点3介质探测
scoreboard players operation sstemp_ax int = sstemp_ix int
scoreboard players operation sstemp_ay int = sstemp_iy int
scoreboard players operation sstemp_az int = sstemp_iz int
scoreboard players operation sstemp_ax int *= 5257 int
scoreboard players operation sstemp_ay int *= 5257 int
scoreboard players operation sstemp_az int *= 5257 int
scoreboard players operation sstemp_bx int = sstemp_jx int
scoreboard players operation sstemp_by int = sstemp_jy int
scoreboard players operation sstemp_bz int = sstemp_jz int
scoreboard players operation sstemp_bx int *= -16180 int
scoreboard players operation sstemp_by int *= -16180 int
scoreboard players operation sstemp_bz int *= -16180 int
scoreboard players operation sstemp_ax int += sstemp_bx int
scoreboard players operation sstemp_ay int += sstemp_by int
scoreboard players operation sstemp_az int += sstemp_bz int
scoreboard players operation sstemp_bx int = sstemp_kx int
scoreboard players operation sstemp_by int = sstemp_ky int
scoreboard players operation sstemp_bz int = sstemp_kz int
scoreboard players operation sstemp_bx int *= 8507 int
scoreboard players operation sstemp_by int *= 8507 int
scoreboard players operation sstemp_bz int *= 8507 int
scoreboard players operation sstemp_ax int += sstemp_bx int
scoreboard players operation sstemp_ay int += sstemp_by int
scoreboard players operation sstemp_az int += sstemp_bz int
scoreboard players operation sstemp_ax int /= 10000 int
scoreboard players operation sstemp_ay int /= 10000 int
scoreboard players operation sstemp_az int /= 10000 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int = sstemp_rx int
scoreboard players operation sstemp_cy int = sstemp_ry int
scoreboard players operation sstemp_cz int = sstemp_rz int
scoreboard players operation sstemp_cx int *= 5257 int
scoreboard players operation sstemp_cy int *= 5257 int
scoreboard players operation sstemp_cz int *= 5257 int
scoreboard players operation sstemp_dx int = sstemp_sx int
scoreboard players operation sstemp_dy int = sstemp_sy int
scoreboard players operation sstemp_dz int = sstemp_sz int
scoreboard players operation sstemp_dx int *= -16180 int
scoreboard players operation sstemp_dy int *= -16180 int
scoreboard players operation sstemp_dz int *= -16180 int
scoreboard players operation sstemp_cx int += sstemp_dx int
scoreboard players operation sstemp_cy int += sstemp_dy int
scoreboard players operation sstemp_cz int += sstemp_dz int
scoreboard players operation sstemp_dx int = sstemp_tx int
scoreboard players operation sstemp_dy int = sstemp_ty int
scoreboard players operation sstemp_dz int = sstemp_tz int
scoreboard players operation sstemp_dx int *= 8507 int
scoreboard players operation sstemp_dy int *= 8507 int
scoreboard players operation sstemp_dz int *= 8507 int
scoreboard players operation sstemp_cx int += sstemp_dx int
scoreboard players operation sstemp_cy int += sstemp_dy int
scoreboard players operation sstemp_cz int += sstemp_dz int
scoreboard players operation sstemp_cx int /= 10000 int
scoreboard players operation sstemp_cy int /= 10000 int
scoreboard players operation sstemp_cz int /= 10000 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点6介质探测
scoreboard players operation sstemp_ax int *= -1 int
scoreboard players operation sstemp_ay int *= -1 int
scoreboard players operation sstemp_az int *= -1 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int *= -1 int
scoreboard players operation sstemp_cy int *= -1 int
scoreboard players operation sstemp_cz int *= -1 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点4介质探测
scoreboard players operation sstemp_ax int = sstemp_ix int
scoreboard players operation sstemp_ay int = sstemp_iy int
scoreboard players operation sstemp_az int = sstemp_iz int
scoreboard players operation sstemp_ax int *= 10515 int
scoreboard players operation sstemp_ay int *= 10515 int
scoreboard players operation sstemp_az int *= 10515 int
scoreboard players operation sstemp_bx int = sstemp_kx int
scoreboard players operation sstemp_by int = sstemp_ky int
scoreboard players operation sstemp_bz int = sstemp_kz int
scoreboard players operation sstemp_bx int *= -2008 int
scoreboard players operation sstemp_by int *= -2008 int
scoreboard players operation sstemp_bz int *= -2008 int
scoreboard players operation sstemp_ax int += sstemp_bx int
scoreboard players operation sstemp_ay int += sstemp_by int
scoreboard players operation sstemp_az int += sstemp_bz int
scoreboard players operation sstemp_ax int /= 10000 int
scoreboard players operation sstemp_ay int /= 10000 int
scoreboard players operation sstemp_az int /= 10000 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int = sstemp_rx int
scoreboard players operation sstemp_cy int = sstemp_ry int
scoreboard players operation sstemp_cz int = sstemp_rz int
scoreboard players operation sstemp_cx int *= 10515 int
scoreboard players operation sstemp_cy int *= 10515 int
scoreboard players operation sstemp_cz int *= 10515 int
scoreboard players operation sstemp_dx int = sstemp_tx int
scoreboard players operation sstemp_dy int = sstemp_ty int
scoreboard players operation sstemp_dz int = sstemp_tz int
scoreboard players operation sstemp_dx int *= -2008 int
scoreboard players operation sstemp_dy int *= -2008 int
scoreboard players operation sstemp_dz int *= -2008 int
scoreboard players operation sstemp_cx int += sstemp_dx int
scoreboard players operation sstemp_cy int += sstemp_dy int
scoreboard players operation sstemp_cz int += sstemp_dz int
scoreboard players operation sstemp_cx int /= 10000 int
scoreboard players operation sstemp_cy int /= 10000 int
scoreboard players operation sstemp_cz int /= 10000 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点7介质探测
scoreboard players operation sstemp_ax int *= -1 int
scoreboard players operation sstemp_ay int *= -1 int
scoreboard players operation sstemp_az int *= -1 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int *= -1 int
scoreboard players operation sstemp_cy int *= -1 int
scoreboard players operation sstemp_cz int *= -1 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点0介质探测
scoreboard players operation sstemp_ax int = sstemp_ix int
scoreboard players operation sstemp_ay int = sstemp_iy int
scoreboard players operation sstemp_az int = sstemp_iz int
scoreboard players operation sstemp_ax int *= 8507 int
scoreboard players operation sstemp_ay int *= 8507 int
scoreboard players operation sstemp_az int *= 8507 int
scoreboard players operation sstemp_bx int = sstemp_jx int
scoreboard players operation sstemp_by int = sstemp_jy int
scoreboard players operation sstemp_bz int = sstemp_jz int
scoreboard players operation sstemp_bx int *= 6180 int
scoreboard players operation sstemp_by int *= 6180 int
scoreboard players operation sstemp_bz int *= 6180 int
scoreboard players operation sstemp_ax int += sstemp_bx int
scoreboard players operation sstemp_ay int += sstemp_by int
scoreboard players operation sstemp_az int += sstemp_bz int
scoreboard players operation sstemp_bx int = sstemp_kx int
scoreboard players operation sstemp_by int = sstemp_ky int
scoreboard players operation sstemp_bz int = sstemp_kz int
scoreboard players operation sstemp_bx int *= 2008 int
scoreboard players operation sstemp_by int *= 2008 int
scoreboard players operation sstemp_bz int *= 2008 int
scoreboard players operation sstemp_ax int += sstemp_bx int
scoreboard players operation sstemp_ay int += sstemp_by int
scoreboard players operation sstemp_az int += sstemp_bz int
scoreboard players operation sstemp_ax int /= 10000 int
scoreboard players operation sstemp_ay int /= 10000 int
scoreboard players operation sstemp_az int /= 10000 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int = sstemp_rx int
scoreboard players operation sstemp_cy int = sstemp_ry int
scoreboard players operation sstemp_cz int = sstemp_rz int
scoreboard players operation sstemp_cx int *= 8507 int
scoreboard players operation sstemp_cy int *= 8507 int
scoreboard players operation sstemp_cz int *= 8507 int
scoreboard players operation sstemp_dx int = sstemp_sx int
scoreboard players operation sstemp_dy int = sstemp_sy int
scoreboard players operation sstemp_dz int = sstemp_sz int
scoreboard players operation sstemp_dx int *= 6180 int
scoreboard players operation sstemp_dy int *= 6180 int
scoreboard players operation sstemp_dz int *= 6180 int
scoreboard players operation sstemp_cx int += sstemp_dx int
scoreboard players operation sstemp_cy int += sstemp_dy int
scoreboard players operation sstemp_cz int += sstemp_dz int
scoreboard players operation sstemp_dx int = sstemp_tx int
scoreboard players operation sstemp_dy int = sstemp_ty int
scoreboard players operation sstemp_dz int = sstemp_tz int
scoreboard players operation sstemp_dx int *= 2008 int
scoreboard players operation sstemp_dy int *= 2008 int
scoreboard players operation sstemp_dz int *= 2008 int
scoreboard players operation sstemp_cx int += sstemp_dx int
scoreboard players operation sstemp_cy int += sstemp_dy int
scoreboard players operation sstemp_cz int += sstemp_dz int
scoreboard players operation sstemp_cx int /= 10000 int
scoreboard players operation sstemp_cy int /= 10000 int
scoreboard players operation sstemp_cz int /= 10000 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 顶点11介质探测
scoreboard players operation sstemp_ax int *= -1 int
scoreboard players operation sstemp_ay int *= -1 int
scoreboard players operation sstemp_az int *= -1 int
scoreboard players operation c_x int = sstemp_ax int
scoreboard players operation c_y int = sstemp_ay int
scoreboard players operation c_z int = sstemp_az int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int += z int
scoreboard players operation sstemp_cx int *= -1 int
scoreboard players operation sstemp_cy int *= -1 int
scoreboard players operation sstemp_cz int *= -1 int
scoreboard players operation c_vx int = sstemp_cx int
scoreboard players operation c_vy int = sstemp_cy int
scoreboard players operation c_vz int = sstemp_cz int
scoreboard players operation c_vx int += vx int
scoreboard players operation c_vy int += vy int
scoreboard players operation c_vz int += vz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:_detect_material
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_receive_impulse

# 结束接受介质响应
function vve:object/_receive_over

# 区块安全
tp @s 0 0 0