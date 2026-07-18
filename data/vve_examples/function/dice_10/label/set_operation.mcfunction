#vve_examples:dice_10/label/set_operation
# vve_examples:dice_10/label/_summon_here调用

data modify entity @s text set value {"score":{"name":"res","objective":"int"}}
scoreboard players set @s killtime 500

function marker_control:data/_get
data modify storage marker_control:io result.del_func set value "vve:id/_return"
function marker_control:data/_store
tag @s add entity_todel

function vve:id/_pull
scoreboard players operation @s int = inp int