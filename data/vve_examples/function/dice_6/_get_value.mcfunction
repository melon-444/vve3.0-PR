#vve_examples:dice_6/_get_value
# 获取骰子点数

scoreboard players set res int 0
scoreboard players set temp_max int 0
data modify storage vve_examples:io result set value [\
	[0.0d,0.0d,1.0d],\
	[0.0d,1.0d,0.0d],\
	[1.0d,0.0d,0.0d],\
	[0.0d,0.0d,-1.0d],\
	[0.0d,-1.0d,0.0d],\
	[-1.0d,0.0d,0.0d]\
]
data modify storage vve_examples:io temp_values set value [\
	4,\
	1,\
	2,\
	3,\
	6,\
	5\
]
execute if data storage vve_examples:io result[0] run function vve_examples:dice_6/get_value_loop