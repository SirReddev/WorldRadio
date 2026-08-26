# WorldRadio - Smart Jukebox Variant Switcher (Keyframe Command)
# Checks direction tag to determine whether to advance or step back in variants

execute if entity @s[tag=worldradio.direction_prev] run function worldradio:jukebox/prev_variant
execute unless entity @s[tag=worldradio.direction_prev] run function worldradio:jukebox/next_variant
