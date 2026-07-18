#vve_examples:impulse_lamp/light/_new
# 使用数据模板生成实体对象
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["vve_examples_light", "result"],CustomName:"vve_examples_light"}
execute as @e[tag=result,limit=1] run function vve_examples:impulse_lamp/light/set_operation