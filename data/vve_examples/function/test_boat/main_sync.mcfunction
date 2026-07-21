#vve_examples:test_boat/main_sync
# vve_examples:test_boat/tick调用
# 实体对象主程序

function vve_examples:test_boat/_get
# 运动同步
function vve:object/_sync_motion
function vve_examples:test_boat/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_examples:test_boat/_del