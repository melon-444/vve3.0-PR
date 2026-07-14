#vve_examples:dice_4/_set_quat
# 设置骰子四元数姿态
# 输入<inp,int>
# 需要传入世界实体为执行者

data modify storage vve_examples:io result set value [\
	[0.0d,-1.0d,0.0d],\
	[0.0d,0.3333d,-0.9428d],\
	[-0.8165d,0.3333d,0.4714d],\
	[0.8165d,0.3333d,0.4714d]\
]
scoreboard players operation loop int = inp int
scoreboard players operation loop int /= 360 int
execute if score loop int matches 1.. run function vve_examples:dice_4/rand_quat_loop
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
scoreboard players operation quat_phi int = inp int
scoreboard players operation quat_phi int %= 360 int
scoreboard players operation quat_phi int /= 60 int
scoreboard players operation quat_phi int *= 600000 int
function math:quat/_xyzw
scoreboard players set angular_x int 0
scoreboard players set angular_y int 0
scoreboard players set angular_z int 0
function vve:object/_set_angular

function math:quat/_touvw