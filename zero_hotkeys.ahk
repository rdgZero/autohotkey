#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; 2 = A window's title can contain <name> anywhere inside it to be a match
SetTitleMatchMode, 2

;-------------------------------------------------------------------------
; Groups
;-------------------------------------------------------------------------

; Group - Audio and Video applications
GroupAdd, players, ahk_exe vlc.exe
GroupAdd, players, ahk_exe Spotify.exe
GroupAdd, players, YouTube

; Group - Text editors
GroupAdd, text_editors, ahk_exe sublime_text.exe
GroupAdd, text_editors, ahk_exe notepad++.exe

;-------------------------------------------------------------------------
; Notes
;-------------------------------------------------------------------------

; TrayTip [, Title, Text, Seconds, Options] -> TrayTip, Title, text, , 17
; <+ = Left Shift
; ^ = Ctrl
; >! = Right Alt
; <^>! = AltGr
; # = Windows

;-------------------------------------------------------------------------
; Context-sensitive Hotkeys
;-------------------------------------------------------------------------

; If active window is a audio/video player
#IfWinActive ahk_group players
	; Map F10 to Mute, F11 to Vol Down and F12 to Vol Up
	; Map AltGr to still be able to use F10, F11 and F12
	F10::Send {Volume_Mute}
	<^>!F10::Send {F10}

	F11::Send {Volume_Down}
	<^>!F11::Send {F11}

	F12::Send {Volume_Up}
	<^>!F12::Send {F12}

; If active window is not a text editor
#IfWinNotActive ahk_group text_editors
	; LCtrl+Space = Enter (Return)
	<^Space::Send {Enter}

; If windows file explorer is focused
#IfWinActive ahk_exe Explorer.EXE
	Media_Play_Pause::F19

; Disable context sensitivity
#IfWinActive

;-------------------------------------------------------------------------
; General Hotkeys
;-------------------------------------------------------------------------

; PrintScreen triggers the Snipping tool
PrintScreen::Send, #+s

Pause::Media_Play_Pause

; AltGr + d = Open the downloads folder in windows file explorer
<^>!d::Run Downloads

; AltGr + a = Edit this script
<^>!a::Run edit zero_hotkeys.ahk
; AltGr + r = Reload this script
<^>!r::Reload

; AltGr + Insert = Set the current focused window to always be on top
<^>!Insert::Winset, Alwaysontop,,A

; LWin + 1 = Second display only
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

; LWin + 2 = Extend screen to 2 displays
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

; RCtrl + PrintScreen = Put the computer to sleep
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

; LWin + Esc = Shut down computer
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

;-------------------------------------------------------------------------
; Shortcuts (<^>! is AltGr)
;-------------------------------------------------------------------------

<^>!n::Run notepad++.exe
<^>!f::Run foobar2000.exe
<^>!p::
{
	; Remove focus from the current window
	winActivate, ahk_class Shell_TrayWnd
	; While "p" is held down
	while GetKeyState("p", "P"){
		; if "1" is pressed
		if GetKeyState("1"){
			profile := ""
			passw := ""
			; Read the credentials from a .txt file
			Loop, read, zero_ahk_data.txt
			{
				field_array := StrSplit(A_LoopReadLine, ",")
				if (field_array[1] == "putty"){
					profile := field_array[2]
					passw := field_array[4]
					break
				}
			}
			; If the credentials were found, open the putty session in a maximised window
			if (profile != "" and passw != ""){
				Run putty.exe -load %profile% -pw %passw%,, Max
			}
			return
		}
	}
	; If only "p" was pressed, open putty normally
	Run putty.exe
	return
}
<^>!s::Run SpeQ Mathematics.exe
<^>!o::Run opera.exe
<^>!v::Run C:\Program Files (x86)\Vial\Vial.exe
<^>!k::Run C:\Program Files\KiCad\bin\kicad.exe
<^>!c::Run C:\Program Files\FreeCAD 0.19\bin\FreeCAD.exe
<^>!q::Run C:\Program Files\qBittorrent\qBittorrent.exe
<^>!i::Run C:\Program Files\Inkscape\bin\inkscape.exe
<^>!t::Run C:\Program Files\Sublime Text\sublime_text.exe
<^>!g::Run C:\Program Files\Git\git-bash.exe --cd-to-home
<^>!y::Run C:\Users\ASUS\AppData\Roaming\Spotify\Spotify.exe