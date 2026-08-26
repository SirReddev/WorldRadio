# WorldRadio - Summon Jukebox (Macro)

# Case 1: If player is near an active playing Jukebox (within radius), summon directly with playing animation
$execute at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},distance=..$(radius)] rotated ~ 0 run function aj:worldradio_jukebox/summon {args: {animation: "playing", start_animation: true}}

# Case 2: If player is NOT near any active playing Jukebox, summon standard idle model
$execute at @s unless entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},distance=..$(radius)] rotated ~ 0 run function aj:worldradio_jukebox/summon {args: {}}

# Tag newly placed root entity
execute at @s as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,distance=..2,limit=1,sort=nearest] run tag @s add worldradio.just_summoned

# Initialize interaction buttons & default scores
function worldradio:jukebox/init_entities

# Ensure newly summoned jukebox joins playing mesh if within radius of a playing jukebox
$execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,tag=worldradio.just_summoned] at @s if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root,scores={worldradio.jb_state=1},distance=0.01..$(radius)] run function worldradio:jukebox/local/join_playing_mesh

# Clear marker tag
tag @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] remove worldradio.just_summoned
