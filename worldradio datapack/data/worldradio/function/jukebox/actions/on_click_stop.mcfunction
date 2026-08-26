# WorldRadio - Jukebox Stop Button Action (Local Zone)

# 1. Busy check: Ignore if already stopping or transitioning
execute if entity @s[tag=worldradio.busy] run return 0

# 2. State check: Can only press stop if it is currently PLAYING
execute unless score @s worldradio.jb_state matches 1 run return 0

# 3. Stop nearby Jukeboxes within radius
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=0.01..$(radius)] if score @s worldradio.jb_state matches 1 run function worldradio:jukebox/sequences/start_stop_sequence

# 4. Stop local jukebox sequence
function worldradio:jukebox/sequences/start_stop_sequence
