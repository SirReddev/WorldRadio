# WorldRadio - Remove Boomboxes in Jukebox Zone (within radius)
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

execute unless score #jukebox_radius worldradio.data matches 1.. run scoreboard players set #jukebox_radius worldradio.data 20
execute store result storage worldradio:settings radius int 1 run scoreboard players get #jukebox_radius worldradio.data
function worldradio:jukebox/remove_zone_boomboxes_macro with storage worldradio:settings
