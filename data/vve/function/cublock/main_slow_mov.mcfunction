#vve:cublock/main_slow_mov
# vve:cublock/tick调用
# 实体对象慢倍速主程序
# 输入<inv_dt,int>

function vve:cublock/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion_slow_mov
function vve:cublock/_store