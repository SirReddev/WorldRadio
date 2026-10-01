# WorldRadio - Stop Local Playback on this Jukebox and its Zone Boomboxes (Macro)
scoreboard players set @s worldradio.jb_state 0
execute if score @s worldradio.jb_song matches 1 run tag @s remove nbs_batcave
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s remove nbs_batcave
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop
execute if score @s worldradio.jb_song matches 2 run tag @s remove nbs_Celebrawl
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s remove nbs_Celebrawl
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop
execute if score @s worldradio.jb_song matches 3 run tag @s remove nbs_creakingtr
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s remove nbs_creakingtr
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop
execute if score @s worldradio.jb_song matches 4 run tag @s remove nbs_ghostgiggl
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s remove nbs_ghostgiggl
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop
execute if score @s worldradio.jb_song matches 5 run tag @s remove nbs_gourddance
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s remove nbs_gourddance
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop
execute if score @s worldradio.jb_song matches 6 run tag @s remove nbs_midnightmy
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s remove nbs_midnightmy
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop
execute if score @s worldradio.jb_song matches 7 run tag @s remove nbs_nightfade
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s remove nbs_nightfade
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop
execute if score @s worldradio.jb_song matches 8 run tag @s remove nbs_wraithsere
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s remove nbs_wraithsere
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/pause_all
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"......",bold:true,color:"white"}
