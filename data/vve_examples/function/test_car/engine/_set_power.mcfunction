#vve:examples:test_car/engine/_set_power
# 设置引擎运行功率
# 输入<inp,int>

scoreboard players operation damp_x int += target_power int
scoreboard players operation target_power int = inp int
scoreboard players operation damp_x int -= target_power int