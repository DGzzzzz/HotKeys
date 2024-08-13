# HotKeys
# Spotify Control Script with AutoHotkey

Este script permite controlar o volume, shuffle, repetição e navegação de faixas do Spotify usando atalhos de teclado com AutoHotkey e a biblioteca `Spotify.ahk`.

## Requisitos

- AutoHotkey v1.1
- Arquivo Spotify.ahk e pasta lib

## Instalação
1. Faça o download do repositório e extraia a pasta Spotify em um local da sua escolha.
Source: https://github.com/DGzzzzz/HotKeys.git

2. Na pasta exe, faça instalação do AutoHotKeys v1.1

3. Após instalação, iniciei o arquivo SpotifyHotKey.ahk com o programa AutoHotKeys

# Instalação sem utilizar meu repositório
1.0  Faça o download do programa AutoHotKeys no site oficial, precisa ser a versão 1.1.37.02

1.1  Baixe a biblioteca `Spotify.ahk` do repositório GitHub.

Source: https://github.com/CloakerSmoker/Spotify.ahk

2. O arquivo `Spotify.ahk` e a pasta lib precisam estar no mesmo diretório do seu script.

## Uso

Crie um arquivo de script AutoHotkey (.ahk) e adicione o seguinte código:

#requires AutoHotkey v1.1
#SingleInstance,Force

#Include %A_ScriptDir%\Spotify.ahk

; Inicializa a classe Spotify
spoofy := new Spotify
Increment := 5

; Obtém informações de reprodução
PlaybackInfo := spoofy.Player.GetCurrentPlaybackInfo()
VolumePercentage := PlaybackInfo.Device.Volume
ShuffleMode := PlaybackInfo.shuffle_state
RepeatMode := (PlaybackInfo.repeat_state = "context" ? 2 : PlaybackInfo.repeat_state = "track" ? 1 : 3) ; 1 "track", 2 "context" (album, playlist, etc.), qualquer outro valor "off"

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


# Explicação dos Componentes
### Inicialização:

spoofy := new Spotify

Cria uma nova instância da classe Spotify.

### Obtenção de Informações de Reprodução:

PlaybackInfo := spoofy.Player.GetCurrentPlaybackInfo()
VolumePercentage := PlaybackInfo.Device.Volume
ShuffleMode := PlaybackInfo.shuffle_state
RepeatMode := (PlaybackInfo.repeat_state = "context" ? 2 : PlaybackInfo.repeat_state = "track" ? 1 : 3)

Obtém informações sobre a reprodução atual, como volume, estado de shuffle e modo de repetição.

### Atalhos de Teclado:
Aumentar Volume:

^Up::
if(VolumePercentage + Increment <= 100)
  VolumePercentage := VolumePercentage + Increment
spoofy.Player.SetVolume(VolumePercentage)
return

Diminuir Volume:

^Down::
if(VolumePercentage - Increment >= 0)
  VolumePercentage := VolumePercentage - Increment
spoofy.Player.SetVolume(VolumePercentage)
return

## Créditos
Este script utiliza a biblioteca Spotify.ahk desenvolvida por CloakerSmoker. A documentação atualizada pode ser encontrada no link abaixo.
Documentation (updated): https://cloakersmoker.github.io/Spotify.ahk/rewrite/index.html
