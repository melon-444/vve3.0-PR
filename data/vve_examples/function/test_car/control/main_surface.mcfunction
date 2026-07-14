#vve_examples:test_car/control/main_surface
# vve_examples:test_car/main_c调用

scoreboard players set inp int -25000
execute if score input_s int matches 1 run function vve_examples:test_car/engine/_set_power
scoreboard players set inp int 36000
execute if score input_w int matches 1 run function vve_examples:test_car/engine/_set_power
scoreboard players set inp int 0
execute if score input_w int matches 0 if score input_s int matches 0 run function vve_examples:test_car/engine/_set_power

scoreboard players set r int 50000
scoreboard players set sign int 1
execute if score input_a int matches 1 if score input_d int matches 0 as 0-0-0-0-0 run function vve_examples:test_car/_set_rotation
scoreboard players set sign int -1
execute if score input_d int matches 1 if score input_a int matches 0 as 0-0-0-0-0 run function vve_examples:test_car/_set_rotation
scoreboard players set sign int 0
execute if score input_a int matches 0 if score input_d int matches 0 as 0-0-0-0-0 run function vve_examples:test_car/_set_rotation