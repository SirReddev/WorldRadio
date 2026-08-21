tag @e remove nbs_Celebrawl
scoreboard objectives remove nbs_Celebrawl
scoreboard objectives remove nbs_Celebrawl_t
datapack disable "file/Celebrawl.zip"
tellraw @s ["",{"text":"[NBS] ","color":"gold","bold":true},{"text":"Data pack ","color":"yellow"},{"text":"Celebrawl.zip","color":"gold","underlined":true},{"text":" uninstalled successfully. You may now remove it from your data pack folder.","color":"yellow"}]