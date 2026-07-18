#vve_examples:impulse_lamp/_light_off
# 传入实例为执行者

execute on passengers run data remove entity @s brightness
execute on passengers run data modify entity @s block_state.Properties.lit set value "false"
execute at @s run playsound minecraft:block.lever.click player @a ~ ~ ~ 1 0.5