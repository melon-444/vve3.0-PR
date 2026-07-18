#vve_examples:impulse_lamp/main_off
# vve_examples:impulse_lamp/main_c调用

execute unless entity @s[tag=vve_surface] if score impulse_response int matches 1 run \
	return run function vve_examples:impulse_lamp/s_on
execute if data storage vve:io result[0] run return run function vve_examples:impulse_lamp/s_on