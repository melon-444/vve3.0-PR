#vve:simulator/_run_tick_funcs
# 运行所有tick回调函数

data modify storage vve:io run_funcs set from storage vve:io tick_funcs
execute if data storage vve:io run_funcs[0] run function vve:simulator/run_loop