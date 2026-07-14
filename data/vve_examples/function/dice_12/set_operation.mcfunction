#vve_examples:dice_12/set_operation
# vve_examples:dice_12/_new调用

function vve_examples:dice_12/_get
function vve_examples:dice_12/_update_display

data modify entity @s transformation.right_rotation set value [0.2732665289126717f,0.0f,0.0f,0.9619383577839175f]
item replace entity @s container.0 with minecraft:clay_ball[minecraft:item_model="dice:d12"]