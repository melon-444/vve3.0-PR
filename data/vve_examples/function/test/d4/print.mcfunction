tellraw @a {"text":"-----------"}
tellraw @a {"text":"测试结束：d4"}
tellraw @a [{"text":"测试次数："},{"score":{"name":"time","objective":"d4_test"}}]
tellraw @a [{"text":"点数1："},{"score":{"name":"1","objective":"d4_test"}}]
tellraw @a [{"text":"点数2："},{"score":{"name":"2","objective":"d4_test"}}]
tellraw @a [{"text":"点数3："},{"score":{"name":"3","objective":"d4_test"}}]
tellraw @a [{"text":"点数4："},{"score":{"name":"4","objective":"d4_test"}}]
tellraw @a {"text":"-----------"}

scoreboard players set #start d4_test 0