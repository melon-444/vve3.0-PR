#vve:tensor/_render
# 渲染惯性张量
# 输入执行位置作为渲染原点
# 需要传入世界实体为执行者

tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score x int run data get storage math:io xyz[0] 10000
execute store result score y int run data get storage math:io xyz[1] 10000
execute store result score z int run data get storage math:io xyz[2] 10000

data modify storage math:io input set value []
scoreboard players set r int 1000
scoreboard players set inp int 256
data modify storage math:io render_command set value "function vve:tensor/render_append"
function math:sphere/_render_cnt

data modify storage math:io render_command set from storage math:class particle_commands.red_dust_large
function math:_render_coords