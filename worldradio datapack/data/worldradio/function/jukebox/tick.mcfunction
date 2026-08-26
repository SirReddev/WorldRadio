# WorldRadio - Jukebox Central Tick Loop

# 1. Initialize newly spawned jukebox entities & interaction button tags (only if uninitialized exist)
execute if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=!worldradio.jb_init,limit=1] run function worldradio:jukebox/init_entities
execute if entity @e[type=minecraft:interaction,tag=aj.worldradio_jukebox.interaction,tag=!worldradio.btn_tagged,limit=1] run function worldradio:jukebox/init_entities

# 2. Process player right-click interactions
execute as @e[type=minecraft:interaction,tag=aj.worldradio_jukebox.interaction] if data entity @s interaction run function worldradio:jukebox/interact

# 3. Advance active animation transition sequences (only when a jukebox is transitioning)
execute if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=worldradio.busy,limit=1] as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=worldradio.busy] run function worldradio:jukebox/sequences/tick_sequences

# 4. Handle Local Zone song playback (only when at least one jukebox is playing)
execute if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1] run function worldradio:jukebox/local/tick_song

# 5. Detect Jukebox entity count change (killed/broken/deleted OR new one placed) -> refresh zones
execute store result score #current_jukeboxes worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root]
execute unless score #current_jukeboxes worldradio.data = #last_jukeboxes worldradio.data run function worldradio:jukebox/zones/refresh_zones
scoreboard players operation #last_jukeboxes worldradio.data = #current_jukeboxes worldradio.data

# 6. Detect playing jukebox count change (jukebox started or stopped playing) -> refresh zones
execute store result score #current_playing_jb worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1}]
execute unless score #current_playing_jb worldradio.data = #last_playing_jb worldradio.data run function worldradio:jukebox/zones/refresh_zones
scoreboard players operation #last_playing_jb worldradio.data = #current_playing_jb worldradio.data

# 7. Safety: if any boombox is still tagged local_zone but no jukeboxes are playing, force refresh
execute if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,limit=1] unless entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},limit=1] run function worldradio:jukebox/zones/refresh_zones

# 8. Clean up orphaned interaction entities if their jukebox root is gone
execute as @e[type=minecraft:interaction,tag=aj.worldradio_jukebox.interaction] at @s unless entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..2] run kill @s
