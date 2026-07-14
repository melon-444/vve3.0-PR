#vve_examples:test_car/_model
# 使用临时对象构建数据模板
# 输出数据模板storage vve_examples:io result

data modify storage vve_examples:io result set value {engine:[0.0d, 0.0d, 0.0d, 0.0d, 0.0d, 0.0d, 0.0d], mass:0, tensor:[0.0d, 0.0d, 0.0d, 0.0d, 0.0d, 0.0d], cube_shift_y:0, nvec:[0.0d, 0.0d, 0.0d], scale:[0.0d, 0.0d, 0.0d], center:[0.0d, 0.0d, 0.0d], velocity:[0.0d, 0.0d, 0.0d], angular_vec:[0.0d, 0.0d, 0.0d], angular_len:0, ivec:[0.0d, 0.0d, 0.0d], jvec:[0.0d, 0.0d, 0.0d], kvec:[0.0d, 0.0d, 0.0d], xyzw:[0.0d, 0.0d, 0.0d, 0.0d], start_xyzw:[0.0d, 0.0d, 0.0d, 0.0d], orth_xyzw:[0.0d, 0.0d, 0.0d, 0.0d], quat_phi:0}

execute store result storage vve_examples:io result.engine[0] double 1 run scoreboard players get target_power int
execute store result storage vve_examples:io result.engine[1] double 1 run scoreboard players get damp_x int
execute store result storage vve_examples:io result.engine[2] double 1 run scoreboard players get damp_v int
execute store result storage vve_examples:io result.engine[3] double 1 run scoreboard players get damp_k int
execute store result storage vve_examples:io result.engine[4] double 1 run scoreboard players get damp_b int
execute store result storage vve_examples:io result.engine[5] double 1 run scoreboard players get damp_f int
execute store result storage vve_examples:io result.engine[6] double 0.0001 run scoreboard players get v_max int
execute store result storage vve_examples:io result.mass int 1 run scoreboard players get mass int
execute store result storage vve_examples:io result.tensor[0] double 0.01 run scoreboard players get tensor_xx int
execute store result storage vve_examples:io result.tensor[1] double 0.01 run scoreboard players get tensor_yy int
execute store result storage vve_examples:io result.tensor[2] double 0.01 run scoreboard players get tensor_zz int
execute store result storage vve_examples:io result.tensor[3] double 0.01 run scoreboard players get tensor_xy int
execute store result storage vve_examples:io result.tensor[4] double 0.01 run scoreboard players get tensor_xz int
execute store result storage vve_examples:io result.tensor[5] double 0.01 run scoreboard players get tensor_yz int
execute store result storage vve_examples:io result.cube_shift_y double 0.0001 run scoreboard players get cube_shift_y int
execute store result storage vve_examples:io result.nvec[0] double 0.0001 run scoreboard players get nvec_x int
execute store result storage vve_examples:io result.nvec[1] double 0.0001 run scoreboard players get nvec_y int
execute store result storage vve_examples:io result.nvec[2] double 0.0001 run scoreboard players get nvec_z int
execute store result storage vve_examples:io result.scale[0] double 0.0001 run scoreboard players get scale_u int
execute store result storage vve_examples:io result.scale[1] double 0.0001 run scoreboard players get scale_v int
execute store result storage vve_examples:io result.scale[2] double 0.0001 run scoreboard players get scale_w int
execute store result storage vve_examples:io result.center[0] double 0.0001 run scoreboard players get x int
execute store result storage vve_examples:io result.center[1] double 0.0001 run scoreboard players get y int
execute store result storage vve_examples:io result.center[2] double 0.0001 run scoreboard players get z int
execute store result storage vve_examples:io result.velocity[0] double 0.0001 run scoreboard players get vx int
execute store result storage vve_examples:io result.velocity[1] double 0.0001 run scoreboard players get vy int
execute store result storage vve_examples:io result.velocity[2] double 0.0001 run scoreboard players get vz int
execute store result storage vve_examples:io result.angular_vec[0] double 0.000001 run scoreboard players get angular_x int
execute store result storage vve_examples:io result.angular_vec[1] double 0.000001 run scoreboard players get angular_y int
execute store result storage vve_examples:io result.angular_vec[2] double 0.000001 run scoreboard players get angular_z int
execute store result storage vve_examples:io result.angular_len double 0.000001 run scoreboard players get angular_len int
execute store result storage vve_examples:io result.ivec[0] double 0.0001 run scoreboard players get ivec_x int
execute store result storage vve_examples:io result.ivec[1] double 0.0001 run scoreboard players get ivec_y int
execute store result storage vve_examples:io result.ivec[2] double 0.0001 run scoreboard players get ivec_z int
execute store result storage vve_examples:io result.jvec[0] double 0.0001 run scoreboard players get jvec_x int
execute store result storage vve_examples:io result.jvec[1] double 0.0001 run scoreboard players get jvec_y int
execute store result storage vve_examples:io result.jvec[2] double 0.0001 run scoreboard players get jvec_z int
execute store result storage vve_examples:io result.kvec[0] double 0.0001 run scoreboard players get kvec_x int
execute store result storage vve_examples:io result.kvec[1] double 0.0001 run scoreboard players get kvec_y int
execute store result storage vve_examples:io result.kvec[2] double 0.0001 run scoreboard players get kvec_z int
execute store result storage vve_examples:io result.xyzw[0] double 0.0001 run scoreboard players get quat_x int
execute store result storage vve_examples:io result.xyzw[1] double 0.0001 run scoreboard players get quat_y int
execute store result storage vve_examples:io result.xyzw[2] double 0.0001 run scoreboard players get quat_z int
execute store result storage vve_examples:io result.xyzw[3] double 0.0001 run scoreboard players get quat_w int
execute store result storage vve_examples:io result.start_xyzw[0] double 0.0001 run scoreboard players get quat_start_x int
execute store result storage vve_examples:io result.start_xyzw[1] double 0.0001 run scoreboard players get quat_start_y int
execute store result storage vve_examples:io result.start_xyzw[2] double 0.0001 run scoreboard players get quat_start_z int
execute store result storage vve_examples:io result.start_xyzw[3] double 0.0001 run scoreboard players get quat_start_w int
execute store result storage vve_examples:io result.orth_xyzw[0] double 0.0001 run scoreboard players get quat_orth_x int
execute store result storage vve_examples:io result.orth_xyzw[1] double 0.0001 run scoreboard players get quat_orth_y int
execute store result storage vve_examples:io result.orth_xyzw[2] double 0.0001 run scoreboard players get quat_orth_z int
execute store result storage vve_examples:io result.orth_xyzw[3] double 0.0001 run scoreboard players get quat_orth_w int
execute store result storage vve_examples:io result.quat_phi int 0.0001 run scoreboard players get quat_phi int