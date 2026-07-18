#vve_examples:_init
# 初始化vve_examples包

forceload add -1 -1 1 1



scoreboard objectives add int dummy
scoreboard players set -1 int -1
scoreboard players set 0 int 0
scoreboard players set 1 int 1
scoreboard players set 2 int 2
scoreboard players set 3 int 3
scoreboard players set 4 int 4
scoreboard players set 5 int 5
scoreboard players set 10 int 10
scoreboard players set 100 int 100
scoreboard players set 360 int 360
scoreboard players set 1000 int 1000
scoreboard players set 10000 int 10000

function vve_examples:_consts

function vve_examples:_class

function vve_examples:dice_4/init
function vve_examples:dice_6/init
function vve_examples:dice_8/init
function vve_examples:dice_10/init
function vve_examples:dice_12/init
function vve_examples:test_car/init
function vve_examples:dice_simulator/init
function vve_examples:car_simulator/init