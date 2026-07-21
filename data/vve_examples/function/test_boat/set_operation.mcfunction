#vve_examples:test_boat/set_operation
# vve_examples:test_boat/_new调用

function vve_examples:test_boat/_get
function vve_examples:test_boat/_update_display

# 设置载具模型
item replace entity @s container.0 with minecraft:sea_lantern

# 设置座椅宽高（高度调整玩家位置）
scoreboard players set width int 10000
scoreboard players set height int 0
execute on passengers run function vve:seat/_prescript

scoreboard players set @s vve_material_type 2