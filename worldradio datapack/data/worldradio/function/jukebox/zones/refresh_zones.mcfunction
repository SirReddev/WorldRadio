# WorldRadio - Refresh Boombox Local Zone Assignments
execute unless score #jukebox_radius worldradio.data matches 1.. run scoreboard players set #jukebox_radius worldradio.data 20
execute store result storage worldradio:settings radius int 1 run scoreboard players get #jukebox_radius worldradio.data
function worldradio:jukebox/zones/refresh_zones_macro with storage worldradio:settings
