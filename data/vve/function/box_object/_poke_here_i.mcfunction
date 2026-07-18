#vve:box_object/_poke_here_i
# 设置一个作用点为执行位置，方向为执行朝向，大小为inp的冲量
# 输入<inp,int,1w>
# 输入执行位置
# 输入执行朝向
# 需要传入世界实体为执行者

# 冲量作用位置
tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score impulse_x int run data get storage math:io xyz[0] 10000
execute store result score impulse_y int run data get storage math:io xyz[1] 10000
execute store result score impulse_z int run data get storage math:io xyz[2] 10000
# 冲量矢量
execute positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score impulse_fx int run data get storage math:io xyz[0] 10000
execute store result score impulse_fy int run data get storage math:io xyz[1] 10000
execute store result score impulse_fz int run data get storage math:io xyz[2] 10000
scoreboard players operation impulse_fx int *= inp int
scoreboard players operation impulse_fy int *= inp int
scoreboard players operation impulse_fz int *= inp int
scoreboard players operation impulse_fx int /= 10000 int
scoreboard players operation impulse_fy int /= 10000 int
scoreboard players operation impulse_fz int /= 10000 int

function vve:box_object/_apply_impulse