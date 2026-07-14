#vve:block_reader/chunk_layers_loop
# vve:block_reader/_iter_chunk_layers调用

# 计算y坐标
scoreboard players operation stemp_y int = loop int
scoreboard players operation stemp_y int *= 3 int
scoreboard players remove stemp_y int 63

# 遍历水平区块
execute store result score stemp_n int run data get storage vve:io block_reader_size
scoreboard players operation sloop int = stemp_n int
scoreboard players operation sloop int *= sloop int
execute if score sloop int matches 1.. run function vve:block_reader/chunk_layers_sloop

scoreboard players add loop int 1
execute if score loop int matches ..127 run function vve:block_reader/chunk_layers_loop