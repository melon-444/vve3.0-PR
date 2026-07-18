#vve_examples:test

# 0<->11
# 1<->9
# 2<->10
# 3<->6
# 4<->7
# 5<->8

data modify storage math:io input set value [\
	[0.5257311, 0.381966, 0.8506508],\
	[-0.2008114, 0.618034, 0.8506508],\
	[-0.6498394, 0, 0.8506508],\
	[0.5257311, -1.618034, 0.8506508],\
	[1.051462, 0, -0.2008114],\
	[0.8506508, 0.618034, 0.2008114],\
	[-0.5257311, 1.618034, -0.8506508],\
	[-1.051462, 0, 0.2008114],\
	[-0.8506508, -0.618034, -0.2008114],\
	[0.2008114, -0.618034, -0.8506508],\
	[0.6498394, 0, -0.8506508],\
	[-0.5257311, -0.381966, -0.8506508]\
]
data modify storage math:io temp set value [\
	[0.0, 0.0, 1.0],\
	[0.0, 0.0, -1.0],\
	[1.0, 0.0, 0.105572809],\
	[0.309016994, 0.951056516, 0.105572809],\
	[-0.809016994, 0.587785252, 0.105572809],\
	[-0.809016994, -0.587785252, 0.105572809],\
	[0.309016994, -0.951056516, 0.105572809],\
	[0.809016994, 0.587785252, -0.105572809],\
	[-0.309016994, 0.951056516, -0.105572809],\
	[-1.0, 0.0, -0.105572809],\
	[-0.309016994, -0.951056516, -0.105572809],\
	[0.809016994, -0.587785252, -0.105572809]\
]
#data modify storage math:io render_command set from storage math:class particle_commands.red_dust
#execute as 0-0-0-0-0 run function math:_render_coords

# 6-11 6-7 8-11 8-7
# 6-1 2-1 2-7
# 6-5 0-5 0-1
# 6-10 4-10 4-5
# 9-10 9-11
# 3-4 3-9
# 3-8 3-2
# 3-0

scoreboard players set render_density int 15
data modify storage math:io render_command set from storage math:class particle_commands.red_dust_large
data modify storage vve_examples:io temp set value [[],[]]
data modify storage vve_examples:io temp[0] set from storage math:io input[6]
data modify storage vve_examples:io temp[1] set from storage math:io input[11]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[6]
data modify storage vve_examples:io temp[1] set from storage math:io input[7]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[8]
data modify storage vve_examples:io temp[1] set from storage math:io input[11]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[8]
data modify storage vve_examples:io temp[1] set from storage math:io input[7]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[6]
data modify storage vve_examples:io temp[1] set from storage math:io input[1]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[2]
data modify storage vve_examples:io temp[1] set from storage math:io input[1]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[2]
data modify storage vve_examples:io temp[1] set from storage math:io input[7]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[6]
data modify storage vve_examples:io temp[1] set from storage math:io input[5]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[0]
data modify storage vve_examples:io temp[1] set from storage math:io input[5]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[0]
data modify storage vve_examples:io temp[1] set from storage math:io input[1]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[6]
data modify storage vve_examples:io temp[1] set from storage math:io input[10]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[4]
data modify storage vve_examples:io temp[1] set from storage math:io input[10]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[4]
data modify storage vve_examples:io temp[1] set from storage math:io input[5]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[9]
data modify storage vve_examples:io temp[1] set from storage math:io input[10]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[9]
data modify storage vve_examples:io temp[1] set from storage math:io input[11]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[3]
data modify storage vve_examples:io temp[1] set from storage math:io input[4]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[3]
data modify storage vve_examples:io temp[1] set from storage math:io input[9]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[3]
data modify storage vve_examples:io temp[1] set from storage math:io input[8]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[3]
data modify storage vve_examples:io temp[1] set from storage math:io input[2]
function vve_examples:test_render
data modify storage vve_examples:io temp[0] set from storage math:io input[3]
data modify storage vve_examples:io temp[1] set from storage math:io input[0]
function vve_examples:test_render

execute unless entity @e[tag=test,tag=text_render] run scoreboard players set test int -1
execute unless score test int matches -1 run return fail

tag @e[tag=test] remove test
#scoreboard players operation inp int %= 12 int
#scoreboard players operation loop int = inp int
scoreboard players set loop int 12
execute if score loop int matches 1.. run function vve_examples:test_loop

scoreboard players set test int 1