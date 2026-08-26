# WorldRadio - Join Active Playing Jukebox Mesh

# 1. Copy active song index from nearest playing jukebox
execute at @s run scoreboard players operation @s worldradio.jb_song = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] worldradio.jb_song

# 2. Song 1: Steam Gardens
execute if score @s worldradio.jb_song matches 1 at @s run scoreboard players operation @s nbs_steamgarde = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_steamgarde
execute if score @s worldradio.jb_song matches 1 at @s run scoreboard players operation @s nbs_steamgarde_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_steamgarde_t
execute if score @s worldradio.jb_song matches 1 run tag @s add nbs_steamgarde
execute if score @s worldradio.jb_song matches 1 run function aj:worldradio_jukebox/animations/playing/play

# 3. Song 2: Celebrawl
execute if score @s worldradio.jb_song matches 2 at @s run scoreboard players operation @s nbs_Celebrawl = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_Celebrawl
execute if score @s worldradio.jb_song matches 2 at @s run scoreboard players operation @s nbs_Celebrawl_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_Celebrawl_t
execute if score @s worldradio.jb_song matches 2 run tag @s add nbs_Celebrawl
execute if score @s worldradio.jb_song matches 2 run function aj:worldradio_jukebox/animations/playing/play

# 4. Set playing state
scoreboard players set @s worldradio.jb_state 1
