tag @e remove nbs_nightfade
scoreboard objectives remove nbs_nightfade
scoreboard objectives remove nbs_nightfade_t
datapack disable "file/night_fade.zip"
tellraw @s ["",{"text":"[NBS] ","color":"gold","bold":true},{"text":"Data pack ","color":"yellow"},{"text":"night_fade.zip","color":"gold","underlined":true},{"text":" uninstalled successfully. You may now remove it from your data pack folder.","color":"yellow"}]