#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\placementsettings.ahk

MacroName := "AV Love Portal"
discord_link := "https://discord.gg/YTAAf4s6xX"
current_version := "v1.1.2"
starting_map := [
    "Namek",
    "Spirit Society",
    "Double Dungeon",
    "Underground Church",
]
wins := 0
totalMatch := 0

global current_map := "Lobby"

Jeff := "Lib\Assets\Jeff.png"
Close := "Lib\Assets\Close.png"
Minimize := "Lib\Assets\Minimize.png"
DiscordLogo := "Lib\Assets\DiscordLogo.png"

guideText := "f1 - Align Roblox`nf2 - Run Macro`nf3 - Stop Macro`nf4 - Test Webhook"
lastlog := ""


JeffGui := Gui("-Caption +Border +AlwaysOnTop", "Salmon Macro")
JeffGui.SetFont("s12 bold cFFFFFF", "Consolas")
JeffGui.BackColor := "0b1329"

JeffGui.Add("Picture", "x1200 y10 w60 h60 +BackgroundTrans cffffff", Jeff)
Discord := JeffGui.Add("Picture", "x1110 y10 w89 h50 +BackgroundTrans cffffff", DiscordLogo)
Discord.OnEvent("Click", (*) => OpenDiscord())

;close button
CloseBttn := JeffGui.Add("Picture", "x1340 y10 w50 h50 +BackgroundTrans cffffff", Close)
CloseBttn.OnEvent("Click", (*) => ExitApp())

MinimizeBttn := JeffGui.Add("Picture", "x1280 y10 w50 h50 +BackgroundTrans cffffff", Minimize)
MinimizeBttn.OnEvent("Click", (*) => MinimizeGUI())

JeffGui.AddProgress("c0x7e4141 x308 y27 w800 h598", 100) ; box behind roblox, credits to yuh for this idea
WinSetTransColor("0x7e4141 255", JeffGui)


JeffGui.Add("Text", "x20 y15 w270 h20 cffffff +Center", "Salmon's Macro")

; Map
JeffGui.Add("GroupBox", "x20 y40 w270 h80 cfffff +Center", "Map")
MapLogs := JeffGui.Add("Text", "x35 y70 w240 h20 c96d0ff +Center", current_map)

; ---------------------------------------------------------------

;Statistic
JeffGui.Add("GroupBox", "x20 y140 w270 h200 cfffff +Center", "Statistic")
WinLogs := JeffGui.Add("Text", "x35 y170 w240 h20 c96d0ff +Center", "Match win: " wins "/" totalMatch)

; ---------------------------------------------------------------

;Logs -----------------------------------------------------------
JeffGui.Add("GroupBox", "x20 y360 w270 h265 cfffff +Center", "Logs")
ActivityLogs := JeffGui.Add("Text", "x35 y390 w240 h210 c96d0ff +Center", "Macro Launch")

; ---------------------------------------------------------------

; Macro Name
JeffGui.SetFont("s16 bold cFFFFFF", "Consolas")
JeffGui.Add("Text", "x1130 y90 w250 h30 cfff021 +Center", MacroName)
JeffGui.SetFont("s12 bold cFFFFFF", "Consolas")

; ---------------------------------------------------------------

;Current version
JeffGui.Add("GroupBox", "x1130 y140 w250 h70 cfffff +Center", "Current version")
Version := JeffGui.Add("Text", "x1140 y170 w230 h20 c96d0ff +Center", current_version)

; ---------------------------------------------------------------

;Settings
JeffGui.Add("GroupBox", "x1130 y230 w250 h200 cfffff +Center", "Settings")
PlacementBttn := JeffGui.Add("Button", "x1140 y260 w230 h30 cffffff +BackgroundTrans +Center", "Placement settings")
PlacementBttn.OnEvent("Click", (*) => PlacementSettingUI())
WebhookBttn := JeffGui.Add("Button", "x1140 y300 w230 h30 cffffff +BackgroundTrans +Center", "Webhook settings")
WebhookBttn.OnEvent("Click", (*) => WebhookSettingsUI())
JeffGui.SetFont("s10 bold cFFFFFF", "Consolas")
JeffGui.Add("Text", "x1140 y340 w230 h20 cffffff +BackgroundTrans +Center", "Starting map")
global StartingLogs := JeffGui.Add("DropDownList", "x1140 y360 w230 +Center", starting_map)
StartingLogs.Choose(1)
JeffGui.Add("Text", "x1140 y390 w140 h20 cffffff +BackgroundTrans", "Join time (20s max):")
global WaitTimeLogs := JeffGui.Add("Edit", "x1290 y390 w80 h20 c000000", "20")

JeffGui.SetFont("s12 bold cfffff", "Consolas")

; ---------------------------------------------------------------

;Guide
JeffGui.Add("GroupBox", "x1130 y450 w250 h175 cfffff", "Guide")
global Guide := JeffGui.Add("Text", "x1140 y480 h130 w230", guideText)


JeffGui.Show("x27 y15 w1400 h665")

MinimizeGUI() {
    WinMinimize("Salmon Macro")
}

OpenDiscord() {
    Run(discord_link)
}

AddToLog(text) {
    global lastlog
    SendActivityLogsStatus := FileRead(SendActivityLogsFile, "UTF-8")
    ActivityLogs.Value := text "`n" ActivityLogs.Value
    if FileExist(SendActivityLogsFile) && (SendActivityLogsStatus = "1") {
        lastlog := text
        WebhookLog()
    }

}

updateCurrentMap(mapName) {
    MapLogs.Value := mapName
}

updateWin(status := false) {
    global wins, totalMatch
    totalMatch++
    if (status) {
        wins++
    }
    WinLogs.Value := "Match win: " wins "/" totalMatch
    Sleep 500
    InitiateWebhook(status)
}