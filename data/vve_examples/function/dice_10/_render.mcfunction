#vve_examples:dice_10/_render
# 渲染d10

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

scoreboard players operation x_start int = x int
scoreboard players operation y_start int = y int
scoreboard players operation z_start int = z int

scoreboard players set render_density int 15
scoreboard players set r int 255
scoreboard players set g int 0
scoreboard players set b int 0
data modify storage math:io render_command set value "function math:rgb/_render_debug_2"
#data modify storage math:io render_command set from storage math:class particle_commands.red_dust_large
data modify storage vve_examples:io temp set value [[],[]]
data modify storage vve_examples:io temp[0] set from storage math:io input[6]
data modify storage vve_examples:io temp[1] set from storage math:io input[11]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[6]
data modify storage vve_examples:io temp[1] set from storage math:io input[7]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[8]
data modify storage vve_examples:io temp[1] set from storage math:io input[11]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[8]
data modify storage vve_examples:io temp[1] set from storage math:io input[7]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[6]
data modify storage vve_examples:io temp[1] set from storage math:io input[1]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[2]
data modify storage vve_examples:io temp[1] set from storage math:io input[1]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[2]
data modify storage vve_examples:io temp[1] set from storage math:io input[7]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[6]
data modify storage vve_examples:io temp[1] set from storage math:io input[5]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[0]
data modify storage vve_examples:io temp[1] set from storage math:io input[5]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[0]
data modify storage vve_examples:io temp[1] set from storage math:io input[1]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[6]
data modify storage vve_examples:io temp[1] set from storage math:io input[10]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[4]
data modify storage vve_examples:io temp[1] set from storage math:io input[10]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[4]
data modify storage vve_examples:io temp[1] set from storage math:io input[5]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[9]
data modify storage vve_examples:io temp[1] set from storage math:io input[10]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[9]
data modify storage vve_examples:io temp[1] set from storage math:io input[11]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[3]
data modify storage vve_examples:io temp[1] set from storage math:io input[4]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[3]
data modify storage vve_examples:io temp[1] set from storage math:io input[9]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[3]
data modify storage vve_examples:io temp[1] set from storage math:io input[8]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[3]
data modify storage vve_examples:io temp[1] set from storage math:io input[2]
function vve_examples:dice_10/render_line
data modify storage vve_examples:io temp[0] set from storage math:io input[3]
data modify storage vve_examples:io temp[1] set from storage math:io input[0]
function vve_examples:dice_10/render_line

scoreboard players operation x int = x_start int
scoreboard players operation y int = y_start int
scoreboard players operation z int = z_start int