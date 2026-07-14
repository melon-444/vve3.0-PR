#vve_examples:dice_12/_rand_quat
# 生成骰子随机四元数姿态
# 需要传入世界实体为执行者

data modify storage vve_examples:io result set value [\
	[0.0d,0.8506d,0.5257d],\
	[0.8506d,0.5257d,0.0d],\
	[0.5257d,0.0d,0.8506d],\
	[0.0d,-0.8506d,0.5257d],\
	[-0.8506d,0.5257d,0.0d],\
	[0.5257d,0.0d,-0.8506d],\
	[0.0d,0.8506d,-0.5257d],\
	[0.8506d,-0.5257d,0.0d],\
	[-0.5257d,0.0d,0.8506d],\
	[0.0d,-0.8506d,-0.5257d],\
	[-0.8506d,-0.5257d,0.0d],\
	[-0.5257d,0.0d,-0.8506d]\
]
execute store result score loop int run random value 0..11
execute if score loop int matches 1.. run function vve_examples:dice_12/rand_quat_loop
data modify entity @s Pos set from storage vve_examples:io result[0]
# 设置姿态与旋转
execute positioned 0.0 0.0 0.0 facing entity @s feet run function math:quat/_facing_to
scoreboard players operation quat_x int *= -1 int
scoreboard players operation quat_y int *= -1 int
scoreboard players operation quat_z int *= -1 int
function math:quat/_topose
scoreboard players set uvec_x int 0
scoreboard players set uvec_y int 0
scoreboard players set uvec_z int 10000
function math:quat/axis/_uvecto
execute store result score quat_phi int run random value 1..3600000
function math:quat/_xyzw
scoreboard players set angular_x int 0
scoreboard players set angular_y int 0
scoreboard players set angular_z int 0
function vve:object/_set_angular

function math:quat/_touvw