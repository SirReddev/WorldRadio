# WorldRadio - Advance to Next Song in Sequential Order
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

scoreboard players add #song worldradio.data 1
execute if score #song worldradio.data > #total_songs worldradio.data run scoreboard players set #song worldradio.data 1
function worldradio:radio/internal/switch_and_play
