#vve:test_auto/main
# vve:test_auto/_start异步调用

# 计时逻辑
execute store result score temp_time int run data get storage vve:io test_timer
execute if score test int matches 1 run scoreboard players operation temp_time int < 20 int
scoreboard players operation temp_time int > 1 int
execute store result storage vve:io test_timer int 1 run scoreboard players remove temp_time int 1

# 计时为0，当前测试未结束：结束当前测试
execute if score temp_time int matches 0 unless score test int matches 1 run function vve:test_auto/stop_cur_test
# 计时为0，当前测试已结束，没有剩余测试：停止test_auto运行
execute if score temp_time int matches 0 if score test int matches 1 unless data storage vve:io test_pointers[0] run return run tellraw @a "[vve:test_auto]: done."
# 计时为0，当前测试已结束，还有剩余测试：开始下一个测试
execute if score temp_time int matches 0 if score test int matches 1 if data storage vve:io test_pointers[0] run function vve:test_auto/start_next_test

schedule function vve:test_auto/main 1t replace