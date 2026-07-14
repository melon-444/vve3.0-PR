#vve_examples:car_simulator/main
# 模拟器主程序

function vve_examples:car_simulator/_get

# 加载模拟器常量
function vve_examples:car_simulator/_consts

# rate倍速播放
execute if score global_rate int matches 1.. run function vve_examples:car_simulator/main_loop

# 手动调用运动同步函数
# ...

# 运动同步回调函数
execute if data storage vve:io sync_funcs[0] run function vve:simulator/_run_sync_funcs

function vve_examples:car_simulator/_store