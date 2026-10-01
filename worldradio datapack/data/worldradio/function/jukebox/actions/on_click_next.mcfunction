# WorldRadio - Jukebox Next Button Action (Local Zone)

# 1. Busy check: Ignore if a sequence is currently transitioning
execute if entity @s[tag=worldradio.busy] run return 0

# 2. State check: Can only press Next if it is currently PLAYING
execute unless score @s worldradio.jb_state matches 1 run return 0

# 3. If actively playing, sync direction and run next sequence on this and nearby jukeboxes
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=0.01..$(radius)] if score @s worldradio.jb_state matches 1 run function worldradio:jukebox/sequences/start_next_sequence
execute if score @s worldradio.jb_state matches 1 run function worldradio:jukebox/sequences/start_next_sequence
