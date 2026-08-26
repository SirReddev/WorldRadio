# WorldRadio - Jukebox Play Button Action (Local Zone)

# 1. Busy check: Ignore if a sequence is currently transitioning
execute if entity @s[tag=worldradio.busy] run return 0

# 2. State check: Can only press play if it is STOPPED
execute unless score @s worldradio.jb_state matches 0 run return 0

# 3. Sync nearby Jukeboxes within radius to the same song and trigger play sequence
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=0.01..$(radius)] run scoreboard players operation @s worldradio.jb_song = @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..0.1,limit=1] worldradio.jb_song
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=0.01..$(radius)] if score @s worldradio.jb_state matches 0 run function worldradio:jukebox/sequences/start_play_sequence

# 4. Trigger play animation on this jukebox and start playback on its local zone
function worldradio:jukebox/sequences/start_play_sequence
