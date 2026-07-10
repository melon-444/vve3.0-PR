#vve:simulator/run_loop
# vve:simulator/_run_tick_func调用
# vve:simulator/_run_sync_func调用

data modify storage vve:io run_func set from storage vve:io run_funcs[0]
function vve:simulator/run_func with storage vve:io {}

data remove storage vve:io run_funcs[0]
execute if data storage vve:io run_funcs[0] run function vve:simulator/run_loop