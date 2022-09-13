#include desktopSwitcher.ahk
#include keyRemaps.ahk


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


CapsLock::
	Menu, Tray, Icon , .\Lock.ico, , 
	KeyWait, CapsLock
	If (A_PriorKey="CapsLock")
		SetCapsLockState, Off
	Menu, Tray, Icon , .\Unlock.ico, , 
Return

#If, GetKeyState("CapsLock", "P") ;Your CapsLock hotkeys go below

; Media Keys
q::send {Volume_Down}
w::send {volume_up}
a::media_prev
s::media_play_pause
d::media_next

; Open / Close deezer
e:: 
if WinExist("ahk_exe Deezer.exe") {
  if WinActive("ahk_exe Deezer.exe")
    {
      WinMinimize
      return
    }
  else 
    {
      WinActivate, ahk_exe Deezer.exe
    }
}
else 
  {
    Run "C:\Users\carlo\AppData\Local\Programs\deezer-desktop\Deezer.exe"
  }
return


WheelDown:: send ^{Tab}
WheelUp:: send ^+{Tab}

;Vs Code
v:: ;duplicate line
^!+v

; Write current date
$Z::                        
FormatTime, CurrentDateTime,, dd/MM/yy
SendInput %CurrentDateTime%
return


; Program Shortcuts
1::switchDesktopByNumber(1)
2::switchDesktopByNumber(2)
3::switchDesktopByNumber(3)
4::switchDesktopByNumber(4)
5::switchDesktopByNumber(5)
6::switchDesktopByNumber(6)

9:: Run "C:\Users\carlo\Documents\os_scripts\restart_dwm.lnk"

; Cycle through sound devices
j::
 run powershell.exe -windowstyle hidden ./ToggleSoundDevice.ps1,,hide
return	

; Toggle EQ
m::
 FileRead, eqActive, %ProgramFiles%\EqualizerAPO\config\eqActive.txt
 if (eqActive = "false") {
   FileDelete, %ProgramFiles%\EqualizerAPO\config\config.txt
   FileAppend, Include: headphones\headphones.txt`nInclude: speakers\speakers.txt, %ProgramFiles%\EqualizerAPO\config\config.txt
   FileDelete, %ProgramFiles%\EqualizerAPO\config\eqActive.txt
   FileAppend, true, %ProgramFiles%\EqualizerAPO\config\eqActive.txt
 } else if (eqActive = "true") {
   FileDelete, %ProgramFiles%\EqualizerAPO\config\config.txt
   FileDelete, %ProgramFiles%\EqualizerAPO\config\eqActive.txt
   FileAppend, false, %ProgramFiles%\EqualizerAPO\config\eqActive.txt
 } else {
    MsgBox 3 name is %audioProfileSelected%
 }
return





