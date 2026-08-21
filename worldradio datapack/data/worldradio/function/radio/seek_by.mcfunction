# WorldRadio - Seek By Macro Argument
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

# Example: /function worldradio:radio/seek_by {ticks: 200}
$scoreboard players set #seek_ticks worldradio.data $(ticks)
function worldradio:radio/seek
