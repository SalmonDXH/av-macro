#Requires AutoHotkey v2.0 

#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\Discord-Webhook-master\lib\WEBHOOK.ahk
#Include %A_ScriptDir%\Lib\AHKv2-Gdip-master\Gdip_All.ahk
#Include %A_ScriptDir%\Lib\webhooksettings.ahk
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\otherfuncs.ahk
#Include %A_ScriptDir%\Lib\startMacro.ahk
; #Include %A_ScriptDir%\Lib\webhooksettings.ahk
SendMode "Event"

RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"

global autoMacro := false
global MacroStartTime := A_TickCount


F1:: {
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(327, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Salmon Macro") {
        Sleep 50
        WinActivate("Salmon Macro")
        Sleep 100
    }
}

F2::{
    global MacroStartTime, autoMacro
    autoMacro := true
    MacroStartTime := A_TickCount
    AddToLog("Start Macro")
    
    StartMacro()
    
}

F3:: {
    global MacroStartTime, autoMacro
    autoMacro := false
    StopMacro()
}

F4::{
    AddToLog("Testing Webhook")
    InitiateWebhook()
}