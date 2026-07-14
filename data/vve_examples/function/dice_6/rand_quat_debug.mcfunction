#vve_examples:dice_6/rand_quat_debug
# 生成骰子随机四元数姿态
# 需要传入世界实体为执行者

data modify storage vve_examples:io result set value [\
	[0.0d,0.0d,1.0d],\
	[0.0d,1.0d,0.0d],\
	[1.0d,0.0d,0.0d],\
	[0.0d,0.0d,-1.0d],\
	[0.0d,-1.0d,0.0d],\
	[-1.0d,0.0d,0.0d]\
]
tellraw @a ["loop: ", {"score":{"name":"loop","objective":"int"}}]
execute if score loop int matches 1.. run function vve_examples:dice_6/rand_quat_loop
data modify entity @s Pos set from storage vve_examples:io result[0]
execute store result score uvec_x int run data get storage vve_examples:io result[0][0] 10000
execute store result score uvec_y int run data get storage vve_examples:io result[0][1] 10000
execute store result score uvec_z int run data get storage vve_examples:io result[0][2] 10000
# 设置姿态与旋转
execute positioned 0.0 0.0 0.0 facing entity @s feet run function math:quat/_facing_to
function math:quat/_topose
function math:quat/axis/_uvecto
tellraw @a ["quat_phi: ", {"score":{"name":"quat_phi","objective":"int"}}]
function math:quat/_xyzw
scoreboard players set angular_x int 0
scoreboard players set angular_y int 0
scoreboard players set angular_z int 0
function vve:object/_set_angular

function math:quat/_touvw
function math:uvw/_print