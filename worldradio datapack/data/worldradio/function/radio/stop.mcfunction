# WorldRadio - Stop Playback and Reset Position
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

function worldradio:radio/internal/stop_playback
function worldradio:radio/internal/clear_display
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Stopped playback.","color":"red"}]
