#vve:object/receiver_nvec
# vve:object/_receive_grab_layer调用
# vve:object/_receive_bounce_layer调用

scoreboard players operation grab_layer_receiver_nvec_x int = nvec_x int
scoreboard players operation grab_layer_receiver_nvec_y int = nvec_y int
scoreboard players operation grab_layer_receiver_nvec_z int = nvec_z int

scoreboard players operation grab_layer_receiver_v_norm int = stemp_abs int

execute if score material_receiver_response int matches -9..-7 run return fail
scoreboard players operation material_receiver_response int = material_response int