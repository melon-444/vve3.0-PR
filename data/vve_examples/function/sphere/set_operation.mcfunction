#vve_examples:sphere/set_operation
# vve_examples:sphere/_new调用

function vve_examples:sphere/_get
function vve_examples:sphere/_update_display

execute on passengers run item replace entity @s container.0 with command_block

scoreboard players set @s vve_material_type 8593
scoreboard players operation @s module_id = #vve_examples:sphere/ module_id

tag @s remove vve_impulse_receiver
tag @s add vve_large_material

# 取消展示实体显示
execute on passengers run kill @s