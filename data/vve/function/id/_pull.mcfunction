#vve:id/_pull
# 拉取id
# 传入执行实体

execute unless data storage vve:io free_addr[0] run function vve:id/new_addr
execute store result score @s vve_id run data get storage vve:io free_addr[0]
data remove storage vve:io free_addr[0]
tag @s add vve_id