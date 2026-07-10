#vve:sound/friction
# vve:sound/main调用

execute if score material_response int matches 1.. run function vve:sound/friction_solid
execute if score material_response int matches -1 run function vve:sound/friction_liquid
execute if score material_response int matches -2 run function vve:sound/friction_solid

execute if score material_response int matches -3 run function vve:sound/friction_type_1
execute if score material_response int matches -4 run function vve:sound/friction_type_2
execute if score material_response int matches -5 run function vve:sound/friction_type_3
execute if score material_response int matches -6 run function vve:sound/friction_type_4

execute if score material_response int matches -7 run function vve:sound/friction_water
execute if score material_response int matches -8 run function vve:sound/friction_lava