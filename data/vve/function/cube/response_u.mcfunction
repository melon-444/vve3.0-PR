#vve:cube/response_u
# vve:cube/response_branch_0调用

#tellraw @a "u response"

scoreboard players set grab_layer_response int 1
scoreboard players operation nvec_x int = @s ivec_x
scoreboard players operation nvec_y int = @s ivec_y
scoreboard players operation nvec_z int = @s ivec_z
scoreboard players operation nvec_x int *= sstemp_sign_u int
scoreboard players operation nvec_y int *= sstemp_sign_u int
scoreboard players operation nvec_z int *= sstemp_sign_u int
scoreboard players operation grab_depth int = sstemp_abs_u int