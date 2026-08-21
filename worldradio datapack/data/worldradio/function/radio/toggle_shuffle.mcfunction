# WorldRadio - Toggle Shuffle Mode
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

execute if score #shuffle worldradio.data matches 0 run function worldradio:radio/internal/enable_shuffle
execute if score #shuffle worldradio.data matches 1 run function worldradio:radio/internal/disable_shuffle
