# WorldRadio - Play Custom Song by Name (Macro)
$tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Switching to song: ","color":"gray"},{"text":"$(song)","color":"gold","bold":true}]
$function worldradio:radio/play_track/$(song)
