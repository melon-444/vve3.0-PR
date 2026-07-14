tellraw @a {"text":"-----------"}
tellraw @a {"text":"测试结束：d6"}
tellraw @a [{"text":"测试次数："},{"score":{"name":"time","objective":"d6_test"}}]
tellraw @a [{"text":"点数1："},{"score":{"name":"1","objective":"d6_test"}}]
tellraw @a [{"text":"点数2："},{"score":{"name":"2","objective":"d6_test"}}]
tellraw @a [{"text":"点数3："},{"score":{"name":"3","objective":"d6_test"}}]
tellraw @a [{"text":"点数4："},{"score":{"name":"4","objective":"d6_test"}}]
tellraw @a [{"text":"点数5："},{"score":{"name":"5","objective":"d6_test"}}]
tellraw @a [{"text":"点数6："},{"score":{"name":"6","objective":"d6_test"}}]
tellraw @a {"text":"-----------"}

scoreboard players set #start d6_test 0