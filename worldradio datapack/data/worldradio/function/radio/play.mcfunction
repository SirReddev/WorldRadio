# WorldRadio - Start or Resume Playback
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

execute if score #state worldradio.data matches 1 run tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Radio is already playing.","color":"gray"}]
execute if score #state worldradio.data matches 2 run function worldradio:radio/internal/resume_playback
execute if score #state worldradio.data matches 0 run function worldradio:radio/internal/start_playback
