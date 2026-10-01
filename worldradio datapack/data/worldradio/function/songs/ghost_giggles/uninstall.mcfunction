tag @e remove nbs_ghostgiggl
scoreboard objectives remove nbs_ghostgiggl
scoreboard objectives remove nbs_ghostgiggl_t
datapack disable "file/ghost_giggles.zip"
tellraw @s ["",{"text":"[NBS] ","color":"gold","bold":true},{"text":"Data pack ","color":"yellow"},{"text":"ghost_giggles.zip","color":"gold","underlined":true},{"text":" uninstalled successfully. You may now remove it from your data pack folder.","color":"yellow"}]