#vve:simulator/_remove_tick_func
# 删除tick回调函数
# 输入storage vve:io input
# 输出<res,int> 移除成功?1:0

scoreboard players set res int 0
execute store result score sloop int run data get storage vve:io tick_funcs
execute if score sloop int matches 1.. run function vve:simulator/remove_loop