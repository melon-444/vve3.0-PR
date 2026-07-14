#vve:block_reader/init_async
# vve:block_reader/_init异步调用

# 检查区块加载完成
scoreboard players set res int 1
scoreboard players set inp int 0
data modify storage vve:io run_func set value "vve:block_reader/loaded_func"
execute as @e[tag=math_marker,limit=1] run function vve:block_reader/_iter_layer

# 放置屏障
data modify storage vve:io run_func set value "vve:block_reader/barrier_func"
execute if score res int matches 1 as @e[tag=math_marker,limit=1] run function vve:block_reader/_iter_layers

execute if score res int matches 0 run schedule function vve:block_reader/init_async 1t replace