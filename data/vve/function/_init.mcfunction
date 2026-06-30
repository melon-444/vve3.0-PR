#vve:_init
# 初始化vve3.0

# 创建记分板
scoreboard objectives add vve_material_type dummy

# 设置常量
scoreboard players set 200 int 200
scoreboard players set 408 int 408
scoreboard players set 577 int 577
scoreboard players set 2378 int 2378
scoreboard players set 3363 int 3363
scoreboard players set 314159265 int 314159265
function vve:_consts

# 初始化子模块
function vve:point/init
function vve:block/init
function vve:object/init
function vve:shift/init
function vve:impulse/init
function vve:friction/init
function vve:grab_layer/init
function vve:shift_origin/init
function vve:surface/init
function vve:cube/init
function vve:cublock/init
function vve:box_object/init
function vve:cubox/init
function vve:seat/init

# 初始化模块控制
function module_control:_init