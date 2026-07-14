#vve:test/explode/block_object/main_slow_mov
# 实体对象慢倍速主程序
# 输入<inv_dt,int>

function vve:test/explode/block_object/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion_slow_key
function vve:test/explode/block_object/_store