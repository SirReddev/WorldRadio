# WorldRadio - Disable Shuffle Mode
scoreboard players set #shuffle worldradio.data 0
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Shuffle mode: ","color":"gray"},{"text":"DISABLED","color":"dark_aqua","bold":true},{"text":" (Sequential order)","color":"gray"}]
