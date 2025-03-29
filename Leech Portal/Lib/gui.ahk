#Requires AutoHotkey v2.0 

#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\placementsettings.ahk

title := "Salmon's Macro"
MacroName := "Portal Leecher"
discord_link := "https://discord.gg/YTAAf4s6xX"
current_version := "v1.0.0"
current_map := "Unknown"

global HeaderColor := "cfffff"
global TextColor := "c96d0ff"
global BackgroundColor := "0b1329"

portals := 0


Jeff := "Lib\Assets\Jeff.png"
Close := "Lib\Assets\Close.png"
Minimize := "Lib\Assets\Minimize.png"
DiscordLogo :=  "Lib\Assets\DiscordLogo.png"

guideText := "f1 - Align Roblox`nf2 - Run Macro`nf3 - Stop Macro`nf4 - Test Webhook"
lastlog := ""


JeffGui := Gui("-Caption +Border +AlwaysOnTop", "Salmon Macro")
JeffGui.SetFont("s12 bold cFFFFFF", "Consolas")
JeffGui.BackColor := BackgroundColor

JeffGui.Add("Picture", "x1200 y10 w60 h60 +BackgroundTrans cffffff",Jeff)
Discord := JeffGui.Add("Picture", "x1110 y10 w89 h50 +BackgroundTrans cffffff",DiscordLogo)
Discord.OnEvent("Click", (*) => OpenDiscord())

;close button
CloseBttn := JeffGui.Add("Picture", "x1340 y10 w50 h50 +BackgroundTrans cffffff", Close)
CloseBttn.OnEvent("Click", (*) => ExitApp())

MinimizeBttn := JeffGui.Add("Picture", "x1280 y10 w50 h50 +BackgroundTrans cffffff", Minimize)
MinimizeBttn.OnEvent("Click", (*) => MinimizeGUI())

JeffGui.AddProgress("c0x7e4141 x308 y27 w800 h598", 100) ; box behind roblox, credits to yuh for this idea
WinSetTransColor("0x7e4141 255", JeffGui)


JeffGui.Add("Text", "x20 y15 w270 h20 cffffff +Center", title)

; Map
JeffGui.Add("GroupBox","x20 y40 w270 h80 " HeaderColor " +Center","Map")
MapLogs := JeffGui.Add("Text", "x35 y70 w240 h20 " TextColor " +Center", current_map)

; ---------------------------------------------------------------

;Statistic
JeffGui.Add("GroupBox","x20 y140 w270 h200 " HeaderColor " +Center","Statistic")
PortalClaim := JeffGui.Add("Text", "x35 y170 w240 h50 " TextColor " +Center", "Portal claimed:`n" portals)

; ---------------------------------------------------------------

;Logs -----------------------------------------------------------
JeffGui.Add("GroupBox","x20 y360 w270 h265 " HeaderColor " +Center","Logs")
global ActivityLog := JeffGui.Add("Text", "x35 y390 w240 h210 " TextColor " +Center", "Macro Launch")

; ---------------------------------------------------------------

; Macro Name
JeffGui.SetFont("s16 bold cFFFFFF", "Consolas")
JeffGui.Add("Text", "x1130 y90 w250 h30 cfff021 +Center", MacroName)
JeffGui.SetFont("s12 bold cFFFFFF", "Consolas")

; ---------------------------------------------------------------

;Current version
JeffGui.Add("GroupBox","x1130 y140 w250 h70 " HeaderColor " +Center","Current version")
Version := JeffGui.Add("Text", "x1140 y170 w230 h20 " TextColor " +Center", current_version)

; ---------------------------------------------------------------

;Settings
JeffGui.Add("GroupBox","x1130 y230 w250 h200 " HeaderColor " +Center","Settings")
PlacementBttn := JeffGui.Add("Button","x1140 y260 w230 h30 cffffff +BackgroundTrans +Center", "Placement settings")
PlacementBttn.OnEvent("Click",(*)=>PlacementSettingUI())
WebhookBttn := JeffGui.Add("Button","x1140 y300 w230 h30 cffffff +BackgroundTrans +Center", "Webhook settings")
WebhookBttn.OnEvent("Click",(*)=>WebhookSettingsUI())
JeffGui.Add("Text","x1140 y365 w60 h30 cffffff +BackgroundTrans ", "Portal:")
PortalMap := JeffGui.Add("DropDownList","x1205 y360 w165 cffffff +Center", ["Winter", "Love"])
PortalMap.Choose(1)

; ---------------------------------------------------------------

;Guide
JeffGui.Add("GroupBox","x1130 y450 w250 h175 " HeaderColor " +Center","Guide")
Guide := JeffGui.Add("Text", "x1140 y480 h130 w230 " TextColor,guideText)



JeffGui.Show("x27 y15 w1400 h665")

MinimizeGUI() {
    WinMinimize("Salmon Macro")
}

OpenDiscord(){
    Run(discord_link)
}


updateClaim(){
    global portals
    portals++
    PortalClaim.Value := "Portal claimed:`n" portals
}