# WorldRadio - Remove All Jukebox Models
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

function aj:worldradio_jukebox/remove/all
kill @e[type=minecraft:interaction,tag=aj.worldradio_jukebox.interaction]
tellraw @s [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Removed all jukebox models.","color":"gray"}]
