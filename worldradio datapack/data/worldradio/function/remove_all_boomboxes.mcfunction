# WorldRadio - Remove All Boombox Models
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

function aj:worldradio_boombox/remove/all
tellraw @s [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Removed all boombox models.","color":"gray"}]
