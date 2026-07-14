#vve:block_reader/chunk_layers_sloop
# vve:block_reader/_iter_layer调用
# vve:block_reader/chunk_layers_loop调用

# 计算xz坐标
execute store result score stemp_x int store result score stemp_z int run scoreboard players remove sloop int 1
scoreboard players operation stemp_x int /= stemp_n int
scoreboard players operation stemp_z int %= stemp_n int
scoreboard players operation stemp_x int *= 16 int
scoreboard players operation stemp_z int *= 16 int
execute store result score stemp_s int run data get storage vve:io block_reader_pos[0]
scoreboard players operation stemp_x int += stemp_s int
execute store result score stemp_s int run data get storage vve:io block_reader_pos[2]
scoreboard players operation stemp_x int += stemp_s int

# 访问坐标，call回调函数
#tellraw @a ["stemp_xyz: ",{"score":{"name":"stemp_x","objective":"int"}},", ",{"score":{"name":"stemp_y","objective":"int"}},", ",{"score":{"name":"stemp_z","objective":"int"}}]
execute store result storage math:io xyz[0] double 1 run scoreboard players get stemp_x int
execute store result storage math:io xyz[1] double 1 run scoreboard players get stemp_y int
execute store result storage math:io xyz[2] double 1 run scoreboard players get stemp_z int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:block_reader/call_func with storage vve:io {}

execute if score sloop int matches 1.. run function vve:block_reader/chunk_layers_sloop