# WorldRadio - Complete System Reset
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

# 1. Stop all Global playback, remove song tags, stop boombox animations, clear displays
scoreboard players set #state worldradio.data 0
function worldradio:radio/songs/stop_song
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] run function aj:worldradio_boombox/animations/playing/stop
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] run function aj:worldradio_boombox/animations/pause_all
function worldradio:radio/internal/clear_display

# 2. Stop all Jukebox local playback, animations, and reset jukebox states
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] run function aj:worldradio_jukebox/animations/playing/stop
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] run function aj:worldradio_jukebox/animations/pause_all
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] run scoreboard players set @s worldradio.jb_state 0
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] run scoreboard players set @s worldradio.jb_timer 0
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] run scoreboard players set @s worldradio.jb_phase 0
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] run scoreboard players set @s worldradio.jb_song 1

# Strip all state & song tags from jukeboxes & boomboxes
tag @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] remove worldradio.state_play
tag @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] remove worldradio.state_start
tag @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] remove worldradio.state_switch
tag @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] remove worldradio.state_stop
tag @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] remove worldradio.busy

tag @e[type=minecraft:item_display] remove nbs_steamgarde
tag @e[type=minecraft:item_display] remove nbs_Celebrawl
scoreboard players reset @e[type=minecraft:item_display] nbs_steamgarde
scoreboard players reset @e[type=minecraft:item_display] nbs_steamgarde_t
scoreboard players reset @e[type=minecraft:item_display] nbs_Celebrawl
scoreboard players reset @e[type=minecraft:item_display] nbs_Celebrawl_t

# 3. Reset all config scores to defaults
scoreboard players set #song worldradio.data 1
scoreboard players set #shuffle worldradio.data 0
scoreboard players set #jukebox_shuffle worldradio.data 0
scoreboard players set #announce_mode worldradio.data 0
scoreboard players set #jukebox_radius worldradio.data 20

# 4. Refresh zones with default radius
function worldradio:jukebox/zones/refresh_zones

# 5. Announce reset
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"All playback, devices, animations, and settings have been ","color":"gray"},{"text":"RESET TO DEFAULTS","color":"gold","bold":true},{"text":".","color":"gray"}]
