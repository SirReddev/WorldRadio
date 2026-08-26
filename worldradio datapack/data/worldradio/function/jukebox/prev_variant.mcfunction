# WorldRadio - Switch Jukebox to Previous Texture Variant (Cycles 5 -> 4 -> 3 -> 2 -> 1 -> 5)
scoreboard players remove @s worldradio.jb_variant 1
execute if score @s worldradio.jb_variant matches ..0 run scoreboard players set @s worldradio.jb_variant 5

execute if score @s worldradio.jb_variant matches 1 run function aj:worldradio_jukebox/variants/default/apply
execute if score @s worldradio.jb_variant matches 2 run function aj:worldradio_jukebox/variants/new_variant/apply
execute if score @s worldradio.jb_variant matches 3 run function aj:worldradio_jukebox/variants/new_variant1/apply
execute if score @s worldradio.jb_variant matches 4 run function aj:worldradio_jukebox/variants/new_variant2/apply
execute if score @s worldradio.jb_variant matches 5 run function aj:worldradio_jukebox/variants/new_variant3/apply
