#vve:test/explode/block_object/_print
# 打印临时对象数据

tellraw @a ["_this: ", "{"]
tellraw @a ["    ", "a: ", {"score":{"name":"a", "objective":"int"}}, ","]
tellraw @a ["    ", "mass: ", {"score":{"name":"mass", "objective":"int"}}, ","]
tellraw @a ["    ", "inertia: ", {"score":{"name":"inertia", "objective":"int"}}, ","]
tellraw @a ["    ", "center: ", "[", {"score":{"name":"x", "objective":"int"}}, ", " ,{"score":{"name":"y", "objective":"int"}}, ", " ,{"score":{"name":"z", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "velocity: ", "[", {"score":{"name":"vx", "objective":"int"}}, ", " ,{"score":{"name":"vy", "objective":"int"}}, ", " ,{"score":{"name":"vz", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "angular_vec: ", "[", {"score":{"name":"angular_x", "objective":"int"}}, ", " ,{"score":{"name":"angular_y", "objective":"int"}}, ", " ,{"score":{"name":"angular_z", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "angular_len: ", {"score":{"name":"angular_len", "objective":"int"}}, ","]
tellraw @a ["    ", "uvw_coord: ", "{"]
tellraw @a ["    ", "    ", "ivec: ", "[", {"score":{"name":"ivec_x", "objective":"int"}}, ", " ,{"score":{"name":"ivec_y", "objective":"int"}}, ", " ,{"score":{"name":"ivec_z", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "    ", "jvec: ", "[", {"score":{"name":"jvec_x", "objective":"int"}}, ", " ,{"score":{"name":"jvec_y", "objective":"int"}}, ", " ,{"score":{"name":"jvec_z", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "    ", "kvec: ", "[", {"score":{"name":"kvec_x", "objective":"int"}}, ", " ,{"score":{"name":"kvec_y", "objective":"int"}}, ", " ,{"score":{"name":"kvec_z", "objective":"int"}}, "]"]
tellraw @a ["    ", "}", ","]
tellraw @a ["    ", "quaternion: ", "{"]
tellraw @a ["    ", "    ", "xyzw: ", "[", {"score":{"name":"quat_x", "objective":"int"}}, ", " ,{"score":{"name":"quat_y", "objective":"int"}}, ", " ,{"score":{"name":"quat_z", "objective":"int"}}, ", " ,{"score":{"name":"quat_w", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "    ", "start_xyzw: ", "[", {"score":{"name":"quat_start_x", "objective":"int"}}, ", " ,{"score":{"name":"quat_start_y", "objective":"int"}}, ", " ,{"score":{"name":"quat_start_z", "objective":"int"}}, ", " ,{"score":{"name":"quat_start_w", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "    ", "orth_xyzw: ", "[", {"score":{"name":"quat_orth_x", "objective":"int"}}, ", " ,{"score":{"name":"quat_orth_y", "objective":"int"}}, ", " ,{"score":{"name":"quat_orth_z", "objective":"int"}}, ", " ,{"score":{"name":"quat_orth_w", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "    ", "phi: ", {"score":{"name":"quat_phi", "objective":"int"}}]
tellraw @a ["    ", "}"]
tellraw @a "}"