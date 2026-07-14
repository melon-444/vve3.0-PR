#vve:block_reader/_uninstall
# 卸载block_reader
# 需手动执行

# 清除屏障
scoreboard players set res int 1
data modify storage vve:io run_func set value "vve:block_reader/air_func"
execute if score res int matches 1 as @e[tag=math_marker,limit=1] run function vve:block_reader/_iter_layers

# 加载区块
scoreboard players set inp int 0
data modify storage vve:io run_func set value "vve:block_reader/uninstall_func"
execute as @e[tag=math_marker,limit=1] run function vve:block_reader/_iter_layer