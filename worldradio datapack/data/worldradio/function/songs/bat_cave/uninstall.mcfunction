tag @e remove nbs_batcave
scoreboard objectives remove nbs_batcave
scoreboard objectives remove nbs_batcave_t
datapack disable "file/bat_cave.zip"
tellraw @s ["",{"text":"[NBS] ","color":"gold","bold":true},{"text":"Data pack ","color":"yellow"},{"text":"bat_cave.zip","color":"gold","underlined":true},{"text":" uninstalled successfully. You may now remove it from your data pack folder.","color":"yellow"}]