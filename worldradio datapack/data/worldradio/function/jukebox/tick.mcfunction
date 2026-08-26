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

# 5. Clean up orphaned interaction entities if their jukebox root is gone
execute as @e[type=minecraft:interaction,tag=aj.worldradio_jukebox.interaction] at @s unless entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..2] run kill @s
