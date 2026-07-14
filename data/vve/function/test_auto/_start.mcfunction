#vve:test_auto/_start
# 开始自动测试

scoreboard players set test int 1
data modify storage vve:io test_timer set value 20

schedule function vve:test_auto/main 1t replace