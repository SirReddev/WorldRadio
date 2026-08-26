# WorldRadio - Remove Zone Boomboxes (Macro)
$execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=worldradio.local_zone,distance=..$(radius)] at @s run function aj:worldradio_boombox/remove/this
tellraw @s [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Removed all local zone boomboxes within radius.","color":"gray"}]
