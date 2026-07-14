#vve:block_reader/_append_task
# 添加任务
# 输入任务数据模板storage vve:io input

data modify storage vve:io block_reader_tasks append from storage vve:io input

schedule function vve:block_reader/main 1t replace