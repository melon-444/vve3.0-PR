#vve:cublock/_outer_impulse
# 处理外部冲量
# 输入storage vve:io result
# 传入实例为执行者

execute store result score res int run data get storage vve:io result
execute if data storage vve:io result[0] as 0-0-0-0-0 run function vve:cublock/outer_impulse_loop
data modify entity @s data.impulse_receiver set value []