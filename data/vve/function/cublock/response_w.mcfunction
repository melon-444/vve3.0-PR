#vve:cublock/response_w
# vve:cublock/response_branch_0调用
# vve:cublock/response_branch_1调用

#tellraw @a "w response"

scoreboard players set grab_layer_response int 1
scoreboard players operation nvec_x int = @s kvec_x
scoreboard players operation nvec_y int = @s kvec_y
scoreboard players operation nvec_z int = @s kvec_z
scoreboard players operation nvec_x int *= sstemp_sign_w int
scoreboard players operation nvec_y int *= sstemp_sign_w int
scoreboard players operation nvec_z int *= sstemp_sign_w int
scoreboard players operation grab_depth int = sstemp_abs_w int
#scoreboard players operation sstemp_pre_w int < sstemp_s2 int
#scoreboard players operation sstemp_pre_w int > sstemp_r2 int
#scoreboard players operation grab_depth int = sstemp_pre_w int
#execute if score sstemp_pre_w int matches ..-1 run scoreboard players operation grab_depth int *= -1 int
#scoreboard players operation grab_depth int *= -1 int
#scoreboard players operation grab_depth int += sstemp_s2 int