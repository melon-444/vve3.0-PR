#vve:simulator/remove_sync_loop
# vve:simulator/_remove_sync_func调用

# 比较字符串
data modify storage vve:io cmp set from storage vve:io sync_funcs[0]
execute store success score sres int run data modify storage vve:io cmp set from storage vve:io input
execute if score sres int matches 0 run scoreboard players set res int 1

# 转动循环
execute if score sres int matches 1 run data modify storage vve:io sync_funcs append from storage vve:io sync_funcs[0]
data remove storage vve:io sync_funcs[0]
scoreboard players remove sloop int 1
execute if score sloop int matches 1.. run function vve:simulator/remove_sync_loop