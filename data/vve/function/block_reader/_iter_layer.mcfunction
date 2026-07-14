#vve:block_reader/_iter_layer
# 遍历某一层每个16×1×16的区块
# 输入层编号<inp,int>
# 输入storage vve:io run_func
# 传入世界实体为执行者

# 计算y坐标
scoreboard players operation stemp_y int = inp int
scoreboard players operation stemp_y int *= 3 int
scoreboard players remove stemp_y int 63

# 遍历水平区块
execute store result score stemp_n int run data get storage vve:io block_reader_size
scoreboard players operation sloop int = stemp_n int
scoreboard players operation sloop int *= sloop int
execute if score sloop int matches 1.. run function vve:block_reader/chunk_layers_sloop

# 坐标安全
tp @s 0 0 0