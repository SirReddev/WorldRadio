# WorldRadio - Synchronize Newly Summoned Boomboxes

# If currently playing: start animation, copy clock, tag with song, update display
execute if score #state worldradio.data matches 1 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized] run function aj:worldradio_boombox/animations/playing/play
execute if score #state worldradio.data matches 1 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized] run scoreboard players operation @s nbs_steamgarde = #radio nbs_steamgarde
execute if score #state worldradio.data matches 1 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized] run scoreboard players operation @s nbs_steamgarde_t = #radio nbs_steamgarde_t
execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/resume_song
execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/update_display

# If paused: update display and copy position
execute if score #state worldradio.data matches 2 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized] run scoreboard players operation @s nbs_steamgarde = #radio nbs_steamgarde
execute if score #state worldradio.data matches 2 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized] run scoreboard players operation @s nbs_steamgarde_t = #radio nbs_steamgarde_t
execute if score #state worldradio.data matches 2 run function worldradio:radio/songs/update_display

# If stopped: clear display
execute if score #state worldradio.data matches 0 run function worldradio:radio/internal/clear_display

# Mark newly detected boomboxes as initialized
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized] add worldradio.initialized
