tag @e remove nbs_steamgarde
scoreboard objectives remove nbs_steamgarde
scoreboard objectives remove nbs_steamgarde_t
datapack disable "file/steam_gardens.zip"
tellraw @s ["",{"text":"[NBS] ","color":"gold","bold":true},{"text":"Data pack ","color":"yellow"},{"text":"steam_gardens.zip","color":"gold","underlined":true},{"text":" uninstalled successfully. You may now remove it from your data pack folder.","color":"yellow"}]