#vve_examples:impulse_lamp/main_sync
# vve_examples:impulse_lamp/tick调用
# 实体对象运动同步主程序

function vve_examples:impulse_lamp/_get
# 运动同步
function vve_examples:impulse_lamp/_sync_motion
function vve_examples:impulse_lamp/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_examples:impulse_lamp/_del