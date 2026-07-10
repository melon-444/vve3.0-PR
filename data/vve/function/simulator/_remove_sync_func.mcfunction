#vve:simulator/_remove_sync_func
# 删除sync回调函数
# 输入storage vve:io input
# 输出<res,int> 移除成功?1:0

scoreboard players set res int 0
execute store result score sloop int run data get storage vve:io sync_funcs
execute if score sloop int matches 1.. run function vve:simulator/remove_sync_loop