#vve_examples:car_simulator/init
# 初始化car_simulator模拟器

data modify storage vve:io tick_funcs set value []
data modify storage vve:io sync_funcs set value []

function vve_examples:car_simulator/_class