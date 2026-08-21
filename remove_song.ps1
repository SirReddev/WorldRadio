<#
.SYNOPSIS
    WorldRadio - Remove Song Script
.DESCRIPTION
    Removes a song from the WorldRadio playlist system and rebuilds all registry and dispatchers.
.EXAMPLE
    .\remove_song.ps1 steam_gardens
#>

param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$SongFolder
)

$baseDir = $PSScriptRoot
$songsDir = "$baseDir\data\worldradio\function\songs"
$radioSongsDir = "$baseDir\data\worldradio\function\radio\songs"
$connectorDir = "$radioSongsDir\$SongFolder"

# 1. Remove connector and song folders
if (Test-Path $connectorDir) {
    Remove-Item -Path $connectorDir -Recurse -Force
    Write-Host "Removed connector folder: $connectorDir" -ForegroundColor Yellow
}

$songDir = "$songsDir\$SongFolder"
if (Test-Path $songDir) {
    Remove-Item -Path $songDir -Recurse -Force
    Write-Host "Removed song files: $songDir" -ForegroundColor Yellow
}

# 2. Rebuild registry and dispatchers for all remaining songs
$registeredSongs = Get-ChildItem -Path $radioSongsDir -Directory | Where-Object { $_.Name -ne "TEMPLATE" } | Sort-Object Name
$total = $registeredSongs.Count

# Rebuild Registry
$registryLines = @(
    "# WorldRadio - Song Registry",
    "scoreboard players set #total_songs worldradio.data $total",
    ""
)
foreach ($s in $registeredSongs) {
    $registryLines += "function worldradio:songs/$($s.Name)/load"
}
$registryLines -join "`n" | Set-Content -Path "$radioSongsDir\registry.mcfunction" -NoNewline

# Helper to build dispatcher
function Build-Dispatcher ($name, $funcName) {
    $lines = @("# WorldRadio - $name Dispatcher")
    $id = 1
    foreach ($s in $registeredSongs) {
        $lines += "execute if score #song worldradio.data matches $id run function worldradio:radio/songs/$($s.Name)/$funcName"
        $id++
    }
    $lines -join "`n" | Set-Content -Path "$radioSongsDir\$name.mcfunction" -NoNewline
}

Build-Dispatcher "play_song" "play"
Build-Dispatcher "resume_song" "resume"
Build-Dispatcher "pause_song" "pause"
Build-Dispatcher "stop_song" "stop"
Build-Dispatcher "tick_song" "tick"
Build-Dispatcher "seek_song" "seek"
Build-Dispatcher "update_display" "update_display"

# Announce song
$announceLines = @("# WorldRadio - Announce Song")
$id = 1
foreach ($s in $registeredSongs) {
    $title = $s.Name
    $dispPath = "$radioSongsDir\$($s.Name)\update_display.mcfunction"
    if (Test-Path $dispPath) {
        $dispContent = Get-Content $dispPath -Raw
        if ($dispContent -match '\{text:"([^"]+)",color:"dark_green"\}') {
            $title = $matches[1]
        }
    }
    $announceLines += "execute if score #song worldradio.data matches $id run title @a actionbar [{`"text`":`"Now Playing: `" ,`"color`":`"green`"},{`"text`":`"$title`",`"color`":`"dark_green`",`"bold`":true}]"
    $announceLines += "execute if score #song worldradio.data matches $id run tellraw @a [{`"text`":`"[WorldRadio] `",`"color`":`"green`",`"bold`":true},{`"text`":`"Now Playing: `",`"color`":`"gray`"},{`"text`":`"$title`",`"color`":`"dark_green`",`"bold`":true}]"
    $id++
}
$announceLines -join "`n" | Set-Content -Path "$radioSongsDir\announce_song.mcfunction" -NoNewline

Write-Host "==========================================" -ForegroundColor Green
Write-Host " Successfully removed '$SongFolder' from playlist!" -ForegroundColor Green
Write-Host " Total remaining songs in WorldRadio: $total" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
