#vve:simulator/main
# 实体对象主程序

function vve:simulator/_get

# 加载模拟器常量
function vve:simulator/_consts

# rate倍速播放
execute if score global_rate int matches 1.. run function vve:simulator/main_loop

# 手动调用运动同步函数
# ...

# 运动同步回调函数
execute if data storage vve:io sync_funcs[0] run function vve:simulator/_run_sync_funcs

function vve:simulator/_store