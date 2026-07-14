#vve:test/explode/tnt/main
# vve:test/explode/tnt/tick调用
# 实体对象主程序

function marker_control:data/_get

execute unless data storage marker_control:io result.task_list[0] run return fail
data modify storage vve:io input set from storage marker_control:io result.task_list[0]
function vve:block_reader/_append_task
data remove storage marker_control:io result.task_list[0]

function marker_control:data/_store