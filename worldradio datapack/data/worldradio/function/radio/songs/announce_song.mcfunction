# WorldRadio - Announce Song Actionbar & Chat
# Actionbar (matches 0 for Both, 1 for Actionbar Only)
execute if score #announce_mode worldradio.data matches 0..1 if score #song worldradio.data matches 1 run title @a actionbar ["",{"text":"Now Playing: ","color":"gray"},{"text":"Steam Gardens","color":"aqua","bold":true}]
execute if score #announce_mode worldradio.data matches 0..1 if score #song worldradio.data matches 2 run title @a actionbar ["",{"text":"Now Playing: ","color":"gray"},{"text":"Celebrawl","color":"aqua","bold":true}]

# Chat Notification (matches 0 for Both, 2 for Chat Only)
execute if score #announce_mode worldradio.data matches 0 if score #song worldradio.data matches 1 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Now Playing: ","color":"gray"},{"text":"Steam Gardens","color":"dark_green","bold":true}]
execute if score #announce_mode worldradio.data matches 2 if score #song worldradio.data matches 1 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Now Playing: ","color":"gray"},{"text":"Steam Gardens","color":"dark_green","bold":true}]
execute if score #announce_mode worldradio.data matches 0 if score #song worldradio.data matches 2 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Now Playing: ","color":"gray"},{"text":"Celebrawl","color":"dark_green","bold":true}]
execute if score #announce_mode worldradio.data matches 2 if score #song worldradio.data matches 2 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Now Playing: ","color":"gray"},{"text":"Celebrawl","color":"dark_green","bold":true}]
