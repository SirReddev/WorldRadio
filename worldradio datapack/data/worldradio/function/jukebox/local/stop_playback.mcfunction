# WorldRadio - Stop Local Playback on this Jukebox and its Zone Boomboxes (Macro)
scoreboard players set @s worldradio.jb_state 0

# Song 1 - Steam Gardens
execute if score @s worldradio.jb_song matches 1 run tag @s remove nbs_steamgarde
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s remove nbs_steamgarde
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop

# Song 2 - Celebrawl
execute if score @s worldradio.jb_song matches 2 run tag @s remove nbs_Celebrawl
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s remove nbs_Celebrawl
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop

# Clear text display on zone boomboxes
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"",color:"dark_green"}]}
