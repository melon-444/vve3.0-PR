#vve_examples:slime_block/main_slow_key
# vve_examples:slime_block/tick调用
# 实体对象慢速主程序
# 输入<inv_dt,int>

function vve_examples:slime_block/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:point/_iter_motion_slow_key
function vve_examples:slime_block/_store