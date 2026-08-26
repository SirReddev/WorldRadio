# WorldRadio - Set Jukebox Mode to Global
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

scoreboard players set #jukebox_mode worldradio.data 0
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Jukebox Mode: ","color":"gray"},{"text":"Global (Server-Wide)","color":"aqua","bold":true}]
