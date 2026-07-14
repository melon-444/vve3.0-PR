#vve:block_reader/task/append_loop
# vve:block_reader/task/_corner_list调用

function vve:block_reader/task/_model
data modify storage vve:io stemp append from storage vve:io result

scoreboard players add y int 1
execute if score y int <= y_max int run function vve:block_reader/task/append_loop