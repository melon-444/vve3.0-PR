#vve_examples:test_car/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage vve_examples:io input

execute store result score target_power int run data get storage vve_examples:io input.engine[0]
execute store result score damp_x int run data get storage vve_examples:io input.engine[1]
execute store result score damp_v int run data get storage vve_examples:io input.engine[2]
execute store result score damp_k int run data get storage vve_examples:io input.engine[3]
execute store result score damp_b int run data get storage vve_examples:io input.engine[4]
execute store result score damp_f int run data get storage vve_examples:io input.engine[5]
execute store result score v_max int run data get storage vve_examples:io input.engine[6] 10000
execute store result score mass int run data get storage vve_examples:io input.mass
execute store result score tensor_xx int run data get storage vve_examples:io input.tensor[0] 100
execute store result score tensor_yy int run data get storage vve_examples:io input.tensor[1] 100
execute store result score tensor_zz int run data get storage vve_examples:io input.tensor[2] 100
execute store result score tensor_xy int run data get storage vve_examples:io input.tensor[3] 100
execute store result score tensor_xz int run data get storage vve_examples:io input.tensor[4] 100
execute store result score tensor_yz int run data get storage vve_examples:io input.tensor[5] 100
execute store result score cube_shift_y int run data get storage vve_examples:io input.cube_shift_y 10000
execute store result score nvec_x int run data get storage vve_examples:io input.nvec[0] 10000
execute store result score nvec_y int run data get storage vve_examples:io input.nvec[1] 10000
execute store result score nvec_z int run data get storage vve_examples:io input.nvec[2] 10000
execute store result score scale_u int run data get storage vve_examples:io input.scale[0] 10000
execute store result score scale_v int run data get storage vve_examples:io input.scale[1] 10000
execute store result score scale_w int run data get storage vve_examples:io input.scale[2] 10000
execute store result score x int run data get storage vve_examples:io input.center[0] 10000
execute store result score y int run data get storage vve_examples:io input.center[1] 10000
execute store result score z int run data get storage vve_examples:io input.center[2] 10000
execute store result score vx int run data get storage vve_examples:io input.velocity[0] 10000
execute store result score vy int run data get storage vve_examples:io input.velocity[1] 10000
execute store result score vz int run data get storage vve_examples:io input.velocity[2] 10000
execute store result score angular_x int run data get storage vve_examples:io input.angular_vec[0] 1000000
execute store result score angular_y int run data get storage vve_examples:io input.angular_vec[1] 1000000
execute store result score angular_z int run data get storage vve_examples:io input.angular_vec[2] 1000000
execute store result score angular_len int run data get storage vve_examples:io input.angular_len 1000000
execute store result score ivec_x int run data get storage vve_examples:io input.ivec[0] 10000
execute store result score ivec_y int run data get storage vve_examples:io input.ivec[1] 10000
execute store result score ivec_z int run data get storage vve_examples:io input.ivec[2] 10000
execute store result score jvec_x int run data get storage vve_examples:io input.jvec[0] 10000
execute store result score jvec_y int run data get storage vve_examples:io input.jvec[1] 10000
execute store result score jvec_z int run data get storage vve_examples:io input.jvec[2] 10000
execute store result score kvec_x int run data get storage vve_examples:io input.kvec[0] 10000
execute store result score kvec_y int run data get storage vve_examples:io input.kvec[1] 10000
execute store result score kvec_z int run data get storage vve_examples:io input.kvec[2] 10000
execute store result score quat_x int run data get storage vve_examples:io input.xyzw[0] 10000
execute store result score quat_y int run data get storage vve_examples:io input.xyzw[1] 10000
execute store result score quat_z int run data get storage vve_examples:io input.xyzw[2] 10000
execute store result score quat_w int run data get storage vve_examples:io input.xyzw[3] 10000
execute store result score quat_start_x int run data get storage vve_examples:io input.start_xyzw[0] 10000
execute store result score quat_start_y int run data get storage vve_examples:io input.start_xyzw[1] 10000
execute store result score quat_start_z int run data get storage vve_examples:io input.start_xyzw[2] 10000
execute store result score quat_start_w int run data get storage vve_examples:io input.start_xyzw[3] 10000
execute store result score quat_orth_x int run data get storage vve_examples:io input.orth_xyzw[0] 10000
execute store result score quat_orth_y int run data get storage vve_examples:io input.orth_xyzw[1] 10000
execute store result score quat_orth_z int run data get storage vve_examples:io input.orth_xyzw[2] 10000
execute store result score quat_orth_w int run data get storage vve_examples:io input.orth_xyzw[3] 10000
execute store result score quat_phi int run data get storage vve_examples:io input.quat_phi 10000