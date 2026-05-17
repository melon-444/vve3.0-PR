#vve:seat/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage vve:io input

execute store result score width int run data get storage vve:io input.width 10000
execute store result score height int run data get storage vve:io input.height 10000