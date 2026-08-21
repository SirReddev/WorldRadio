# WorldRadio - Announce Song Actionbar
execute if score #song worldradio.data matches 1 run title @a actionbar ["",{"text":"Now Playing: ","color":"gray"},{"text":"Steam Gardens","color":"aqua","bold":true}]
execute if score #song worldradio.data matches 1 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Now Playing: ","color":"gray"},{"text":"Steam Gardens","color":"dark_green","bold":true}]
execute if score #song worldradio.data matches 2 run title @a actionbar ["",{"text":"Now Playing: ","color":"gray"},{"text":"Celebrawl","color":"aqua","bold":true}]
execute if score #song worldradio.data matches 2 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Now Playing: ","color":"gray"},{"text":"Celebrawl","color":"dark_green","bold":true}]
