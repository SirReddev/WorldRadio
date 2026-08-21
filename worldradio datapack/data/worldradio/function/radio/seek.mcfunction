# WorldRadio - Seek Playback Position
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

# Uses #seek_ticks worldradio.data (positive = forward, negative = backward)
function worldradio:radio/songs/seek_song
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Seeked position by ","color":"gray"},{"score":{"name":"#seek_ticks","objective":"worldradio.data"},"color":"gold","bold":true},{"text":" ticks.","color":"gray"}]
