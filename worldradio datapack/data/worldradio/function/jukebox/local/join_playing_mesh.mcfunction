# WorldRadio - Join Active Playing Jukebox Mesh
# 1. Copy active song index from nearest playing jukebox
execute at @s run scoreboard players operation @s worldradio.jb_song = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] worldradio.jb_song
execute if score @s worldradio.jb_song matches 1 at @s run scoreboard players operation @s nbs_batcave = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_batcave
execute if score @s worldradio.jb_song matches 1 at @s run scoreboard players operation @s nbs_batcave_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_batcave_t
execute if score @s worldradio.jb_song matches 1 run tag @s add nbs_batcave
execute if score @s worldradio.jb_song matches 1 run function aj:worldradio_jukebox/animations/playing/play
execute if score @s worldradio.jb_song matches 2 at @s run scoreboard players operation @s nbs_Celebrawl = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_Celebrawl
execute if score @s worldradio.jb_song matches 2 at @s run scoreboard players operation @s nbs_Celebrawl_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_Celebrawl_t
execute if score @s worldradio.jb_song matches 2 run tag @s add nbs_Celebrawl
execute if score @s worldradio.jb_song matches 2 run function aj:worldradio_jukebox/animations/playing/play
execute if score @s worldradio.jb_song matches 3 at @s run scoreboard players operation @s nbs_creakingtr = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_creakingtr
execute if score @s worldradio.jb_song matches 3 at @s run scoreboard players operation @s nbs_creakingtr_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_creakingtr_t
execute if score @s worldradio.jb_song matches 3 run tag @s add nbs_creakingtr
execute if score @s worldradio.jb_song matches 3 run function aj:worldradio_jukebox/animations/playing/play
execute if score @s worldradio.jb_song matches 4 at @s run scoreboard players operation @s nbs_ghostgiggl = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_ghostgiggl
execute if score @s worldradio.jb_song matches 4 at @s run scoreboard players operation @s nbs_ghostgiggl_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_ghostgiggl_t
execute if score @s worldradio.jb_song matches 4 run tag @s add nbs_ghostgiggl
execute if score @s worldradio.jb_song matches 4 run function aj:worldradio_jukebox/animations/playing/play
execute if score @s worldradio.jb_song matches 5 at @s run scoreboard players operation @s nbs_gourddance = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_gourddance
execute if score @s worldradio.jb_song matches 5 at @s run scoreboard players operation @s nbs_gourddance_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_gourddance_t
execute if score @s worldradio.jb_song matches 5 run tag @s add nbs_gourddance
execute if score @s worldradio.jb_song matches 5 run function aj:worldradio_jukebox/animations/playing/play
execute if score @s worldradio.jb_song matches 6 at @s run scoreboard players operation @s nbs_midnightmy = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_midnightmy
execute if score @s worldradio.jb_song matches 6 at @s run scoreboard players operation @s nbs_midnightmy_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_midnightmy_t
execute if score @s worldradio.jb_song matches 6 run tag @s add nbs_midnightmy
execute if score @s worldradio.jb_song matches 6 run function aj:worldradio_jukebox/animations/playing/play
execute if score @s worldradio.jb_song matches 7 at @s run scoreboard players operation @s nbs_nightfade = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_nightfade
execute if score @s worldradio.jb_song matches 7 at @s run scoreboard players operation @s nbs_nightfade_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_nightfade_t
execute if score @s worldradio.jb_song matches 7 run tag @s add nbs_nightfade
execute if score @s worldradio.jb_song matches 7 run function aj:worldradio_jukebox/animations/playing/play
execute if score @s worldradio.jb_song matches 8 at @s run scoreboard players operation @s nbs_wraithsere = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_wraithsere
execute if score @s worldradio.jb_song matches 8 at @s run scoreboard players operation @s nbs_wraithsere_t = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] nbs_wraithsere_t
execute if score @s worldradio.jb_song matches 8 run tag @s add nbs_wraithsere
execute if score @s worldradio.jb_song matches 8 run function aj:worldradio_jukebox/animations/playing/play
execute at @s run scoreboard players operation @s aj.playing.frame = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1,sort=nearest] aj.playing.frame
execute store result storage animated_java:temp args.frame int 1 run scoreboard players get @s aj.playing.frame
execute at @s run function aj:worldradio_jukebox/animations/playing/set_frame with storage animated_java:temp args
scoreboard players set @s worldradio.jb_state 1
