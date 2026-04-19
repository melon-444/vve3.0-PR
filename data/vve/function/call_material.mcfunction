#vve:call_material
# vve:_detect_material调用

execute if score @s vve_material_type matches 1 run return run function vve:cube/check_material

function module_control:_call_method {path:"check_material"}