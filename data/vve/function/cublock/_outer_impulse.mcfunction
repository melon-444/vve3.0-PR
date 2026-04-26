#vve:cublock/_outer_impluse
# 处理外部冲量
# 输入storage vve:io result
# 传入实例为执行者

execute if data storage vve:io result[0] as 0-0-0-0-0 run function vve:cublock/outer_impluse_loop
data modify entity @s data.impulse_receiver set value []