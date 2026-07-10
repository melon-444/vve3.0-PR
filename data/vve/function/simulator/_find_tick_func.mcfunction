#vve:simulator/_find_tick_func
# 查询tick回调函数
# 输入storage vve:io input
# 输出<res,int> 是否存在?1:0

scoreboard players set res int 0
execute store result score sloop int run data get storage vve:io tick_funcs
execute if score sloop int matches 1.. run function vve:simulator/find_loop