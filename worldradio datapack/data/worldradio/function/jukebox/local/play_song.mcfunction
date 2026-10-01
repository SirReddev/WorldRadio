# WorldRadio - Start Song Playback for Local Jukebox Zone (Macro)
execute if score @s worldradio.jb_song matches 1 run tag @s add nbs_batcave
execute if score @s worldradio.jb_song matches 1 run scoreboard players set @s nbs_batcave 0
execute if score @s worldradio.jb_song matches 1 run scoreboard players set @s nbs_batcave_t -1
$execute if score @s worldradio.jb_song matches 1 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s add nbs_batcave
$execute if score @s worldradio.jb_song matches 1 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_batcave 0
$execute if score @s worldradio.jb_song matches 1 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_batcave_t -1
$execute if score @s worldradio.jb_song matches 1 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute if score @s worldradio.jb_song matches 1 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Bat Cave",color:"dark_green"}]}
execute if score @s worldradio.jb_song matches 2 run tag @s add nbs_Celebrawl
execute if score @s worldradio.jb_song matches 2 run scoreboard players set @s nbs_Celebrawl 0
execute if score @s worldradio.jb_song matches 2 run scoreboard players set @s nbs_Celebrawl_t -1
$execute if score @s worldradio.jb_song matches 2 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s add nbs_Celebrawl
$execute if score @s worldradio.jb_song matches 2 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_Celebrawl 0
$execute if score @s worldradio.jb_song matches 2 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_Celebrawl_t -1
$execute if score @s worldradio.jb_song matches 2 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute if score @s worldradio.jb_song matches 2 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Celebrawl",color:"dark_green"}]}
execute if score @s worldradio.jb_song matches 3 run tag @s add nbs_creakingtr
execute if score @s worldradio.jb_song matches 3 run scoreboard players set @s nbs_creakingtr 0
execute if score @s worldradio.jb_song matches 3 run scoreboard players set @s nbs_creakingtr_t -1
$execute if score @s worldradio.jb_song matches 3 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s add nbs_creakingtr
$execute if score @s worldradio.jb_song matches 3 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_creakingtr 0
$execute if score @s worldradio.jb_song matches 3 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_creakingtr_t -1
$execute if score @s worldradio.jb_song matches 3 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute if score @s worldradio.jb_song matches 3 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Creaking Tree",color:"dark_green"}]}
execute if score @s worldradio.jb_song matches 4 run tag @s add nbs_ghostgiggl
execute if score @s worldradio.jb_song matches 4 run scoreboard players set @s nbs_ghostgiggl 0
execute if score @s worldradio.jb_song matches 4 run scoreboard players set @s nbs_ghostgiggl_t -1
$execute if score @s worldradio.jb_song matches 4 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s add nbs_ghostgiggl
$execute if score @s worldradio.jb_song matches 4 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_ghostgiggl 0
$execute if score @s worldradio.jb_song matches 4 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_ghostgiggl_t -1
$execute if score @s worldradio.jb_song matches 4 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute if score @s worldradio.jb_song matches 4 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Ghost Giggles",color:"dark_green"}]}
execute if score @s worldradio.jb_song matches 5 run tag @s add nbs_gourddance
execute if score @s worldradio.jb_song matches 5 run scoreboard players set @s nbs_gourddance 0
execute if score @s worldradio.jb_song matches 5 run scoreboard players set @s nbs_gourddance_t -1
$execute if score @s worldradio.jb_song matches 5 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s add nbs_gourddance
$execute if score @s worldradio.jb_song matches 5 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_gourddance 0
$execute if score @s worldradio.jb_song matches 5 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_gourddance_t -1
$execute if score @s worldradio.jb_song matches 5 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute if score @s worldradio.jb_song matches 5 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Gourd Dance",color:"dark_green"}]}
execute if score @s worldradio.jb_song matches 6 run tag @s add nbs_midnightmy
execute if score @s worldradio.jb_song matches 6 run scoreboard players set @s nbs_midnightmy 0
execute if score @s worldradio.jb_song matches 6 run scoreboard players set @s nbs_midnightmy_t -1
$execute if score @s worldradio.jb_song matches 6 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s add nbs_midnightmy
$execute if score @s worldradio.jb_song matches 6 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_midnightmy 0
$execute if score @s worldradio.jb_song matches 6 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_midnightmy_t -1
$execute if score @s worldradio.jb_song matches 6 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute if score @s worldradio.jb_song matches 6 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Midnight Mystery",color:"dark_green"}]}
execute if score @s worldradio.jb_song matches 7 run tag @s add nbs_nightfade
execute if score @s worldradio.jb_song matches 7 run scoreboard players set @s nbs_nightfade 0
execute if score @s worldradio.jb_song matches 7 run scoreboard players set @s nbs_nightfade_t -1
$execute if score @s worldradio.jb_song matches 7 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s add nbs_nightfade
$execute if score @s worldradio.jb_song matches 7 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_nightfade 0
$execute if score @s worldradio.jb_song matches 7 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_nightfade_t -1
$execute if score @s worldradio.jb_song matches 7 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute if score @s worldradio.jb_song matches 7 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Night Fade",color:"dark_green"}]}
execute if score @s worldradio.jb_song matches 8 run tag @s add nbs_wraithsere
execute if score @s worldradio.jb_song matches 8 run scoreboard players set @s nbs_wraithsere 0
execute if score @s worldradio.jb_song matches 8 run scoreboard players set @s nbs_wraithsere_t -1
$execute if score @s worldradio.jb_song matches 8 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s add nbs_wraithsere
$execute if score @s worldradio.jb_song matches 8 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_wraithsere 0
$execute if score @s worldradio.jb_song matches 8 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_wraithsere_t -1
$execute if score @s worldradio.jb_song matches 8 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute if score @s worldradio.jb_song matches 8 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Wraith Serenade",color:"dark_green"}]}
