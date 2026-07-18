#vve_examples:impulse_lamp/light/_del
# 销毁实体对象
# 输入执行实体

execute at @s if block ~ ~ ~ light run setblock ~ ~ ~ air

kill @s