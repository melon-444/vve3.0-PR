#vve:block_reader/append_loop
# vve:block_reader/_append_corner调用

function vve:block_reader/task/_model
data modify storage vve:io block_reader_tasks append from storage vve:io result

scoreboard players add y int 1
execute if score y int <= y_max int run function vve:block_reader/append_loop