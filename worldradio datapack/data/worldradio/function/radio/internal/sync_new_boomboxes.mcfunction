# WorldRadio - Synchronize Newly Summoned Boomboxes

# Refresh zones first so newly placed boomboxes get properly categorized
function worldradio:jukebox/zones/refresh_zones

# If outside zone and Global Radio is playing: start animation, sync song clock, tag with song, update display
execute if score #state worldradio.data matches 1 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone,tag=!worldradio.initialized] run function aj:worldradio_boombox/animations/playing/play
execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/seek_song
execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/resume_song
execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/update_display

# If paused: update display and copy position
execute if score #state worldradio.data matches 2 run function worldradio:radio/songs/seek_song
execute if score #state worldradio.data matches 2 run function worldradio:radio/songs/update_display

# If stopped and outside: clear display
execute if score #state worldradio.data matches 0 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run function worldradio:radio/internal/clear_display

# Mark newly detected boomboxes as initialized
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized] add worldradio.initialized
