#vve:simulator/_class
# 生成预设静态数据模板

function vve:simulator/_zero
scoreboard players set global_inv_dt int 1
scoreboard players set global_set_inv_dt int 1
scoreboard players set global_rate int 1
function vve:simulator/_model
data modify storage vve:io simulator_plate set from storage vve:io result