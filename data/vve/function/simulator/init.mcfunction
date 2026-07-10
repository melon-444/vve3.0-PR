#vve:simulator/init
# 初始化simulator模块

data modify storage vve:io tick_funcs set value []
data modify storage vve:io sync_funcs set value []

function vve:simulator/_class