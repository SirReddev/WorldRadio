# WorldRadio - Custom Seek Offset (Macro)
$scoreboard players set #seek_sec worldradio.data $(seconds)
scoreboard players operation #seek_ticks worldradio.data = #seek_sec worldradio.data
scoreboard players set #twenty worldradio.data 20
scoreboard players operation #seek_ticks worldradio.data *= #twenty worldradio.data
function worldradio:radio/songs/seek_song
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Seek applied: ","color":"gray"},{"score":{"name":"#seek_sec","objective":"worldradio.data"},"color":"gold","bold":true},{"text":" seconds.","color":"gray"}]
