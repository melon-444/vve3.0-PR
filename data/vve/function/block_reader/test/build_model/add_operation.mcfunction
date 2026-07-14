#vve:block_reader/test/build_model/add_operation
# vve:block_reader/test/build_model/_add_block调用

data modify entity @s block_state set from storage vve:io result
execute store result storage math:io translation[0] float 0.2 run scoreboard players operation @s u = u int
execute store result storage math:io translation[1] float 0.2 run scoreboard players operation @s v = v int
execute store result storage math:io translation[2] float 0.2 run scoreboard players operation @s w = w int
data modify entity @s transformation.translation set from storage math:io translation