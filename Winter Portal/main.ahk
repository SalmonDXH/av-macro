#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\Discord-Webhook-master\lib\WEBHOOK.ahk
#Include %A_ScriptDir%\Lib\AHKv2-Gdip-master\Gdip_All.ahk
#Include %A_ScriptDir%\Lib\webhooksettings.ahk
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\otherfuncs.ahk
#Include %A_ScriptDir%\Lib\portalfuncs.ahk
#Include %A_ScriptDir%\Lib\placeUnit.ahk
; #Include %A_ScriptDir%\Lib\webhooksettings.ahk
SendMode "Event"

RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"

; Image detected
Lobby := "|<>**50$44.yS1zy00BgUPRU03D/zrSTzlXzxryzw0kPQC6HNBarNglqnNhqPgRwkPA62LNiKnLljzzzzzzzs"

global MacroStartTime := A_TickCount
global autoMacro := false
global mapStarter := 0
global JoinTimer := 1000

global webhook := ""
global DiscordUserID := ""

WebhookURLFile := "Lib\Settings\WebhookURL.txt"
if FileExist(WebhookURLFile) {
    WebhookURL := FileRead(WebhookURLFile, "UTF-8")
    if (WebhookURL != "") {
        webhook := WebHookBuilder(WebhookURL) ;
    }
}


F1:: {
    if WinExist("Salmon Macro") {
        Sleep 50
        WinActivate("Salmon Macro")
        Sleep 100
    }
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(327, 15, 800, 600, RobloxWindow)
        Sleep 50
    }

}

F2:: {
    global MacroStartTime, autoMacro, mapStarter, JoinTimer
    autoMacro := true
    MacroStartTime := A_TickCount
    portalcoord := false
    AddToLog("Start Macro")
    UpdateUnits()
    if (LobbyCheck()) {
        mapStarter := Integer(StartingLogs.Value)
        JoinTimer := Integer(WaitTimeLogs.Value)
        AddToLog("Found lobby")
        SendInput("j")
        Sleep 500
        if (portalcoord := SearchForPortal("Winter", mapStarter)) {
            AddToLog("Waiting " JoinTimer "s for others to join the portal")
            BetterClick(xportal + portalcoord[1], yportal + portalcoord[2]) ; click portal
            Sleep 50
            BetterClick(xstartportal + portalcoord[1], ystartportal + portalcoord[2])
            sleep 500
            BetterClick(373, 302) ; create
            Sleep 500
            BetterClick(410, 311) ; cancel
            Sleep JoinTimer * 1000
            BetterClick(545, 470) ; Start portal
            updateCurrentMap(mapStarter)
            Sleep 30000
            StartPlaying()
        } else {
            AddToLog("No portal found, macro stop")
            autoMacro := false
        }
    }

}

F3:: {
    global MacroStartTime, autoMacro
    autoMacro := false
    StopMacro()
}

F4:: {
    AddToLog("Testing Webhook")
    InitiateWebhook(true)
}

;F5::{
;    AddToLog(StartingLogs.Text)
;}

LobbyCheck() {
    if WinExist("Salmon Macro") {
        WinActivate("Salmon Macro")
    }

    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        WinMove(327, 15, 800, 600, RobloxWindow)
    } else {
        MsgBox("You must have ROBLOX open in order to start the macro (microsoft roblox doesnt work)", "Error T4", "+0x1000",)
        return false
    }

    if (WinExist("Webhook Settings") || WinExist("Placement UI")) {
        MsgBox("You must close all GUIs from this macro (guides/settings) in order to start the macro!", "Error T2", "+0x1000",)
        return false
    }
    SendInput("/")
    Sleep 100
    BetterClick(140, 32) ; Close chat
    Sleep 200
    BetterClick(641, 74) ; close lb
    Sleep 500
    BetterClick(665, 146) ; close updatelog
    Sleep 200

    if (ok := FindText(&X, &Y, 1059, 430, 1132, 513, 0, 0, Lobby)) {
        return true
    } else {
        MsgBox("You must be in lobby to start macro, if you already in the lobby check you ui scale", "Error T3", "+0x1000",)
        return false
    }


}