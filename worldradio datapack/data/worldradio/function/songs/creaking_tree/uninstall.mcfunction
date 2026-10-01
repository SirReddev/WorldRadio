tag @e remove nbs_creakingtr
scoreboard objectives remove nbs_creakingtr
scoreboard objectives remove nbs_creakingtr_t
datapack disable "file/creaking_tree.zip"
tellraw @s ["",{"text":"[NBS] ","color":"gold","bold":true},{"text":"Data pack ","color":"yellow"},{"text":"creaking_tree.zip","color":"gold","underlined":true},{"text":" uninstalled successfully. You may now remove it from your data pack folder.","color":"yellow"}]