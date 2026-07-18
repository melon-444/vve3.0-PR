#vve_examples:impulse_lamp/set_operation
# vve_examples:impulse_lamp/_new调用

function vve_examples:impulse_lamp/_get
function vve_examples:impulse_lamp/_update_display

execute on passengers run data modify entity @s block_state set value {Name:"minecraft:redstone_lamp"}

scoreboard players set @s vve_material_type 8593
scoreboard players operation @s module_id = #vve_examples:impulse_lamp/ module_id