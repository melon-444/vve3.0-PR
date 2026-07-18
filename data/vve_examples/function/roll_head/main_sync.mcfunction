#vve_examples:roll_head/main_sync
# vve_examples:roll_head/tick调用
# 实体对象运动同步主程序

function vve_examples:roll_head/_get
# 运动同步
function vve_examples:roll_head/_sync_motion
function vve_examples:roll_head/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run kill @s