#vve_examples:dice_8/_get_value
# 获取骰子点数

scoreboard players set res int 0
scoreboard players set temp_max int 0
data modify storage vve_examples:io result set value [\
	[0.0d,0.5773d,-0.8165d],\
	[0.0d,0.5773d,0.8165d],\
	[-0.8165d,0.5773d,0.0d],\
	[0.8165d,0.5773d,0.0d],\
	[0.0d,-0.5773d,-0.8165d],\
	[0.0d,-0.5773d,0.8165d],\
	[-0.8165d,-0.5773d,0.0d],\
	[0.8165d,-0.5773d,0.0d]\
]
data modify storage vve_examples:io temp_values set value [\
	3,\
	1,\
	2,\
	4,\
	7,\
	5,\
	8,\
	6\
]
execute if data storage vve_examples:io result[0] run function vve_examples:dice_8/get_value_loop