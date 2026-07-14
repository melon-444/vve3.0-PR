#vve_examples:dice_12/face_up/{n}

# 拉取d4骰子的数据模板，投射到临时对象
data modify storage vve_examples:io input set from storage vve_examples:class dice_12_plate
function vve_examples:dice_12/_proj

# 传入当前执行坐标，传入朝向为0 0，设置临时对象位姿
execute rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to

# 旋转1面法向量朝上(其它面的法向量可以在_get_value接口中查看)
scoreboard players set uvec_x int 8506
scoreboard players set uvec_y int -5257
scoreboard players set uvec_z int 0
# 竖直朝上向量
scoreboard players set fvec_x int 0
scoreboard players set fvec_y int 10000
scoreboard players set fvec_z int 0
# 调用旋转向量四元数算法
execute as @e[tag=math_marker,limit=1] run function math:quat/_rot_uvec_fvec

# 设置上一步姿态为旋转初始姿态
function math:quat/_topose
# 设置y+为旋转轴
scoreboard players set uvec_x int 0
scoreboard players set uvec_y int 10000
scoreboard players set uvec_z int 0
function math:quat/axis/_uvecto
# 水平旋转，摆正数字(注意实际旋转角度为这里输入的两倍)

# 首先朝向0
scoreboard players set quat_phi int -630000

## 获取玩家朝向
execute store result score quat_phi_player int run data get entity @s Rotation[0] 10000
## 旋转180度
scoreboard players add quat_phi_player int 1800000
## 除以2
scoreboard players operation quat_phi_player int /= 2 int
## 相减
scoreboard players operation quat_phi int -= quat_phi_player int

execute as @e[tag=math_marker,limit=1] run function math:quat/_xyzw

# 更新角速度
scoreboard players set angular_x int 0
scoreboard players set angular_y int 0
scoreboard players set angular_z int 0
execute as @e[tag=math_marker,limit=1] run function vve:object/_set_angular

# 同步局部坐标系
function math:quat/_touvw

# 把当前临时对象构建为数据模板
function vve_examples:dice_12/_model
# 实例化
data modify storage vve_examples:io input set from storage vve_examples:io result
function vve_examples:dice_12/_new
execute as @e[tag=result,limit=1] run function vve:object/_sync_motion
scoreboard players set @e[tag=result,limit=1] killtime 120

# 取消物理运动,存储数据
scoreboard players set point dice_dpoint 8
execute as @e[tag=result,limit=1] run function vve_examples:dice_12/face_up/tag