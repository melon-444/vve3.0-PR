#vve_examples:test_boat/main_slow_key
# vve_examples:test_boat/tick调用
# 实体对象主程序

function vve_examples:test_boat/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion_slow_key
function vve_examples:test_boat/_store