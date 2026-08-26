# WorldRadio - Refresh Boombox Local Zone Assignments (Macro)

# 1. Mark previous zone state
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone] add worldradio.was_in_zone
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] add worldradio.was_outside

# 2. Recalculate local zone tags based on radius — only around PLAYING jukeboxes
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove worldradio.local_zone
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1}] at @s run tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..$(radius)] add worldradio.local_zone

# 3. Identify transition changes
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,tag=worldradio.was_outside] add worldradio.new_in_zone
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone,tag=worldradio.was_in_zone] add worldradio.new_outside

# 4. Clean old song tags on transitioning boomboxes
tag @e[type=minecraft:item_display,tag=worldradio.new_in_zone] remove nbs_steamgarde
tag @e[type=minecraft:item_display,tag=worldradio.new_in_zone] remove nbs_Celebrawl
scoreboard players reset @e[type=minecraft:item_display,tag=worldradio.new_in_zone] nbs_steamgarde
scoreboard players reset @e[type=minecraft:item_display,tag=worldradio.new_in_zone] nbs_steamgarde_t
scoreboard players reset @e[type=minecraft:item_display,tag=worldradio.new_in_zone] nbs_Celebrawl
scoreboard players reset @e[type=minecraft:item_display,tag=worldradio.new_in_zone] nbs_Celebrawl_t

tag @e[type=minecraft:item_display,tag=worldradio.new_outside] remove nbs_steamgarde
tag @e[type=minecraft:item_display,tag=worldradio.new_outside] remove nbs_Celebrawl
scoreboard players reset @e[type=minecraft:item_display,tag=worldradio.new_outside] nbs_steamgarde
scoreboard players reset @e[type=minecraft:item_display,tag=worldradio.new_outside] nbs_steamgarde_t
scoreboard players reset @e[type=minecraft:item_display,tag=worldradio.new_outside] nbs_Celebrawl
scoreboard players reset @e[type=minecraft:item_display,tag=worldradio.new_outside] nbs_Celebrawl_t

# 5. Sync newly entered boomboxes to the jukebox's local song
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1}] run function worldradio:jukebox/local/sync_boombox with storage worldradio:settings

# 6. Any stopped/new jukebox near an active playing jukebox joins the mesh immediately
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=0}] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},distance=0.01..$(radius)] run function worldradio:jukebox/local/join_playing_mesh

# 7. Sync newly exited boomboxes back to Global Radio
execute if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.new_outside,limit=1] run function worldradio:radio/internal/sync_outside_boombox

# 8. Cleanup transition tags
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove worldradio.was_in_zone
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove worldradio.was_outside
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove worldradio.new_in_zone
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove worldradio.new_outside
