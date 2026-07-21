#vve_examples:green_car/main_sync
# vve_examples:green_car/tick调用
# 实体对象主程序

function vve_examples:green_car/_get
# 运动同步
function vve:cubox/_sync_motion
function vve_examples:green_car/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_examples:green_car/_del