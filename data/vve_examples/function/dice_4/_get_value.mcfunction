#vve_examples:dice_4/_get_value
# 获取骰子点数

scoreboard players set res int 0
scoreboard players set temp_max int 0
data modify storage vve_examples:io result set value [\
	[0.0d,-1.0d,0.0d],\
	[0.0d,0.3333d,-0.9428d],\
	[-0.8165d,0.3333d,0.4714d],\
	[0.8165d,0.3333d,0.4714d]\
]
data modify storage vve_examples:io temp_values set value [\
	4,\
	2,\
	3,\
	1\
]
execute if data storage vve_examples:io result[0] run function vve_examples:dice_4/get_value_loop