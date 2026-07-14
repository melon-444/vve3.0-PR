#vve:block_reader/arrow_loop
# vve:block_reader/start_task_loop调用

scoreboard players operation z int = z_min int
execute if score z int <= z_max int run function vve:block_reader/arrow_sloop

scoreboard players add x int 1
execute if score x int <= x_max int run function vve:block_reader/arrow_loop