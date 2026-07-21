#vve_examples:test_boat/test/_auto
# 自动化测试
# 以玩家为执行者
# 需要安装math3.1_gelib

execute positioned 0 100 0 as @e[tag=math_marker,limit=1] run function vve:test_coord/_set_here_align
setblock 5 103 -5 stone
tp @s 5 104 -5 45.0 30.0

data modify storage vve:io test_pointers set value [\
	"vve_examples:test_boat/test/cp/",\
	"vve_examples:test_boat/test/fall/",\
	"vve_examples:test_boat/test/push/",\
	"vve_examples:test_boat/test/float/",\
	"vve_examples:test_boat/test/inter_bounce/"\
]

function vve:test_auto/_start