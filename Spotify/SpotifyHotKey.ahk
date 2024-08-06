#Persistent
#NoEnv
SendMode Input
SetTitleMatchMode, 2

; Atalho para aumentar o volume
^Up::
    Send ^{Volume_Up}
    return

; Atalho para diminuir o volume
^Down::
    Send ^{Volume_Down}
    return

; Atalho para pausar/retomar a reprodução
^Space::
    Send ^{Media_Play_Pause}
    return
