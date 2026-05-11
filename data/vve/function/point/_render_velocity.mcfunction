#vve:point/_render_velocity
# 渲染速度向量
# 输入storage math:io render_command
# 需要传入世界实体为执行者

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get z int
data modify entity @s Pos set from storage math:io xyz

scoreboard players operation vec_x int = vx int
scoreboard players operation vec_y int = vy int
scoreboard players operation vec_z int = vz int
scoreboard players operation vec_x int *= 5 int
scoreboard players operation vec_y int *= 5 int
scoreboard players operation vec_z int *= 5 int
scoreboard players set vec_n int 50
execute at @s run function math:vec/_render_debug