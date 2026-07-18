#vve_examples:dice_10/main_slow_mov
# vve_examples:dice_10/tick调用
# 实体对象慢速主程序
# 输入<inv_dt,int>

function vve_examples:dice_10/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion_slow_mov
function vve_examples:dice_10/_store