#vve:cube/response_v
# vve:cube/response_branch_1调用

#tellraw @a "v response"

scoreboard players set grab_layer_response int 1
scoreboard players operation nvec_x int = @s jvec_x
scoreboard players operation nvec_y int = @s jvec_y
scoreboard players operation nvec_z int = @s jvec_z
scoreboard players operation nvec_x int *= sstemp_sign_v int
scoreboard players operation nvec_y int *= sstemp_sign_v int
scoreboard players operation nvec_z int *= sstemp_sign_v int
scoreboard players operation grab_depth int = sstemp_abs_v int