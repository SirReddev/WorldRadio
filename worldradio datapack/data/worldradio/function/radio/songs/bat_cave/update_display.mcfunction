# Song: Bat Cave - Update Boombox Display
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Bat Cave",color:"dark_green"}]}
