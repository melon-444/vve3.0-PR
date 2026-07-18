#vve_examples:dice_6_s/main_sync
# vve_examples:dice_6_s/tick调用
# 实体对象运动同步主程序

function vve_examples:dice_6_s/_get
# 运动同步
function vve:cublock/_sync_motion
function vve_examples:dice_6_s/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run kill @s