#vve:simulator/_append_tick_func
# 添加tick回调函数
# 输入storage vve:io input
# 输出<res,int> 已经存在?1:0

function vve:simulator/_find_tick_func
execute if score res int matches 1 run return fail
data modify storage vve:io tick_funcs append from storage vve:io input