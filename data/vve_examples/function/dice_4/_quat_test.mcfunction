#vve_examples:dice_4/_quat_test
# 测试骰子均匀性
# 输入<roll,int>
# 输入执行位置
# 输入执行朝向
# 需要传入世界实体为执行者

scoreboard players operation temp int = roll int
scoreboard players operation temp int *= 360 int

scoreboard players set inp int 0
scoreboard players operation inp int += temp int
function vve_examples:dice_4/_roll_fixed
scoreboard players set inp int 60
scoreboard players operation inp int += temp int
execute positioned ^-1 ^ ^ run function vve_examples:dice_4/_roll_fixed
scoreboard players set inp int 120
scoreboard players operation inp int += temp int
execute positioned ^-2 ^ ^ run function vve_examples:dice_4/_roll_fixed
scoreboard players set inp int 180
scoreboard players operation inp int += temp int
execute positioned ^-3 ^ ^ run function vve_examples:dice_4/_roll_fixed
scoreboard players set inp int 240
scoreboard players operation inp int += temp int
execute positioned ^-4 ^ ^ run function vve_examples:dice_4/_roll_fixed
scoreboard players set inp int 300
scoreboard players operation inp int += temp int
execute positioned ^-5 ^ ^ run function vve_examples:dice_4/_roll_fixed