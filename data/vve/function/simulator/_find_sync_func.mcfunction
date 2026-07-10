#vve:simulator/_find_sync_func
# 查询sync回调函数
# 输入storage vve:io input
# 输出<res,int> 是否存在?1:0

scoreboard players set res int 0
execute store result score sloop int run data get storage vve:io sync_funcs
execute if score sloop int matches 1.. run function vve:simulator/find_sync_loop