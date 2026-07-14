#vve:id/new_addr
# vve:id/_pull调用

data modify storage vve:io free_addr append value 0
execute store result storage vve:io free_addr[0] int 1 run scoreboard players add #id vve_id 1