#vve:block_reader/_init
# 初始化block_reader
# 需手动执行

function vve:block_reader/test/build_model/init
function vve:block_reader/arrow/init

data modify storage vve:io block_reader_pos set value [300000,-64,0]
data modify storage vve:io block_reader_size set value 3
data modify storage vve:io block_reader_cnt set value 0
data modify storage vve:io block_reader_tasks set value []
data modify storage vve:io block_reader_dict set value {}
data modify storage vve:io block_reader_free set value []
data modify storage vve:io block_reader_work set value []
scoreboard players set loop int 0
execute if score loop int matches ..127 run function vve:block_reader/append_free

# 加载区块
scoreboard players set inp int 0
data modify storage vve:io run_func set value "vve:block_reader/forceload_func"
execute as @e[tag=math_marker,limit=1] run function vve:block_reader/_iter_layer

schedule function vve:block_reader/init_async 1t replace