#vve_examples:test_car/_receive_shift
# 接收位移响应
# 迭代receiver{...}
# 迭代storage vve:io shift_points
# 迭代storage vve:io shift_origins

scoreboard players set shift_receiver_response int 1

execute if score shift_x int matches 1.. if score shift_receiver_x int matches 0.. run \
	scoreboard players operation shift_receiver_x int > shift_x int
execute if score shift_x int matches ..-1 if score shift_receiver_x int matches ..0 run \
	scoreboard players operation shift_receiver_x int < shift_x int
execute if score shift_x int matches 1.. if score shift_receiver_x int matches ..0 run \
	scoreboard players operation shift_receiver_x int += shift_x int
execute if score shift_x int matches ..-1 if score shift_receiver_x int matches 0.. run \
	scoreboard players operation shift_receiver_x int += shift_x int

execute if score shift_y int matches 1.. if score shift_receiver_y int matches 0.. run \
	scoreboard players operation shift_receiver_y int > shift_y int
execute if score shift_y int matches ..-1 if score shift_receiver_y int matches ..0 run \
	scoreboard players operation shift_receiver_y int < shift_y int
execute if score shift_y int matches 1.. if score shift_receiver_y int matches ..0 run \
	scoreboard players operation shift_receiver_y int += shift_y int
execute if score shift_y int matches ..-1 if score shift_receiver_y int matches 0.. run \
	scoreboard players operation shift_receiver_y int += shift_y int

execute if score shift_z int matches 1.. if score shift_receiver_z int matches 0.. run \
	scoreboard players operation shift_receiver_z int > shift_z int
execute if score shift_z int matches ..-1 if score shift_receiver_z int matches ..0 run \
	scoreboard players operation shift_receiver_z int < shift_z int
execute if score shift_z int matches 1.. if score shift_receiver_z int matches ..0 run \
	scoreboard players operation shift_receiver_z int += shift_z int
execute if score shift_z int matches ..-1 if score shift_receiver_z int matches 0.. run \
	scoreboard players operation shift_receiver_z int += shift_z int

#scoreboard players add shift_cnt int 1
#scoreboard players operation shift_receiver_x int += shift_x int
#scoreboard players operation shift_receiver_y int += shift_y int
#scoreboard players operation shift_receiver_z int += shift_z int

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get c_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get c_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get c_z int
data modify storage vve:io shift_origins append from storage math:io xyz

#tellraw @a "receive shift"
#function vve:shift/_print
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation shift_x int += c_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation shift_y int += c_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation shift_z int += c_z int
data modify storage vve:io shift_points append from storage math:io xyz
#tellraw @a ["shift_point: ", {"nbt":"xyz","storage":"math:io"}]

# 旧逻辑
#execute if score shift_x int matches 1.. run scoreboard players operation shift_receiver_x int > shift_x int
#execute if score shift_receiver_x int matches ..0 if score shift_x int matches ..-1 \
#	run scoreboard players operation shift_receiver_x int < shift_x int
#
#execute if score shift_y int matches 1.. run scoreboard players operation shift_receiver_y int > shift_y int
#execute if score shift_receiver_y int matches ..0 if score shift_y int matches ..-1 \
#	run scoreboard players operation shift_receiver_y int < shift_y int
#
#execute if score shift_z int matches 1.. run scoreboard players operation shift_receiver_z int > shift_z int
#execute if score shift_receiver_z int matches ..0 if score shift_z int matches ..-1 \
#	run scoreboard players operation shift_receiver_z int < shift_z int