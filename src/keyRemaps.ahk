; SC02B::
; Send <
; return

; +SC02B::
; Send >
; return

; SC01A::
; Send [
; return

; +SC01A::
; Send {{}
; return

; SC01B::
; Send {]}
; return

; +SC01B::
; Send {}}
; return

; SC028::
; Send ´
; return

; +SC028::
; Send {``}{Space}
; return

;Screenshot
PrintScreen::+#s

; Suspend
>^>+f12::
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
return

; ; Stealth mode
; Pause::
; Run C:\Users\carlo\AppData\Local\Microsoft\WindowsApps\wt.exe -p "Command Prompt" "C:\Users\carlo\Documents\os_scripts\Stealth Mode.bat"
; return


; ;program specific shortcuts
; #IfWinNotActive ahk_class Halo Infinite
; XButton1::Send ^#{Left}

; #IfWinNotActive ahk_class Halo Infinite
; XButton2::Send ^#{Right}