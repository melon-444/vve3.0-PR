#vve:id/_return
# 归还id
# 传入执行实体

data modify storage vve:io free_addr append value 0
execute store result storage vve:io free_addr[-1] int 1 run scoreboard players get @s vve_id
tag @s remove vve_id