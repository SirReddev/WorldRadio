# WorldRadio - Main Radio Internal Tick

# Detect and sync any uninitialized boombox entities
execute if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,limit=1] run function worldradio:radio/internal/sync_new_boomboxes

# Tick currently playing song
execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/tick_song

# If the song finished during tick, advance to next or shuffle song
execute if score #state worldradio.data matches 1 if score #radio_has_song worldradio.data matches 0 run function worldradio:radio/internal/on_song_finish
