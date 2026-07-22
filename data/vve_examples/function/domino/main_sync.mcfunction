#vve_examples:domino/main_sync
# vve_examples:domino/tick调用
# 实体对象运动同步主程序

function vve_examples:domino/_get
# 运动同步
function vve:cubox/_sync_motion
function vve_examples:domino/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_examples:domino/_del