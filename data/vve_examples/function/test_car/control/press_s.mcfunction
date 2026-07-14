#vve_examples:test_car/control/press_s
# vve_examples:test_car/control/main_surface调用

scoreboard players set inp int -8000
function vve_examples:test_car/engine/_set_power

scoreboard players set friction_response int 5000
function vve:object/_apply_friction