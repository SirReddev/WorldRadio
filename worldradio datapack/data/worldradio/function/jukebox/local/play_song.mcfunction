# WorldRadio - Start Song Playback for Local Jukebox Zone (Macro)

# Song 1 - Steam Gardens
execute if score @s worldradio.jb_song matches 1 run tag @s add nbs_steamgarde
execute if score @s worldradio.jb_song matches 1 run scoreboard players set @s nbs_steamgarde 0
execute if score @s worldradio.jb_song matches 1 run scoreboard players set @s nbs_steamgarde_t -1

$execute if score @s worldradio.jb_song matches 1 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s add nbs_steamgarde
$execute if score @s worldradio.jb_song matches 1 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_steamgarde 0
$execute if score @s worldradio.jb_song matches 1 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_steamgarde_t -1
$execute if score @s worldradio.jb_song matches 1 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute if score @s worldradio.jb_song matches 1 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Steam Gardens",color:"dark_green"}]}

# Song 2 - Celebrawl
execute if score @s worldradio.jb_song matches 2 run tag @s add nbs_Celebrawl
execute if score @s worldradio.jb_song matches 2 run scoreboard players set @s nbs_Celebrawl 0
execute if score @s worldradio.jb_song matches 2 run scoreboard players set @s nbs_Celebrawl_t -1

$execute if score @s worldradio.jb_song matches 2 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run tag @s add nbs_Celebrawl
$execute if score @s worldradio.jb_song matches 2 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_Celebrawl 0
$execute if score @s worldradio.jb_song matches 2 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run scoreboard players set @s nbs_Celebrawl_t -1
$execute if score @s worldradio.jb_song matches 2 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute if score @s worldradio.jb_song matches 2 at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Celebrawl",color:"dark_green"}]}
