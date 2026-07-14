#vve:block_reader/work_loop
# vve:block_reader/main调用

scoreboard players set res int 1
execute store result score tempid int run data get storage vve:io block_reader_work[0]
execute as @e[tag=vve_block_reader_arrow] if score @s layer_index = tempid int run scoreboard players set res int 0

# 回收编号
execute if score res int matches 1 run function vve:block_reader/free_workid

execute if score res int matches 0 run data modify storage vve:io block_reader_work append from storage vve:io block_reader_work[0]
data remove storage vve:io block_reader_work[0]
scoreboard players remove loop int 1
execute if score loop int matches 1.. run function vve:block_reader/work_loop