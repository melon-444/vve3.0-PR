#vve:simulator/_append_sync_func
# 添加sync回调函数
# 输入storage vve:io input
# 输出<res,int> 已经存在?1:0

function vve:simulator/_find_sync_func
execute if score res int matches 1 run return fail
data modify storage vve:io sync_funcs append from storage vve:io input