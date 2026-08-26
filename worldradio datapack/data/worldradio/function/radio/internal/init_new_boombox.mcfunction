# WorldRadio - Initialize and Bind New Boombox Entity (Macro)

# 1. Permanently bind to local_zone if placed within radius of ANY Jukebox
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..$(radius)] run tag @s add worldradio.local_zone

# 2. If placed in a local Jukebox zone:
# 2a. If Jukebox is playing Song 1 (Steam Gardens):
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},distance=..$(radius)] run scoreboard players operation @s nbs_steamgarde = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},distance=..$(radius),limit=1,sort=nearest] nbs_steamgarde
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},distance=..$(radius)] run scoreboard players operation @s nbs_steamgarde_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},distance=..$(radius),limit=1,sort=nearest] nbs_steamgarde_t
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},distance=..$(radius)] run tag @s add nbs_steamgarde
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Steam Gardens",color:"dark_green"}]}

# 2b. If Jukebox is playing Song 2 (Celebrawl):
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},distance=..$(radius)] run scoreboard players operation @s nbs_Celebrawl = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},distance=..$(radius),limit=1,sort=nearest] nbs_Celebrawl
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},distance=..$(radius)] run scoreboard players operation @s nbs_Celebrawl_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},distance=..$(radius),limit=1,sort=nearest] nbs_Celebrawl_t
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},distance=..$(radius)] run tag @s add nbs_Celebrawl
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/play
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Celebrawl",color:"dark_green"}]}

# 2c. If Jukebox is stopped:
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=0},distance=..$(radius)] run function aj:worldradio_boombox/animations/playing/stop
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=0},distance=..$(radius)] run function aj:worldradio_boombox/animations/pause_all
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=worldradio.local_zone] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=0},distance=..$(radius)] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"......",bold:true,color:"white"}

# 3. If placed OUTSIDE local zones (Global Radio Boombox):
# 3a. If Global Radio is currently playing:
execute if score #state worldradio.data matches 1 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=!worldradio.local_zone] run function aj:worldradio_boombox/animations/playing/play

execute if score #state worldradio.data matches 1 if score #song worldradio.data matches 1 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_steamgarde = #radio nbs_steamgarde
execute if score #state worldradio.data matches 1 if score #song worldradio.data matches 1 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_steamgarde_t = #radio nbs_steamgarde_t
execute if score #state worldradio.data matches 1 if score #song worldradio.data matches 1 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=!worldradio.local_zone] run tag @s add nbs_steamgarde

execute if score #state worldradio.data matches 1 if score #song worldradio.data matches 2 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_Celebrawl = #radio nbs_Celebrawl
execute if score #state worldradio.data matches 1 if score #song worldradio.data matches 2 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_Celebrawl_t = #radio nbs_Celebrawl_t
execute if score #state worldradio.data matches 1 if score #song worldradio.data matches 2 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=!worldradio.local_zone] run tag @s add nbs_Celebrawl

execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/update_display

# 3b. If Global Radio is paused:
execute if score #state worldradio.data matches 2 run function worldradio:radio/songs/update_display

# 3c. If Global Radio is stopped:
execute if score #state worldradio.data matches 0 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=!worldradio.local_zone] run function aj:worldradio_boombox/animations/playing/stop
execute if score #state worldradio.data matches 0 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=!worldradio.local_zone] run function aj:worldradio_boombox/animations/pause_all
execute if score #state worldradio.data matches 0 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,tag=!worldradio.local_zone] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"......",bold:true,color:"white"}

# 4. Mark newly detected boomboxes as permanently initialized
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized] add worldradio.initialized
