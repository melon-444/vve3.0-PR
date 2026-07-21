#vve_examples:skip_stone/main_sync
# vve_examples:skip_stone/tick调用
# 实体对象运动同步主程序

function vve_examples:skip_stone/_get
# 运动同步
function vve:point/_sync_motion
function vve_examples:skip_stone/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_examples:skip_stone/_del