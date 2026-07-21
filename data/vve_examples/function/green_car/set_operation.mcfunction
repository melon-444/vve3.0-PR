#vve_examples:green_car/set_operation
# vve_examples:green_car/_new调用

function vve_examples:green_car/_get
function vve_examples:green_car/_update_display

# 设置载具模型
execute on passengers run item replace entity @s container.0 with minecraft:clay_ball[minecraft:item_model="bx_res_bca:vehicle_0",minecraft:custom_model_data={floats:[0.0f]}]

# 设置座椅宽高（高度调整玩家位置）
scoreboard players set width int 10000
scoreboard players set height int -13000
execute on passengers on passengers run function vve:seat/_prescript

scoreboard players set @s vve_material_type 2