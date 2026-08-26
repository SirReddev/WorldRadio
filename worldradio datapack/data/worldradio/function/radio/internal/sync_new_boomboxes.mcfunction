# WorldRadio - Synchronize Newly Summoned Boomboxes
execute unless score #jukebox_radius worldradio.data matches 1.. run scoreboard players set #jukebox_radius worldradio.data 20
execute store result storage worldradio:settings radius int 1 run scoreboard players get #jukebox_radius worldradio.data
function worldradio:radio/internal/init_new_boombox with storage worldradio:settings
