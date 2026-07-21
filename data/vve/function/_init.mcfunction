#vve:_init
# 初始化vve3.0

# 创建记分板
scoreboard objectives add vve_material_type dummy
scoreboard objectives add vve_id dummy

# 设置常量
scoreboard players set 20 int 20
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
function vve:material/init
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
function vve:sim_slow/init
function vve:simulator/init
function vve:test_coord/init
function vve:shader/init
function vve:vehicle/init
function vve:id/init
function vve:test_auto/init
function vve:sound/init

# 初始化模块控制
function module_control:_init

# 初始化记录
function vve:_version
scoreboard players operation vve_init_version int = version_vve int