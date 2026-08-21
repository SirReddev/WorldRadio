# WorldRadio - Set Announcement to Chat Only
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

scoreboard players set #announce_mode worldradio.data 2
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Song Notification: ","color":"gray"},{"text":"Chat Only","color":"yellow","bold":true}]
