# WorldRadio - Remove Specific Jukebox Entity and Clean Local Boomboxes
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,distance=..250] run tag @s remove worldradio.local_zone
function aj:worldradio_jukebox/remove/this
