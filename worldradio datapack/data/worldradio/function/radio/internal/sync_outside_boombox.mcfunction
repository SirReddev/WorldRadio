# WorldRadio - Sync Newly Outside Boomboxes to Global Radio

# If Global Radio is currently Playing (#state matches 1):
execute if score #state worldradio.data matches 1 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.new_outside] run function aj:worldradio_boombox/animations/playing/play
execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/seek_song
execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/resume_song
execute if score #state worldradio.data matches 1 run function worldradio:radio/songs/update_display

# If Global Radio is currently Paused (#state matches 2):
execute if score #state worldradio.data matches 2 run function worldradio:radio/songs/seek_song
execute if score #state worldradio.data matches 2 run function worldradio:radio/songs/update_display
execute if score #state worldradio.data matches 2 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.new_outside] run function aj:worldradio_boombox/animations/playing/stop

# If Global Radio is currently Stopped (#state matches 0):
execute if score #state worldradio.data matches 0 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.new_outside] run function aj:worldradio_boombox/animations/playing/stop
execute if score #state worldradio.data matches 0 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.new_outside] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"",color:"dark_green"}]}
