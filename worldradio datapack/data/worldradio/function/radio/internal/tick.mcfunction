# WorldRadio - Main Radio Internal Tick

# 1. Automatically stop global radio if no boomboxes exist in the world
execute if score #state worldradio.data matches 1..2 unless entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,limit=1] run function worldradio:radio/internal/stop_playback

# 2. Detect and sync any uninitialized boombox entities
execute if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.initialized,limit=1] run function worldradio:radio/internal/sync_new_boomboxes

# 3. Tick currently playing song
execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/tick_song

# 4. If the song finished during tick, advance to next or shuffle song
execute if score #state worldradio.data matches 1 if score #radio_has_song worldradio.data matches 0 run function worldradio:radio/internal/on_song_finish
