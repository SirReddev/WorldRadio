# WorldRadio - Cycle Song Announcement Mode (Both -> Actionbar -> Chat -> None)
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

scoreboard players add #announce_mode worldradio.data 1
execute if score #announce_mode worldradio.data matches 4.. run scoreboard players set #announce_mode worldradio.data 0

execute if score #announce_mode worldradio.data matches 0 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Song Notification: ","color":"gray"},{"text":"Both (Actionbar & Chat)","color":"aqua","bold":true}]
execute if score #announce_mode worldradio.data matches 1 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Song Notification: ","color":"gray"},{"text":"Actionbar Only","color":"gold","bold":true}]
execute if score #announce_mode worldradio.data matches 2 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Song Notification: ","color":"gray"},{"text":"Chat Only","color":"yellow","bold":true}]
execute if score #announce_mode worldradio.data matches 3 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Song Notification: ","color":"gray"},{"text":"None (Silent)","color":"red","bold":true}]
