# WorldRadio - Set Radius Preset (Macro)
$scoreboard players set #jukebox_radius worldradio.data $(radius)
$data modify storage worldradio:settings radius set value $(radius)
$tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Jukebox Zone Radius set to: ","color":"gray"},{"text":"$(radius) blocks","color":"gold","bold":true}]
dialog show @s worldradio:radius
