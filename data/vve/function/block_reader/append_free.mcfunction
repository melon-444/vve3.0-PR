#vve:block_reader/append_free
# vve:block_reader/_init调用

data modify storage vve:io block_reader_free append value 0
execute store result storage vve:io block_reader_free[-1] int 1 run scoreboard players get loop int

scoreboard players add loop int 1
execute if score loop int matches ..127 run function vve:block_reader/append_free