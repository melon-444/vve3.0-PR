#vve_examples:dice_8/_rand_quat
# 生成骰子随机四元数姿态
# 需要传入世界实体为执行者

execute store result entity @s Rotation[0] float -0.0001 run random value 1..3600000
execute at @s positioned 0.0 0.0 0.0 rotated ~ 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score quat_x int run data get storage math:io xyz[2] 10000
execute store result score quat_w int run data get storage math:io xyz[0] 10000

execute store result entity @s Rotation[0] float -0.0001 run random value 1..3600000
execute at @s positioned 0.0 0.0 0.0 rotated ~ 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score quat_z int run data get storage math:io xyz[2] 10000
execute store result score quat_y int run data get storage math:io xyz[0] 10000

execute store result score inp int run random value 0..100000000
function math:_sqrt
scoreboard players operation quat_y int *= res int
scoreboard players operation quat_y int /= 10000 int
scoreboard players operation quat_z int *= res int
scoreboard players operation quat_z int /= 10000 int

scoreboard players operation inp int *= -1 int
scoreboard players add inp int 100000000
function math:_sqrt
scoreboard players operation quat_x int *= res int
scoreboard players operation quat_x int /= 10000 int
scoreboard players operation quat_w int *= res int
scoreboard players operation quat_w int /= 10000 int

scoreboard players set angular_x int 0
scoreboard players set angular_y int 0
scoreboard players set angular_z int 0
function vve:object/_set_angular
function math:quat/_touvw

# 废弃方法
return fail
data modify storage vve_examples:io result set value [\
	[0.0d,0.5773d,-0.8165d],\
	[0.0d,0.5773d,0.8165d],\
	[-0.8165d,0.5773d,0.0d],\
	[0.8165d,0.5773d,0.0d],\
	[0.0d,-0.5773d,-0.8165d],\
	[0.0d,-0.5773d,0.8165d],\
	[-0.8165d,-0.5773d,0.0d],\
	[0.8165d,-0.5773d,0.0d]\
]
execute store result score loop int run random value 0..7
execute if score loop int matches 1.. run function vve_examples:dice_8/rand_quat_loop
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