#vve:vehicle/_detect_as
# 进行一次介质探测
# 输出介质响应(各模块的临时对象)
# 传入实例为执行者

tag @s remove vve_material_box
function vve:vehicle/_get
# 介质探测
execute as 0-0-0-0-0 run function vve:vehicle/_iter_cpoints
tag @s add vve_material_box

tellraw @a ["grab_layer_response: ", {"score":{"name":"grab_layer_response","objective":"int"}}]
tellraw @a ["bounce_layer_response: ", {"score":{"name":"bounce_layer_response","objective":"int"}}]