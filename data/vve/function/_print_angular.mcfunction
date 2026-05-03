#vve:_print_angular
# 打印角速度

tellraw @a ["angular: ",{"score":{"name":"angular_x","objective":"int"}},", ",{"score":{"name":"angular_y","objective":"int"}},", ",{"score":{"name":"angular_z","objective":"int"}}]
tellraw @a ["angular_len: ", {"score":{"name":"angular_len","objective":"int"}}]