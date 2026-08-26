# WorldRadio - Remove Nearest Jukebox Model (within 5 blocks)
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..5,limit=1,sort=nearest] at @s run function worldradio:jukebox/remove_this
tellraw @s [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Removed nearest jukebox.","color":"gray"}]
