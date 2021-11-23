#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

GroupAdd, players, ahk_exe vlc.exe
GroupAdd, players, ahk_exe Spotify.exe
GroupAdd, players, YouTube

GroupAdd, code_editors, ahk_exe sublime_text.exe
GroupAdd, code_editors, notepad++.exe

SetTitleMatchMode, 2

; Notes
; TrayTip [, Title, Text, Seconds, Options] -> TrayTip, Title, text, , 17
; <+ = Left Shift
; ^ = Ctrl
; >! = Right Alt
; <^>! = AltGr
; # = Windows

; Hotkeys

#IfWinActive ahk_group players
	F10::Send {Volume_Mute}
	F11::Send {Volume_Down}
	F12::Send {Volume_Up}

#IfWinNotActive ahk_group code_editors
	<^Space::Send, {Enter}	; LCtrl+Space = Enter (Return)

#IfWinActive ahk_class CabinetWClass
	Media_Play_Pause::F19

#IfWinActive

PrintScreen::Send, #+s

>^PrintScreen::
{
	Send, #x
	Sleep, 400
	Send, {Up}
	Send, {Up}
	Send, {Right}
	Send, {Down}
	Send, {Enter}
	return
}

<#Esc::
{
	Send, #x
	Sleep, 400
	Send, {Up}
	Send, {Up}
	Send, {Right}
	Send, {Down}
	Send, {Down}
	Send, {Enter}
	return
}

Pause::Media_Play_Pause

<^>!d::Run Downloads

<^>!a::Run edit zero_hotkeys.ahk
<^>!z::Reload

<^>!p::Run putty.exe -load "piZero" -pw "pizero!",, Max

<^>!Insert::Winset, Alwaysontop,,A

<#1::
{
	Send #p
	Sleep, 1000
	Send {Down}
	Send, {Enter}
	Sleep, 1000
	Send, {Escape}
	return
}

<#2::
{
	Send #p
	Sleep, 1000
	Send, {Up}
	Send, {Enter}
	Sleep, 1000
	Send, {Escape}
	return
}


; Shortcuts
<^>!n::Run notepad++.exe
<^>!f::Run foobar2000.exe
; <^>!p::Run putty.exe
<^>!s::Run SpeQ Mathematics.exe
<^>!v::Run C:\Program Files (x86)\Vial\Vial.exe
<^>!k::Run C:\Program Files\KiCad\bin\kicad.exe
<^>!c::Run C:\Program Files\FreeCAD 0.19\bin\FreeCAD.exe
<^>!q::Run C:\Program Files\qBittorrent\qBittorrent.exe
<^>!o::Run opera.exe
<^>!i::Run C:\Program Files\Inkscape\bin\inkscape.exe
<^>!t::Run C:\Program Files\Sublime Text\sublime_text.exe
<^>!g::Run C:\Program Files\Git\git-bash.exe --cd-to-home
<^>!y::Run C:\Users\ASUS\AppData\Roaming\Spotify\Spotify.exe