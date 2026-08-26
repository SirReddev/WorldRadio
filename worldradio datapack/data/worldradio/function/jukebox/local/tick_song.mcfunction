# WorldRadio - Tick Local Jukebox Song Playback

# Song 1 - Steam Gardens
# 1. Tick Jukebox entities
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},tag=nbs_steamgarde] run scoreboard players operation @s nbs_steamgarde += speed nbs_steamgarde
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=1},tag=nbs_steamgarde] at @s run function worldradio:songs/steam_gardens/tree/0_8191

# 2. Tick Local Zone Boombox entities (once per game tick)
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_steamgarde] run scoreboard players operation @s nbs_steamgarde += speed nbs_steamgarde
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_steamgarde] at @s run function worldradio:songs/steam_gardens/tree/0_8191


# Song 2 - Celebrawl
# 1. Tick Jukebox entities
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},tag=nbs_Celebrawl] run scoreboard players operation @s nbs_Celebrawl += speed nbs_Celebrawl
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1,worldradio.jb_song=2},tag=nbs_Celebrawl] at @s run function worldradio:songs/celebrawl/tree/0_2047

# 2. Tick Local Zone Boombox entities (once per game tick)
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_Celebrawl] run scoreboard players operation @s nbs_Celebrawl += speed nbs_Celebrawl
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=nbs_Celebrawl] at @s run function worldradio:songs/celebrawl/tree/0_2047
