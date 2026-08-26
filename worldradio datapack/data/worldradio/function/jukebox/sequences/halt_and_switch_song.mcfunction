# WorldRadio - Stop Previous Local Song and Advance Track Index (2s into Stopping Animation)
tag @s add worldradio.music_stopped
function worldradio:jukebox/local/stop_playback with storage worldradio:settings

execute if entity @s[tag=worldradio.direction_next] run scoreboard players add @s worldradio.jb_song 1
execute if entity @s[tag=worldradio.direction_next] if score @s worldradio.jb_song > #total_songs worldradio.data run scoreboard players set @s worldradio.jb_song 1
execute if entity @s[tag=worldradio.direction_prev] run scoreboard players remove @s worldradio.jb_song 1
execute if entity @s[tag=worldradio.direction_prev] if score @s worldradio.jb_song matches ..0 run scoreboard players operation @s worldradio.jb_song = #total_songs worldradio.data
