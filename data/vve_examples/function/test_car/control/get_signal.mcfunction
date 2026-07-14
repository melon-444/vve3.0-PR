#vve_examples:test_car/control/get_signal
# vve_examples:test_car/control/main_c调用

scoreboard players set input_w int 0
scoreboard players set input_a int 0
scoreboard players set input_s int 0
scoreboard players set input_d int 0
scoreboard players set input_ctrl int 0
scoreboard players set input_shift int 0
scoreboard players set input_space int 0
execute on passengers run function vve_examples:test_car/control/get_signal_true