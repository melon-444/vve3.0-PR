#vve:block_reader/_iter_layers
# 遍历每个16×1×16的区块层
# 输入storage vve:io run_func
# 传入世界实体为执行者

# 遍历每一层
scoreboard players set loop int 0
execute if score loop int matches ..127 run function vve:block_reader/chunk_layers_loop

# 坐标安全
tp @s 0 0 0