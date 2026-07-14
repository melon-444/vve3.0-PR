#vve:_test_auto
# 开始自动测试
# 需要安装math3.1_gelib
# 传入玩家为执行者

function math:_init
function math:_init_la
function math:_init_ge
function vve:_init
function math:particles/_load_1214
function vve:block_reader/_init

execute positioned 0 100 0 as @e[tag=math_marker,limit=1] run function vve:test_coord/_set_here_align
setblock 5 103 -5 stone
tp @s 5 104 -5 45.0 30.0

data modify storage vve:io test_pointers set value [\
	"vve:test/block_cp/",\
	"vve:test/switch_model/",\
	"vve:cublock/test/cp/",\
	"vve:box_object/test/cp/",\
	"vve:cubox/test/cp/",\
	"vve:cube/test/response/",\
	"vve:box_object/test/inertia/",\
	"vve:test/push/",\
	"vve:test/inter_bounce/",\
	"vve:test/slow_bounce/",\
	"vve:test/simulator/",\
	"vve:test/material_bounce/",\
	"vve:test/material_friction/",\
	"vve:test/sound/test/cp/",\
	"vve:test/point/",\
	"vve:test/float/",\
	"vve:test/float_cmp/",\
	"vve:block_reader/test/build_model/",\
	"vve:test/explode/"\
]

function vve:test_auto/_start