#vve_examples:test_car/set
# vve_examples:test_car/_new调用

execute store result score @s target_power run data get storage vve_examples:io input.engine[0]
execute store result score @s damp_x run data get storage vve_examples:io input.engine[1]
execute store result score @s damp_v run data get storage vve_examples:io input.engine[2]
execute store result score @s damp_k run data get storage vve_examples:io input.engine[3]
execute store result score @s damp_b run data get storage vve_examples:io input.engine[4]
execute store result score @s damp_f run data get storage vve_examples:io input.engine[5]
execute store result score @s v_max run data get storage vve_examples:io input.engine[6] 10000
execute store result score @s mass run data get storage vve_examples:io input.mass
execute store result score @s tensor_xx run data get storage vve_examples:io input.tensor[0] 100
execute store result score @s tensor_yy run data get storage vve_examples:io input.tensor[1] 100
execute store result score @s tensor_zz run data get storage vve_examples:io input.tensor[2] 100
execute store result score @s tensor_xy run data get storage vve_examples:io input.tensor[3] 100
execute store result score @s tensor_xz run data get storage vve_examples:io input.tensor[4] 100
execute store result score @s tensor_yz run data get storage vve_examples:io input.tensor[5] 100
execute store result score @s cube_shift_y run data get storage vve_examples:io input.cube_shift_y 10000
execute store result score @s nvec_x run data get storage vve_examples:io input.nvec[0] 10000
execute store result score @s nvec_y run data get storage vve_examples:io input.nvec[1] 10000
execute store result score @s nvec_z run data get storage vve_examples:io input.nvec[2] 10000
execute store result score @s scale_u run data get storage vve_examples:io input.scale[0] 10000
execute store result score @s scale_v run data get storage vve_examples:io input.scale[1] 10000
execute store result score @s scale_w run data get storage vve_examples:io input.scale[2] 10000
execute store result score @s x run data get storage vve_examples:io input.center[0] 10000
execute store result score @s y run data get storage vve_examples:io input.center[1] 10000
execute store result score @s z run data get storage vve_examples:io input.center[2] 10000
execute store result score @s vx run data get storage vve_examples:io input.velocity[0] 10000
execute store result score @s vy run data get storage vve_examples:io input.velocity[1] 10000
execute store result score @s vz run data get storage vve_examples:io input.velocity[2] 10000
execute store result score @s angular_x run data get storage vve_examples:io input.angular_vec[0] 1000000
execute store result score @s angular_y run data get storage vve_examples:io input.angular_vec[1] 1000000
execute store result score @s angular_z run data get storage vve_examples:io input.angular_vec[2] 1000000
execute store result score @s angular_len run data get storage vve_examples:io input.angular_len 1000000
execute store result score @s ivec_x run data get storage vve_examples:io input.ivec[0] 10000
execute store result score @s ivec_y run data get storage vve_examples:io input.ivec[1] 10000
execute store result score @s ivec_z run data get storage vve_examples:io input.ivec[2] 10000
execute store result score @s jvec_x run data get storage vve_examples:io input.jvec[0] 10000
execute store result score @s jvec_y run data get storage vve_examples:io input.jvec[1] 10000
execute store result score @s jvec_z run data get storage vve_examples:io input.jvec[2] 10000
execute store result score @s kvec_x run data get storage vve_examples:io input.kvec[0] 10000
execute store result score @s kvec_y run data get storage vve_examples:io input.kvec[1] 10000
execute store result score @s kvec_z run data get storage vve_examples:io input.kvec[2] 10000
execute store result score @s quat_x run data get storage vve_examples:io input.xyzw[0] 10000
execute store result score @s quat_y run data get storage vve_examples:io input.xyzw[1] 10000
execute store result score @s quat_z run data get storage vve_examples:io input.xyzw[2] 10000
execute store result score @s quat_w run data get storage vve_examples:io input.xyzw[3] 10000
execute store result score @s quat_start_x run data get storage vve_examples:io input.start_xyzw[0] 10000
execute store result score @s quat_start_y run data get storage vve_examples:io input.start_xyzw[1] 10000
execute store result score @s quat_start_z run data get storage vve_examples:io input.start_xyzw[2] 10000
execute store result score @s quat_start_w run data get storage vve_examples:io input.start_xyzw[3] 10000
execute store result score @s quat_orth_x run data get storage vve_examples:io input.orth_xyzw[0] 10000
execute store result score @s quat_orth_y run data get storage vve_examples:io input.orth_xyzw[1] 10000
execute store result score @s quat_orth_z run data get storage vve_examples:io input.orth_xyzw[2] 10000
execute store result score @s quat_orth_w run data get storage vve_examples:io input.orth_xyzw[3] 10000
execute store result score @s quat_phi run data get storage vve_examples:io input.quat_phi 10000