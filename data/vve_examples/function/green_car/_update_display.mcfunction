#vve_examples:green_car/_update_display
# 更新展示设置
# 传入green_car实例为执行者

function vve:cubox/_update_display
execute on passengers run data modify entity @s transformation.scale set value [2.0f,2.0f,2.0f]