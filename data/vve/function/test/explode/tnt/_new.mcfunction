#vve:test/explode/tnt/_new
# 使用数据模板生成实体对象
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon tnt ~ ~ ~ {Tags:["vve_tnt", "result"],CustomName:"vve_tnt",fuse:1000s}
execute as @e[tag=result,limit=1] run function vve:test/explode/tnt/set_operation