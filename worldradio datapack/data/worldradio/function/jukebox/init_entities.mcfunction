# WorldRadio - Initialize Jukebox Entities and Interaction Button Tags

# Tag interaction entities with semantic button roles
execute as @e[type=minecraft:interaction,tag=aj.worldradio_jukebox.interaction.interaction,tag=!worldradio.btn_tagged] run tag @s add worldradio.btn_stop
execute as @e[type=minecraft:interaction,tag=aj.worldradio_jukebox.interaction.interaction2,tag=!worldradio.btn_tagged] run tag @s add worldradio.btn_play
execute as @e[type=minecraft:interaction,tag=aj.worldradio_jukebox.interaction.interaction3,tag=!worldradio.btn_tagged] run tag @s add worldradio.btn_next
execute as @e[type=minecraft:interaction,tag=aj.worldradio_jukebox.interaction.interaction4,tag=!worldradio.btn_tagged] run tag @s add worldradio.btn_prev

tag @e[type=minecraft:interaction,tag=aj.worldradio_jukebox.interaction,tag=!worldradio.btn_tagged] add worldradio.btn_tagged

# Initialize new Jukebox Root Entities
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=!worldradio.jb_init] run scoreboard players set @s worldradio.jb_state 0
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=!worldradio.jb_init] run scoreboard players set @s worldradio.jb_song 1
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=!worldradio.jb_init] run scoreboard players set @s worldradio.jb_timer 0
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=!worldradio.jb_init] run scoreboard players set @s worldradio.jb_phase 0
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=!worldradio.jb_init] run scoreboard players set @s worldradio.jb_variant 1
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=!worldradio.jb_init] run tag @s remove worldradio.busy
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=!worldradio.jb_init] run tag @s add worldradio.jb_init
