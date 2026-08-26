# WorldRadio - Switch Jukebox Variant (Direction-Aware)
# If switching to previous track, step back in variants; otherwise step forward
execute if entity @s[tag=worldradio.direction_prev] run function worldradio:jukebox/prev_variant
execute unless entity @s[tag=worldradio.direction_prev] run function worldradio:jukebox/cycle_next_variant
