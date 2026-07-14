#vve_examples:dice_8/_roll_fixed
# 进行一次固定随机骰子实验
# 输入<inp,int>
# 输入执行位置
# 输入执行朝向
# 需要传入世界实体为执行者

# 生成骰子
data modify storage vve_examples:io input set from storage vve_examples:class dice_8_plate
tp @s ~ ~ ~
data modify storage vve_examples:io input.center set from entity @s Pos
function vve_examples:dice_8/_new
execute as @e[tag=result,limit=1] run function vve_examples:dice_8/_get

function vve_examples:dice_8/_set_quat

# 设置冲量
tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score impulse_x int run data get storage math:io xyz[0] 10000
execute store result score impulse_y int run data get storage math:io xyz[1] 10000
execute store result score impulse_z int run data get storage math:io xyz[2] 10000
scoreboard players operation impulse_y int += a int
scoreboard players operation impulse_y int += a int
scoreboard players operation impulse_y int += a int
execute rotated ~ 0.0 positioned 0.0 0.0 0.0 run tp @s ^ ^ ^2.0
data modify storage math:io xyz set from entity @s Pos
execute store result score impulse_fx int run data get storage math:io xyz[0] 10000
execute store result score impulse_fz int run data get storage math:io xyz[2] 10000
scoreboard players set impulse_fy int 0
scoreboard players operation impulse_x int -= impulse_fx int
scoreboard players operation impulse_z int -= impulse_fz int
function vve:block/_apply_impulse

execute as @e[tag=result,limit=1] run function vve_examples:dice_8/_store

# 设置销毁事件
execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.del_func set value "vve_examples:dice_8/_print_value_as"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_todel
scoreboard players set @e[tag=result,limit=1] killtime 12000