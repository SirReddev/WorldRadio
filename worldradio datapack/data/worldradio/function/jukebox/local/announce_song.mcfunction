# WorldRadio - Announce Jukebox Song Actionbar & Chat (Macro)

# Actionbar Notification (matches 0 for Both, 1 for Actionbar Only)
$execute at @s if score #announce_mode worldradio.data matches 0..1 if score @s worldradio.jb_song matches 1 as @a[distance=..$(radius)] run title @s actionbar ["",{"text":"Now Playing: ","color":"gray"},{"text":"Steam Gardens","color":"aqua","bold":true}]
$execute at @s if score #announce_mode worldradio.data matches 0..1 if score @s worldradio.jb_song matches 2 as @a[distance=..$(radius)] run title @s actionbar ["",{"text":"Now Playing: ","color":"gray"},{"text":"Celebrawl","color":"aqua","bold":true}]

# Chat Notification (matches 0 for Both, 2 for Chat Only)
$execute at @s if score #announce_mode worldradio.data matches 0 if score @s worldradio.jb_song matches 1 as @a[distance=..$(radius)] run tellraw @s [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Now Playing: ","color":"gray"},{"text":"Steam Gardens","color":"dark_green","bold":true}]
$execute at @s if score #announce_mode worldradio.data matches 2 if score @s worldradio.jb_song matches 1 as @a[distance=..$(radius)] run tellraw @s [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Now Playing: ","color":"gray"},{"text":"Steam Gardens","color":"dark_green","bold":true}]
$execute at @s if score #announce_mode worldradio.data matches 0 if score @s worldradio.jb_song matches 2 as @a[distance=..$(radius)] run tellraw @s [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Now Playing: ","color":"gray"},{"text":"Celebrawl","color":"dark_green","bold":true}]
$execute at @s if score #announce_mode worldradio.data matches 2 if score @s worldradio.jb_song matches 2 as @a[distance=..$(radius)] run tellraw @s [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Now Playing: ","color":"gray"},{"text":"Celebrawl","color":"dark_green","bold":true}]
