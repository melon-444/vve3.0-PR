#vve_examples:dice_10/render_callback
# vve_examples:dice_10/_render调用

scoreboard players add res int 1
scoreboard players operation res int %= inp int
execute if score res int = temp_mod int run scoreboard players operation r int >< b int
function math:rgb/_render_debug_2
execute if score res int = temp_mod int run scoreboard players operation r int >< b int