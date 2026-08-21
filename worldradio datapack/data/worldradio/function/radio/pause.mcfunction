# WorldRadio - Pause Playback
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

execute if score #state worldradio.data matches 0 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Radio is currently stopped.","color":"gray"}]
execute if score #state worldradio.data matches 2 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Radio is already paused.","color":"gray"}]

execute if score #state worldradio.data matches 1 run function worldradio:radio/internal/pause_playback
