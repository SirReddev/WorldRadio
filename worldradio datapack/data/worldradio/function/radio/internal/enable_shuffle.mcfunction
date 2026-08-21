# WorldRadio - Enable Shuffle Mode
scoreboard players set #shuffle worldradio.data 1
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Shuffle mode: ","color":"gray"},{"text":"ENABLED","color":"gold","bold":true},{"text":" (Random songs will play after current finishes)","color":"gray"}]
