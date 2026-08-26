# WorldRadio - Toggle Jukebox Shuffle Mode (Sequential <-> Shuffle)
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

scoreboard players add #jukebox_shuffle worldradio.data 1
execute if score #jukebox_shuffle worldradio.data matches 2.. run scoreboard players set #jukebox_shuffle worldradio.data 0

execute if score #jukebox_shuffle worldradio.data matches 0 run tellraw @a [{"text":"[WorldRadio] ","color":"gold","bold":true},{"text":"Jukebox Auto-Play: ","color":"gray"},{"text":"Sequential","color":"aqua","bold":true}]
execute if score #jukebox_shuffle worldradio.data matches 1 run tellraw @a [{"text":"[WorldRadio] ","color":"gold","bold":true},{"text":"Jukebox Auto-Play: ","color":"gray"},{"text":"Shuffle (Random)","color":"gold","bold":true}]
