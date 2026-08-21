# WorldRadio - Set Announcement to Both (Actionbar & Chat)
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

scoreboard players set #announce_mode worldradio.data 0
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Song Notification: ","color":"gray"},{"text":"Both (Actionbar & Chat)","color":"aqua","bold":true}]
