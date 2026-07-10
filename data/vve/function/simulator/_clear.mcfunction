#vve:simulator/_clear
# 清空模拟器中所有的回调函数

data modify storage vve:io tick_funcs set value []
data modify storage vve:io sync_funcs set value []