/*
Hotkeys examples for Spotify class
Source: https://github.com/CloakerSmoker/Spotify.ahk
Documentation (updated): https://cloakersmoker.github.io/Spotify.ahk/rewrite/index.html

This example edited by: Jean Lalonde (https://github.com/JnLlnd) 2022-08-19
*/

#requires AutoHotkey v1.1
#SingleInstance,Force

#Include %A_ScriptDir%\Spotify.ahk

spoofy := new Spotify
Increment := 5

PlaybackInfo := spoofy.Player.GetCurrentPlaybackInfo()
VolumePercentage := PlaybackInfo.Device.Volume
ShuffleMode := PlaybackInfo.shuffle_state
RepeatMode := (PlaybackInfo.repeat_state = "context" ? 2 : PlaybackInfo.repeat_state = "track" ? 1 : 3) ; 1 "track", 2 "context" (album, playlist, etc.), any other value "off"

return

; Atalho para aumentar o volume do Spotify
^Up::
if(VolumePercentage + Increment <= 100)
  VolumePercentage := VolumePercentage + Increment
spoofy.Player.SetVolume(VolumePercentage) ; Incrementa a porcentagem de volume e define o player para a nova porcentagem de volume
return

; Atalho para diminuir o volume do Spotify
^Down::
if(VolumePercentage - Increment >= 0)
  VolumePercentage := VolumePercentage - Increment
spoofy.Player.SetVolume(VolumePercentage) ; Decrementa a porcentagem de volume e define o player para a nova porcentagem de volume
return

; Atalho para alternar o modo shuffle
F3::
ShuffleMode := !ShuffleMode
spoofy.Player.SetShuffle(ShuffleMode) ; Alterna o modo shuffle do player
return

; Atalho para a próxima faixa
F5::
spoofy.Player.NextTrack()
return

; Atalho para a faixa anterior
F6::
spoofy.Player.LastTrack()
return
