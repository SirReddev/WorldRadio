# WorldRadio - Handle Player Interaction Right-Clicks on Jukebox Buttons

# Dispatch based on which button interaction was clicked
execute if entity @s[tag=worldradio.btn_next] at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..3,limit=1,sort=nearest] run function worldradio:jukebox/actions/on_click_next with storage worldradio:settings
execute if entity @s[tag=worldradio.btn_prev] at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..3,limit=1,sort=nearest] run function worldradio:jukebox/actions/on_click_prev with storage worldradio:settings
execute if entity @s[tag=worldradio.btn_play] at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..3,limit=1,sort=nearest] run function worldradio:jukebox/actions/on_click_play with storage worldradio:settings
execute if entity @s[tag=worldradio.btn_stop] at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..3,limit=1,sort=nearest] run function worldradio:jukebox/actions/on_click_stop with storage worldradio:settings

# Clear interaction record so it can be clicked again
data remove entity @s interaction
