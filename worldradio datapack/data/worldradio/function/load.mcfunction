# WorldRadio - Main Load Function
scoreboard objectives add worldradio.data dummy

# Register and load all songs
function worldradio:radio/songs/registry

# Initialize default radio state if not set
execute unless score #state worldradio.data matches 0..2 run scoreboard players set #state worldradio.data 0
execute unless score #song worldradio.data matches 1.. run scoreboard players set #song worldradio.data 1
execute unless score #shuffle worldradio.data matches 0..1 run scoreboard players set #shuffle worldradio.data 0
execute unless score #announce_mode worldradio.data matches 0..3 run scoreboard players set #announce_mode worldradio.data 0

# Set initial text on any existing boomboxes
execute if score #state worldradio.data matches 1..2 run function worldradio:radio/songs/update_display
execute if score #state worldradio.data matches 0 run function worldradio:radio/internal/clear_display

tellraw @a[tag=worldradio.admin] [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Datapack loaded successfully. Type ","color":"gray"},{"text":"/function worldradio:radio/help","color":"aqua","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function worldradio:radio/help"}},{"text":" for controls.","color":"gray"}]
