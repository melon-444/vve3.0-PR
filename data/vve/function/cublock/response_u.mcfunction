#vve:cublock/response_u
# vve:cublock/response_branch_0调用

#tellraw @a "u response"

scoreboard players set grab_layer_response int 1
scoreboard players operation nvec_x int = @s ivec_x
scoreboard players operation nvec_y int = @s ivec_y
scoreboard players operation nvec_z int = @s ivec_z
scoreboard players operation nvec_x int *= sstemp_sign_u int
scoreboard players operation nvec_y int *= sstemp_sign_u int
scoreboard players operation nvec_z int *= sstemp_sign_u int
scoreboard players operation grab_depth int = sstemp_abs_u int
#scoreboard players operation sstemp_pre_u int < sstemp_s0 int
#scoreboard players operation sstemp_pre_u int > sstemp_r0 int
#scoreboard players operation grab_depth int = sstemp_pre_u int
#execute if score sstemp_pre_u int matches ..-1 run scoreboard players operation grab_depth int *= -1 int
#scoreboard players operation grab_depth int *= -1 int
#scoreboard players operation grab_depth int += sstemp_s0 int