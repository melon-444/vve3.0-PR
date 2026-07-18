#vve_examples:dice_10/main_sync
# vve_examples:dice_10/tick调用
# 实体对象运动同步主程序

function vve_examples:dice_10/_get
# 运动同步
function vve:object/_sync_motion
function vve_examples:dice_10/_store
function vve_examples:dice_10/_render

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_examples:dice_10/_del