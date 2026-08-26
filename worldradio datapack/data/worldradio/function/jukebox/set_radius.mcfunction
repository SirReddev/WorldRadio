# WorldRadio - Set Jukebox Zone Radius (Macro)
$scoreboard players set #jukebox_radius worldradio.data $(radius)
execute store result storage worldradio:settings radius int 1 run scoreboard players get #jukebox_radius worldradio.data
$tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Jukebox Zone Radius set to: ","color":"gray"},{"text":"$(radius) blocks","color":"gold","bold":true}]
