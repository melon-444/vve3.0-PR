#vve:cublock/response_v
# vve:cublock/response_branch_1调用

#tellraw @a "v response"

scoreboard players set grab_layer_response int 1
scoreboard players operation nvec_x int = @s jvec_x
scoreboard players operation nvec_y int = @s jvec_y
scoreboard players operation nvec_z int = @s jvec_z
scoreboard players operation nvec_x int *= sstemp_sign_v int
scoreboard players operation nvec_y int *= sstemp_sign_v int
scoreboard players operation nvec_z int *= sstemp_sign_v int
scoreboard players operation grab_depth int = sstemp_abs_v int
#scoreboard players operation sstemp_pre_v int < sstemp_s1 int
#scoreboard players operation sstemp_pre_v int > sstemp_r1 int
#scoreboard players operation grab_depth int = sstemp_pre_v int
#execute if score sstemp_pre_v int matches ..-1 run scoreboard players operation grab_depth int *= -1 int
#scoreboard players operation grab_depth int *= -1 int
#scoreboard players operation grab_depth int += sstemp_s1 int