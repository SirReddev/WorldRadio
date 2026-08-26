# WorldRadio - Jukebox Next Button Action (Local Zone)

# 1. Busy check: Ignore if a sequence is currently transitioning
execute if entity @s[tag=worldradio.busy] run return 0

# 2. If actively playing, sync direction and run next sequence on this and nearby jukeboxes
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=0.01..$(radius)] if score @s worldradio.jb_state matches 1 run function worldradio:jukebox/sequences/start_next_sequence
execute if score @s worldradio.jb_state matches 1 run function worldradio:jukebox/sequences/start_next_sequence

# 3. If stopped, advance song and start play sequence
execute if score @s worldradio.jb_state matches 0 run scoreboard players add @s worldradio.jb_song 1
execute if score @s worldradio.jb_state matches 0 if score @s worldradio.jb_song > #total_songs worldradio.data run scoreboard players set @s worldradio.jb_song 1
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=0.01..$(radius)] run scoreboard players operation @s worldradio.jb_song = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..0.1,limit=1] worldradio.jb_song
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=0.01..$(radius)] if score @s worldradio.jb_state matches 0 run function worldradio:jukebox/sequences/start_play_sequence
execute if score @s worldradio.jb_state matches 0 run function worldradio:jukebox/sequences/start_play_sequence
