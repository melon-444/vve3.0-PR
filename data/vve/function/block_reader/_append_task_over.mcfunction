#vve:block_reader/_append_task_over
# 添加任务
# 输入任务数据模板storage vve:io input
# 输入结束回调函数storage vve:io over_func
# over_func注意{<res,int>,<loop,int>}已被占用

data modify storage vve:io block_reader_tasks append from storage vve:io input
data modify storage vve:io block_reader_tasks[-1].over_func set from storage vve:io over_func

schedule function vve:block_reader/main 1t replace