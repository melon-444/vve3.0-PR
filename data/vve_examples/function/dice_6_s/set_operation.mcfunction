#vve_examples:dice_6_s/set_operation
# vve_examples:dice_6_s/_new调用

function vve_examples:dice_6_s/_get
function vve_examples:dice_6_s/_update_display

execute on passengers run item replace entity @s container.0 with minecraft:clay_ball[minecraft:item_model="dice:d6"]

scoreboard players set @s vve_material_type 8593
scoreboard players operation @s module_id = #vve_examples:dice_6_s/ module_id