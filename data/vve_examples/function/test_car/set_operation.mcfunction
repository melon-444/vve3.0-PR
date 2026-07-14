#vve_examples:test_car/set_operation
# vve_examples:test_car/_new调用

function vve_examples:test_car/_get
function vve_examples:test_car/_update_display

execute on passengers run item replace entity @s container.0 with minecraft:sea_lantern

scoreboard players set width int 10000
scoreboard players set height int -8000
execute on passengers on passengers run function vve:seat/_prescript

scoreboard players set @s vve_material_type 2