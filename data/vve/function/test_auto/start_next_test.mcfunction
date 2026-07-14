#vve:test_auto/start_next_test
# vve:test_auto/main调用

scoreboard players set test int -1
data modify storage vve:io test_timer set from storage vve:io test_max_time

data modify storage vve:io test_pointer set from storage vve:io test_pointers[0]
function vve:test_auto/call_test_start with storage vve:io {}
data remove storage vve:io test_pointers[0]

tellraw @a ["[vve:test_auto]: ",{"nbt":"test_pointer","storage":"vve:io"}," started"]